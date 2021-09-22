---
layout: default
title: Fundamental Skills Index
---

# Contents
- [Fundamental Skills Index](#fundamental-skills-index)
  - [Intro](#intro)
  - [How to Use This Series](#how-to-use-this-series)
  - [Learning Path](#learning-path)
    - [Optional/Supplementary Skills](#optional/supplementary-skills)
  - [Full List, By Category](#full-list,-by-category)
    - [Web](#web)
    - [Networking](#networking)
    - [Linux](#linux)
    - [Windows](#windows)
    - [Tools](#tools)
    - [Penetration Testing Skills](#penetration-testing-skills)
    - [Automation](#automation)
    - [Misc](#misc)

## Intro

Although we aim to teach you most of the skills you'll need to become an ethical hacker, it's good to have a core understanding of the basic concepts, tools, and techniques before some of our more advanced sessions!

These *fundamental skills* include:
- understanding how requests over the internet (*HTTP Requests*) are structured
- understanding how to navigate Windows and Linux machines using a *Command Line Interface*
- the use of core tools such as port scanners and web proxies

We will aim to teach these skills to you in person in the first few sessions of the semester - for example, in 2021 we have an *Introduction to Web Hacking* session in Week 2, and an *Operating System Security* session in Week 5.

However, if you can't make our first sessions or simply want a refresher, this series will be perfect for you!

As the semester continues, we will cover more advanced topics and eventually progress to hacking some machines from start to finish! By then it will be useful to know the basics so you can keep up with demos and focus on the trickier concepts.

## How to Use This Series

There are several key skills in this series, each with a category (e.g. *Linux* or *Web*) and a respective experience level (*complete beginner*, *novice*, and *intermediate*).

*Complete beginner* skills aim to teach a core concept's theory.

*Novice* skills focus on a practical tool or a trickier concept.

*Intermediate* skills may be a practical tool that relies on knowledge of other core concepts, such as basic networking.

Each skill has an individual page (on our website) or an individual note (if you're viewing this in Obsidian). Each skill page contains:
- a short piece of reading that goes over the basics of the skill
- example commands and screenshots of the skill in use
- a cheatsheet of commands you may want to use
- a short worksheet, with some self-assessed activities you can use to reinforce what you've learned

Where appropriate, we may also post short video demos or a link to an interactive exercise that you can try. We will also always try to provide a *Going Further* section, with links to extra activities on other platforms you can use to test your skills.

*Note:* You can also view these lessons on Git: [https://github.com/ShefESH/FundamentalSkills](https://github.com/ShefESH/FundamentalSkills)

## Learning Path

*Note:* not all of the lessons detailed below are written yet. Consider this a roadmap for what we want to include!

For all our sessions, especially the Give it a Go sessions, we aim to be able to teach the content to you from scratch. However, if you *want* to prepare in advance (and you really don't have to!) we recommend the following:

- If you're attending the Web Hacking Give it a Go session:
	- [Web 1 - Inspecting a Webpage](https://shefesh.com/wiki/fundamental-skills/Web-1---Inspecting-a-Webpage.pdf)
	- [Web 2 - Understanding HTTP Requests](https://shefesh.com/wiki/fundamental-skills/Web-2---Understanding-HTTP-Requests.pdf)
- If you're attending the Linux Give it a Go session:
	- [Misc - Setting up a Virtual Machine](https://shefesh.com/wiki/fundamental-skills/misc---setting-up-a-virtual-machine.pdf)
	- [Linux 1 - Navigating a File System](https://shefesh.com/wiki/fundamental-skills/linux-1---navigating-a-file-system.pdf)
	- [Linux 2 - Downloading Files and Packages](https://shefesh.com/wiki/fundamental-skills/linux-2---downloading-files-and-packages.pdf)
- To prep for the Automation session:
	- [Automation 1 - Bash Scripting](https://shefesh.com/wiki/fundamental-skills/automation-1---bash-scripting.pdf)
	- [Automation 2 - Python Scripting](https://shefesh.com/wiki/fundamental-skills/automation-2---python-scripting.pdf)
- To prep for the early web hacking sessions:
	- [Misc - Recognising Common Encodings](https://shefesh.com/wiki/fundamental-skills/misc---recognising-common-encodings.pdf)
	- [Tools 1 - Curl](https://shefesh.com/wiki/fundamental-skills/tools-1---curl.pdf)
	- [Web 3 - Burp Suite](https://shefesh.com/wiki/fundamental-skills/web-3---burp-suite.pdf)
	- [Web 4 - Common Site Features](https://shefesh.com/wiki/fundamental-skills/web-4---common-site-features.pdf)
	- [Web 5 - Web Security Overview](https://shefesh.com/wiki/fundamental-skills/web-5---web-security-overview.pdf)
	- [Tools 2 - Feroxbuster](https://shefesh.com/wiki/fundamental-skills/tools-2---feroxbuster.pdf)
- To sure up your networking knowledge:
	- [Networking 1 - IP & DNS](https://shefesh.com/wiki/fundamental-skills/networking-1---ip-&-dns.pdf)
	- [Networking 2 - Protocols](https://shefesh.com/wiki/fundamental-skills/networking-2---protocols.pdf)
	- [Networking 3 - Proxies](https://shefesh.com/wiki/fundamental-skills/networking-3---proxies.pdf)
	- [Tools 3 - Nmap](https://shefesh.com/wiki/fundamental-skills/tools-3---nmap.pdf)
	- [Tools 4 - Wireshark](https://shefesh.com/wiki/fundamental-skills/tools-4---wireshark.pdf)
- To prep for the Operating Systems session:
	- [Linux 3 - File Permissions](https://shefesh.com/wiki/fundamental-skills/linux-3---file-permissions.pdf)
	- [Windows 1 - Windows Command Lines](https://shefesh.com/wiki/fundamental-skills/windows-1---windows-command-lines.pdf)
- To prepare for hacking your first box!
	- [Pentesting 1 - Outline of a Penetration Test](https://shefesh.com/wiki/fundamental-skills/pentesting-1---outline-of-a-penetration-test.pdf)
	- [Tools 5 - Netcat](https://shefesh.com/wiki/fundamental-skills/tools-5---netcat.pdf)
	- [Pentesting 2 - Basics of Shells](https://shefesh.com/wiki/fundamental-skills/pentesting-2---basics-of-shells.pdf)
	- [Pentesting 3 - File Transfers](https://shefesh.com/wiki/fundamental-skills/pentesting-3---file-transfers.pdf)
	- [Pentesting 4 - Remote Access to a Computer](https://shefesh.com/wiki/fundamental-skills/pentesting-4---remote-access-to-a-computer.pdf)

Remember, these are the fundamentals you'll need for each stage - we don't expect you to be able to own a system after reading all the pentesting lessons, but you will need to know them if you set out to do one on your own. We'll teach you skills regarding specific exploits in the relevant sessions.

## Full List, By Category

*Note:* not all of the lessons detailed below are written yet. Consider this a roadmap for what we want to include!

### Web

Inspecting Webpages with the Developer Tools: [Web 1 - Inspecting a Webpage](https://shefesh.com/wiki/fundamental-skills/web-1---inspecting-a-webpage.pdf)

The Fundamentals of Web Requests: [Web 2 - Understanding HTTP Requests](https://shefesh.com/wiki/fundamental-skills/web-2---understanding-http-requests.pdf)

Learning to Use a Powerful Web Proxy: [Web 3 - Burp Suite](https://shefesh.com/wiki/fundamental-skills/web-3---burp-suite.pdf)

Site Technologies & Features: [Web 4 - Common Site Features](https://shefesh.com/wiki/fundamental-skills/web-4---common-site-features.pdf)

An Overview of Site Security: [Web 5 - Web Security Overview](https://shefesh.com/wiki/fundamental-skills/web-5---web-security-overview.pdf)

### Networking

Locating Hosts on the Internet: [Networking 1 - IP & DNS](https://shefesh.com/wiki/fundamental-skills/networking-1---ip-&-dns.pdf)

How Hosts Communicate: [Networking 2 - Protocols](https://shefesh.com/wiki/fundamental-skills/networking-2---protocols.pdf)

Using Proxies to View and Redirect Traffic: [Networking 3 - Proxies](https://shefesh.com/wiki/fundamental-skills/networking-3---proxies.pdf)

### Linux

The Linux File System: [Linux 1 - Navigating a File System](https://shefesh.com/wiki/fundamental-skills/linux-1---navigating-a-file-system.pdf)

Installing New Software: [Linux 2 - Downloading Files and Packages](https://shefesh.com/wiki/fundamental-skills/linux-2---downloading-files-and-packages.pdf)

Linux File Permissions: [Linux 3 - File Permissions](https://shefesh.com/wiki/fundamental-skills/linux-3---file-permissions.pdf)

### Windows

Using Different Windows Command Line Interfaces: [Windows 1 - Windows Command Lines](https://shefesh.com/wiki/fundamental-skills/windows-1---windows-command-lines.pdf)

### Tools

Curl, a useful command line tool for making HTTP requests: [Tools 1 - Curl](https://shefesh.com/wiki/fundamental-skills/tools-1---curl.pdf)

Feroxbuster, a scanner for finding hidden pages on a website: [Tools 2 - Feroxbuster](https://shefesh.com/wiki/fundamental-skills/tools-2---feroxbuster.pdf)

Nmap, a powerful port scanner: [Tools 3 - Nmap](https://shefesh.com/wiki/fundamental-skills/tools-3---nmap.pdf)

Wireshark, a network monitoring tool: [Tools 4 - Wireshark](https://shefesh.com/wiki/fundamental-skills/tools-4---wireshark.pdf)

Netcat, a networking 'swiss-army knife': [Tools 5 - Netcat](https://shefesh.com/wiki/fundamental-skills/tools-5---netcat.pdf)

### Penetration Testing Skills

Outline of a Penetration Test: [Pentesting 1 - Outline of a Penetration Test](https://shefesh.com/wiki/fundamental-skills/pentesting-1---outline-of-a-penetration-test.pdf)

Basics of Shells: [Pentesting 2 - Basics of Shells](https://shefesh.com/wiki/fundamental-skills/pentesting-2---basics-of-shells.pdf)

File Transfers: [Pentesting 3 - File Transfers](https://shefesh.com/wiki/fundamental-skills/pentesting-3---file-transfers.pdf)

Accessing a Computer Remotely: [Pentesting 4 - Remote Access to a Computer](https://shefesh.com/wiki/fundamental-skills/pentesting-4---remote-access-to-a-computer.pdf)

### Automation

Automation with Bash: [Automation 1 - Bash Scripting](https://shefesh.com/wiki/fundamental-skills/automation-1---bash-scripting.pdf)

Automation with Python: [Automation 2 - Python Scripting](https://shefesh.com/wiki/fundamental-skills/automation-2---python-scripting.pdf)

### Misc

Setting up a Virtual Machine for Practicing Linux: [Misc - Setting up a Virtual Machine](https://shefesh.com/wiki/fundamental-skills/misc---setting-up-a-virtual-machine.pdf)

Recognising Common Character Encodings: [Misc - Recognising Common Encodings](https://shefesh.com/wiki/fundamental-skills/misc---recognising-common-encodings.pdf)