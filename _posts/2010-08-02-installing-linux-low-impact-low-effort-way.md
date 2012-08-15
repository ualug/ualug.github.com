---
layout: post
title: "Installing Linux: the low-impact, low-effort way"
author: Jamie
published: true
---

#### This post is an archive cross-post from the old UALUG website. Links might be broken.

For those who have a machine running Windows and don’t want to change its drive setup to make room for Linux, Ubuntu Linux has a handy feature called Wubi which allows Ubuntu to be installed as an “application” under your Windows install. It makes a file on your Windows drive a few GB in size, installs Ubuntu inside this file, adds an option for itself in Windows’ boot loader, and you’re done. Because your drive partitions aren’t changed, there is very little opportunity for adversely affecting your Windows setup. If you find you don’t need Ubuntu any more, you can just go to your Control Panel and remove it from the list of installed programs and – presto! – you’ll never know it was ever there.

There are two ways to install Ubuntu using Wubi. One is to download the installer from [wubi-installer.org](http://wubi-installer.org), save it to your HD, and double-click the file. It will download an Ubuntu CD image and proceed from there. Or, if you already have a recent Ubuntu CD, just stick it in your drive, open it in Explorer, and double-click wubi.exe.

Whichever approach you choose, Wubi will ask which drive you want to install on, how much space to use, what you want to call your user account and which password you want to use. It defaults to using about half of your free space on your Windows drive, but you can change this if you want – less than about 5GB and you start to have trouble fitting your data and doing things like security updates etc. After you tell it to proceed, you can ignore it for a few minutes, and it will eventually want to reboot and start up Ubuntu for the first time to finish the install.

Caveat: While installing this way makes damaging your Windows install very unlikely, it makes your Linux install a bit more fragile (compared to installing Linux to a dedicated drive or partition of its own), and the install is now vulnerable to errors in the Windows filesystem. If you’re doing any work that you care about in your Ubuntu install, always back it up to another disk. Having a USB stick and copying your latest work to it just before shutting down or rebooting to Windows is a good way to do this.
