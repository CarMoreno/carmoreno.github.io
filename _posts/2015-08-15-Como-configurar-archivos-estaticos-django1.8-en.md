---
layout: post
title: How to configure static files in Django 1.8?
date: 2015-08-15 18:46:24
author: Carlos Andrés Moreno
summary: Setting up static files in Django 1.8
categories: Django
thumbnail: django
tags:
- As
- set up
- static
- Django 1.8
lang: en
page_id: como-configurar-archivos-estaticos-django1.8
---
When I started learning Django I ran into a very annoying problem, **configuring static files**, such as images, style sheets and Javascript files, I had to Google for a while until I was finally able to find the solution after a few days of trying. That's why I wanted to write this little post explaining how to do it.

I assume that the reader has already started his Django project with the command `django-admin startproject <name_project>` and that he has previously created (and registered in `settings.py`) his application with `python manage.py startapp <name_app>`. With this in mind let's continue, open your `settings.py` file and include the following lines at the end of it:

{% highlight python %}
   #Configuring static files in Django
   STATICFILES_DIRS = (
       os.path.join(BASE_DIR, 'media'),
   )
   MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
{% endhighlight %}

In the first line we are telling Django that _the_ _directory_ of static files will be located in `<name_project>/media` and in the second line we are telling it that _the_ _root_ of the static files will be `<name_project>/media`, that is, the root of our project as such.

We must then go to the **root of our project** and create the `media` folder. It is somewhat redundant to have to specify where it will be saved, and the root where it will be saved. But you already know what Python is like...

> ...Explicit is better than implicit.

Ready, we have finished configuring our static files. Now, for example, when we want to use them in the templates, just do:

* **Template file**: _inside the `media` folder I made another folder called `css`, notice how I used the `static` tag
![template][1]

* **Style sheet:** called `styles.css` present in `media/css`
![styles][2]

When we use the `load staticfiles` tag we load the path of our static files directory, that is, `<name_project>/media`, then every time we write a `static` tag we will be referencing that path.

Well, that's all for now. If you have any questions, comments or concerns, or simply want to contribute something, you can leave your comment below. In the next post I will teach you how to configure Django 1.8 on Windows. {% highlight python %}print("See you soon"){% endhighlight %}

[1]: ../../../../../../images/2015-08-15/template.png
[2]: ../../../../../../images/2015-08-15/estilo.png

<small><i>Translated using GPT 5.3 Codex</i></small>
