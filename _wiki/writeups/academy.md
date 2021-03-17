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


