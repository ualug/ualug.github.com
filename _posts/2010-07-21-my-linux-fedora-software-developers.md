---
layout: post
title: "My Linux: Fedora 13 for Software Developers"
author: Rob Connolly
published: true
---

#### This post is an archive cross-post from the old UALUG website. Links might be broken.

Hi Everyone,

This is (hopefully) the first in a series of posts in which members of the LUG will detail their personal Linux set-ups and what they use them for. I’m going to start out by detailing my set-up which is based on [Fedora 13](http://fedoraproject.org/get-fedora). As a Computer Systems Engineer use my system(s) largely for developing software, both for desktop platforms and embedded systems. Therefore this article isn’t really for those new to computers, but it should be of use to those who are tech-savvy on other platforms. I’ll start by giving a quick overview of how I came to be a Fedora user, give a description of Fedora as a distribution and then give an overview of my system.

### How I Got Here

I’ve been a user of Linux since about 2004, starting of with several different distributions such as early versions of [Ubuntu](http://ubuntu.com/), [Mandriva](http://www.mandriva.com/) and [OpenSuSE](http://www.opensuse.org/). I eventually settled with OpenSuSE for a while, dual-booting it with Windows, before moving to Ubuntu again with version 6.06. At this point I deleted my Windows install and never looked back, since then I’ve mainly been an Ubuntu user, but have dabbled with other distros such as [Crunchbang Linux](http://crunchbanglinux.org/) and [ArchLinux](http://archlinux.org/). I always came back to Ubuntu though, until I found Fedora. Fedora has all the things I like about Ubuntu, but seems to be aiming more at my level of user, whereas Ubuntu is focussing more and more towards new users. It also just seems to work for me, without me having to make major tweaks (which I don’t have time for!) and stays ahead of the curve of new technologies, with a new release every six months.

### About Fedora

Fedora is the community distribution of [Red Hat](http://www.redhat.com/), a commercial Linux company which produces its own [Red Hat Enterprise Linux (RHEL)](http://www.redhat.com/rhel/). Contributions and improvements in Fedora eventually feed their way into RHEL, which has historically left Fedora as somewhat of a testing ground for software not ready for RHEL. However, this is no longer true. Fedora is now a distribution which stands on it’s own two feet and is probably one of the most stable distributions I have used.

The Fedora community has a strong commitment to Free and Open Source Software and as such Fedora contains almost exclusively FOSS, with exceptions only being made where absolutely necessary – such as wifi firmwares, required to make most wifi cards work. As such things like MP3 playback don’t work on the default installation (although when you try to play one Fedora volunteers to install the correct software for you automatically). These things don’t really matter to much as all the software you could ever need is in either the Fedora repositories or the 3rd Party [RPMFusion](http://rpmfusion.org/) repository.

Fedora 13 is the latest version in the Fedora release series, release on the 25th May 2010. It brings some awesome new features which are detailed in the [release notes](https://fedoraproject.org/wiki/F13_one_page_release_notes) so I won’t give them here. It’s available on both a [live CD](http://mirror.ece.auckland.ac.nz/fedora/linux/releases/13/Live/) and a [DVD][3], the live CD comes with a pretty basic selection of software with the DVD having a larger selection available immediately, however everything is available via the online software repositories for both versions.

### My Fedora Set-up

I use Fedora on three different machines, my home desktop machine (which I’ll mainly be talking about here), my netbook (an [Asus Eee-PC 901](http://en.wikipedia.org/wiki/Asus_Eee_PC)) and the machine I use in the Lab at Uni. I keep all my machines set-up in a pretty similar way, so that I can work on any of them equally.

### My Fedora 13 Desktop

I originally installed Fedora on my home machine in the form of the 64-bit Live CD version. As I said earlier the live CD is fairly sparse it its selection of software. This is mainly due to space restrictions on the CD. I actually like this, it means I get a basic, but polished, operating system when I first install and then install the software I want. This isn’t a big deal due to the way in which software is managed in Fedora. Unlike the Windows platform where you have to seek out, download and manually install every piece of software you want, software in Fedora is stored in online repositories which are accessed via the package manager. The package manager downloads and installs the software and any other required software (dependencies) automatically. There are two package managers in Fedora, a graphical interface ([PackageKit](http://www.packagekit.org/)) and a command line interface ([Yum](http://linux.die.net/man/8/yum)). I tend to use the command line interface as I generally find it faster (as I usually know what I’m looking for). To install software via the command line use:

```
sudo yum install <package-name>
```

I’ve found that Fedora has a nice skew towards developers, with several nice packages which make things easier. For example in Fedora 13 there is the ability to install a full [Python](http://www.python.org/) 3.x stack alongside the default 2.x stack, a feature that will make moving programs between the two versions a lot easier. There are also some neat and useful packages such as cross-compilers for different architectures and platforms (something I had to build from scratch on Ubuntu). There is even a version of the [Mingw](http://www.mingw.org/) stack to compile your C/C++ programs for use on Windows machines.

I tend to install the following software for development:

 - [Git](http://git-scm.com/) – a version control system
 - [Gedit Plugins](http://live.gnome.org/Gedit/Plugins) – plugins for the GNOME text editor Gedit, which turn it into a very capable programmers editor
 - [Meld](http://meld.sourceforge.net/) – graphical source code merging tool
 - [Terminator](http://software.jessies.org/terminator) – multi-pane terminal emulator
 - [Python](http://www.python.org/) (already installed) – a flexible dynamic programming language
 - [Boost](http://www.boost.org/) – a set of C++ libraries
 - [GCC/G++](http://gcc.gnu.org/) – C and C++ compilers
 - [Make](http://www.gnu.org/software/make) – automated build system
 - [Java](http://www.java.com/) ([OpenJDK](http://openjdk.java.net/)) – for Java development
 - + any other libraries/tools I need when working on miscellaneous things

### Development Tools

In addition I tend to install the following other packages to give myself a fully functioning system:

 - [GPodder](http://gpodder.org/) – podcast client
 - [Thunderbird 3](http://www.mozillamessaging.com/thunderbird) – email client
 - [OpenOffice.org](http://www.openoffice.org/) – Fully featured office suite
 - [Banshee](http://banshee.fm/) – iTunes like media player/music manager
 - [VLC](http://www.videolan.org/vlc) – a media player that plays everything (if VLC can’t play it nothing can)
 - [Gnome-do](http://do.davebsd.com/) – an intelligent quick launcher program
 - [Getting Things GNOME](https://launchpad.net/gtg) – to do list manager
 - [GIMP](http://www.gimp.org/) – image editing application (comparable to Photoshop)
 - [Inkscape](http://www.inkscape.org/) – vector image editor
 - [Shutter](http://shutter-project.org/) – awesome screenshot taking application
 - [Squid](http://www.squid-cache.org/) – caching proxy server, to speed up web browsing on my home connection (a 1MBit satellite connection)
 - + other stuff for miscellaneous tasks I don’t do often


### Other Applications running on Fedora

Of course this is in addition to the software which is installed in the default Fedora installation, which includes a web browser ([Firefox](http://www.firefox.com/)), instant messenger client ([Empathy](http://live.gnome.org/Empathy)), [Twitter](http://twitter.com/)/[Identi.ca](http://identi.ca/) client ([Pino](http://pino-app.appspot.com/)), note taking application ([GNote](http://live.gnome.org/Gnote)), etc. I especially like the inclusion of Pino by default as its my preferred client for my favourite social network (Identi.ca).

In addition I also tweak my system by changing the default Fedora theme to the Glossy theme (which is installed by default). I like the default wallpaper so I tend not to change that. On my home machine I also turned on desktop effects which give me some nice 3D ‘eye-candy’ effects on the desktop. Conveniently this works perfectly with the new Open Source [Nouveau](http://nouveau.freedesktop.org/) driver for my Nvidia graphics card (although I had to install the ‘mesa-dri-drivers-experimental’ package).

### Conclusions

I think that’s pretty much all I have to say about my set-up, it’s pretty close to the default Fedora install, apart from the extra software I installed. I think this is good, it means after six years of changing distros I’ve found something which fits pretty well with minimal effort.

Thanks for reading, I wish you all luck with your own Linux experience.

Bye!

P.S. For those that missed the links in the text above, here are direct links to the Fedora ISO images, on the [Uni mirror](http://mirror.ece.auckland.ac.nz/):

 - [32 bit Live CD][1]
 - [64 bit Live CD][2]
 - [32 bit DVD][3]
 - [64 bit DVD][4]

[1]: http://mirror.ece.auckland.ac.nz/fedora/linux/releases/13/Live/i686/Fedora-13-i686-Live.iso
[2]: http://mirror.ece.auckland.ac.nz/fedora/linux/releases/13/Live/x86_64/Fedora-13-x86_64-Live.iso
[3]: http://mirror.ece.auckland.ac.nz/fedora/linux/releases/13/Fedora/i386/iso/Fedora-13-i386-DVD.iso
[4]: http://mirror.ece.auckland.ac.nz/fedora/linux/releases/13/Fedora/x86_64/iso/Fedora-13-x86_64-DVD.iso