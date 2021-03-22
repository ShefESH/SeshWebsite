---
layout: default
title: Hack the Box Writeup - Academy
---

## Introduction

*Written by Mac*

This is our writeup for the Academy Box - we covered it in session on 01/03/21. If you have a membership, you can view the recording on [our Blackboard]({{ site.baseurl }}{% link sessions/access.html %}).

It was an easy rated box, based on the about-to-be-released [Academy](http://academy.hackthebox.eu) platform on Hack the Box. When I tackled Academy (early Nov 2020) I had only done 2 other Hack the Box boxes (and not for 4 months, only dipping into Tabby before giving up) so I was still essentially learning the ropes. However, I'd been watching a *lot* of Ippsec and me and Nick had been preparing the Enumeration session so I was getting much more comfortable with the general practices in attacking a box.

With that said, Academy was still a challenge! The initial foothold involved some Burp trickery to register an admin account, followed by the discovery of a subdomain and a leaked Laravel `APP_KEY`. The underlying vulnerability was a deserialisation vulnerability in Laravel; while I'd done some Laravel development at work, I hadn't even heard of deserialisation, so I used Metasploit to gain my foothold. When I came back to the box for the session in March I took a more detailed look at the vulnerability, and covered it in the [Advanced Web Hacking]({{ site.baseurl }}{% link /assets/wiki/Advanced Web Hacking - PDF.pdf %}) session.

Once we get a shell as `www-data` we could find a password in a `.env` file, and use it to login as User 1. From there the path to User 2 was hidden in a stack of logs, which was the least enjoyable part of the box for me. I spent a bit of time here fumbling around, especially as the data you were supposed to find was encoded so not easy to `grep` for. However, when we came back to the box I found out about a tool for searching logs, which made this stage of the box much easier.

Root was a very enjoyable part of the box, with some very simple enumeration revealing what you had to do. User 2 had sudo permissions on the `composer` binary, which allows the execution of arbitrary system commands when installing from a custom script. I enjoyed this a lot, as I knew *what* I was aiming for but still had to put some work in to get the implementation correct. It was a great way to ease me back into HTB as a relative beginner, and tests a lot of key priv esc skills. This made it a good candidate for a session!

With all that said, let's jump into the full writeup.

## Enumeration

### Nmap

We start off with an Nmap scan to discover what services are running on each of the box's ports

`nmap -sC -sV -v -oA nmap/ 10.10.10.215`

This gives us the following output:

```
Starting Nmap 7.80 ( https://nmap.org ) at 2020-11-12 14:18 GMT
NSE: Loaded 151 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 14:18
Completed NSE at 14:18, 0.00s elapsed
Initiating NSE at 14:18
Completed NSE at 14:18, 0.00s elapsed
Initiating NSE at 14:18
Completed NSE at 14:18, 0.00s elapsed
Initiating Ping Scan at 14:18
Scanning 10.10.10.215 [4 ports]
Completed Ping Scan at 14:18, 0.16s elapsed (1 total hosts)
Initiating SYN Stealth Scan at 14:18
Scanning academy.htb (10.10.10.215) [1000 ports]
Discovered open port 22/tcp on 10.10.10.215
Discovered open port 80/tcp on 10.10.10.215
Increasing send delay for 10.10.10.215 from 0 to 5 due to max_successful_tryno increase to 4
Increasing send delay for 10.10.10.215 from 5 to 10 due to 51 out of 168 dropped probes since last increase.
Increasing send delay for 10.10.10.215 from 10 to 20 due to max_successful_tryno increase to 5
Completed SYN Stealth Scan at 14:18, 13.32s elapsed (1000 total ports)
Initiating Service scan at 14:18
Scanning 2 services on academy.htb (10.10.10.215)
Completed Service scan at 14:19, 15.43s elapsed (2 services on 1 host)
NSE: Script scanning 10.10.10.215.
Initiating NSE at 14:19
Completed NSE at 14:20, 51.23s elapsed
Initiating NSE at 14:20
Completed NSE at 14:20, 9.22s elapsed
Initiating NSE at 14:20
Completed NSE at 14:20, 0.00s elapsed
Nmap scan report for academy.htb (10.10.10.215)
Host is up (0.013s latency).
Not shown: 998 closed ports
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.1 (Ubuntu Linux; protocol 2.0)
80/tcp open  http    Apache httpd 2.4.41 ((Ubuntu))
| http-methods: 
|_  Supported Methods: GET POST OPTIONS
|_http-server-header: Apache/2.4.41 (Ubuntu)
|_http-title: Hack The Box Academy
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

NSE: Script Post-scanning.
Initiating NSE at 14:20
Completed NSE at 14:20, 0.00s elapsed
Initiating NSE at 14:20
Completed NSE at 14:20, 0.00s elapsed
Initiating NSE at 14:20
Completed NSE at 14:20, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 90.63 seconds
           Raw packets sent: 1314 (57.792KB) | Rcvd: 1229 (49.168KB)
```

We can see that port 22 and 80 are open, suggesting SSH (standard) and a web server. The nmap scan also revealed the Virtual Host Domain of the website to be `academy.htb`, which we can add to our hosts file using `nano /etc/hosts`:

```
127.0.0.1       localhost
127.0.1.1       kali
10.10.10.215    academy.htb
```

This now allows us to visit the website at `https://academy.htb`

### Gobuster

Now we know port 80 is open we can set off a gobuster scan to discover some webpages.

After a brief look at the site, we can see it runs on php - so we use the `-x php` flag to append the `.php` extension to our requests.

```
gobuster dir -u http://academy.htb -w /usr/share/wordlists/dirb/common.txt -x php
===============================================================
Gobuster v3.0.1
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@_FireFart_)
===============================================================
[+] Url:            http://academy.htb
[+] Threads:        10
[+] Wordlist:       /usr/share/wordlists/dirb/common.txt
[+] Status codes:   200,204,301,302,307,401,403
[+] User Agent:     gobuster/3.0.1
[+] Extensions:     php
[+] Timeout:        10s
===============================================================
2021/03/22 22:43:09 Starting gobuster
===============================================================
/.hta (Status: 403)
/.hta.php (Status: 403)
/.htaccess (Status: 403)
/.htaccess.php (Status: 403)
/.htpasswd (Status: 403)
/.htpasswd.php (Status: 403)
/admin.php (Status: 200)
/admin.php (Status: 200)
/config.php (Status: 200)
/home.php (Status: 302)
/images (Status: 301)
/index.php (Status: 200)
/index.php (Status: 200)
/login.php (Status: 200)
/register.php (Status: 200)
/server-status (Status: 403)
===============================================================
2021/03/22 22:43:30 Finished
===============================================================
```

We see from this scan that there is an `admin.php` page that we are denied access to at this point - but after poking around the site we may be able to access it.


### academy.htb

The home page is pretty basic, and has a simple login form at `/login.php`. We can try a couple of basic tests, such as the common credentials `admin:password` and `admin:admin` (no success), and a basic SQL injection test in the username field by submitting a `'` character. The single quote is URL encoded in the request, and no SQL errors are thrown. We could try a basic injection with `' OR 1=1;--` in the username or password field, or set off `sqlmap`, but for now let's try registering an account and see if that unlocks anything interesting.

We can register an account at `/register.php`. This takes us to a mockup Academy e-learning page. All the links seem to be dead, and we don't seem to be able to do anything with the page. We also can't get into `/admin.php` still. So let's take a look at the register request in Burp Suite.

```
POST /register.php HTTP/1.1
Host: academy.htb
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Referer: http://academy.htb/register.php

Content-Type: application/x-www-form-urlencoded
Content-Length: 66
Cookie: PHPSESSID=gkrrf2lrjp1ge5qpsosje0un2n
Connection: close
Upgrade-Insecure-Requests: 1

uid=testuser&password=testpassword&confirm=testpassword&roleid=0
```

We see there is a `roleid` parameter in the request, but there was no Role ID field in the registration form. Inspecting the source code, we see the following hidden field: `<input type="hidden" value="0" name="roleid" />`. I suspect the `roleid` parameter may have something to do with the permissions of the new user.

Resubmitting this request with a new username and `roleid=1` successfully registers us an account - and when we visit `/admin.php`, we can see the page!
