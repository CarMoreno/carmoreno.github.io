---
layout: post
title: How to configure Django 1.8 on Windows?
date: 2015-08-17 14:24:10
author: Carlos Andrés Moreno
summary: I explain how to configure Django 1.8 on Windows
categories: Django
thumbnail: django
tags:
- As
- set up
- Django 1.8
- Windows
lang: en
page_id: como-configurar-django1.8
---
Working with Python on any Windows distribution can be a headache if the correct configuration is not made in said operating system. The first time I installed Python on my laptop was truly an ordeal, it was very frustrating since all that the console gave me when I typed 'python' was an 'error, unrecognized command', well, I was stuck for a few days, and I also didn't want to use Linux, since if I chose that option, I had to: install some distribution, my IDES and my text editors on it. It just seemed like a lot of work to me.

But hey, this post tries to explain how to configure Django 1.8 on Windows, not Python; So I assume that the reader has Python installed and configured correctly on their machine. If not, I recommend [this entry][1], they explain the installation of said language very well, in addition to the great pip package and the virtual-env. If you still don't have pip and you work in Python, what are you waiting for to download it? Having said that, let's continue:

* Open the Windows console and write: `pip install django==1.8`, isn't it simple?
![installed][2]

* Now try putting this in your console: `django-admin --version`. You should get something like
`django-admin command not found`.
![denied][3]

This happens because we must configure the Windows environment variables. Let's get to it:

* Click on start, and then left click on computer, go to properties.
![step][4]

* We wait for the window to open and click where it says 'Advanced system configuration'
![step1][5]

* A window will open where we must click on `Environment variables`.
![step2][6]

* Select the variable called `Path` at the bottom, then click edit
![step3][7]

* A small window will open. In the part that says `Variable value` go to the end, put a 'semicolon' followed by the path where the Scripts folder is, said folder is inside the folder where Python was installed, in my case it was in `C:\Python27\Scripts`
![step4][8]

* Finally, click Accept to everything.

Now let's test if it worked, open a new prompt and put the command `django-admin --version` again, it should give you the version that you have downloaded of Django, in our case version 1.8 
![success][9]

It is a bit long, but it is not difficult to do, if you have any problems with the previous steps, do not hesitate to leave a comment below, I will respond as soon as possible. In the following posts, to make things interesting, we will start programming an intermediate level Django app. {% highlight python %}print("See you soon"){% endhighlight %}

[1]:https://aasanchez.wordpress.com/2013/09/20/django-en-windows-y-no-morir-en-el-intento/
[2]:../../../../../../images/2015-08-17/installed.png
[3]:../../../../../../images/2015-08-17/denied.png
[4]:../../../../../../images/2015-08-17/paso.png
[5]:../../../../../../images/2015-08-17/paso1.png
[6]:../../../../../../images/2015-08-17/paso2.png
[7]:../../../../../../images/2015-08-17/paso3.png
[8]:../../../../../../images/2015-08-17/paso4.png
[9]:../../../../../../images/2015-08-17/exito.png

<small><i>Translated using GPT 5.3 Codex</i></small>
