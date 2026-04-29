---
layout: post
title: Github Pages and Jekyll... Pretty cool blog.
date: 2015-08-13 19:29:04
author: Carlos Andrés Moreno
summary: I'll explain how I made the site.
categories: Tutorials
thumbnail: jekyll
tags:
- As
- I did
- blog
lang: en
page_id: como-hice-el-blog
---
<!-- ![Thumper](http://www.webhostwhat.com/wp-content/uploads/host-jekyll-blog-github.jpg) -->
![Picture](../../../../../../images/2015-08-13/Github+Jekyll.jpg)
When the idea of creating this site came to mind, I was sure that I wanted to create it on a platform that I could manage, configure and organize myself. WordPress, Drupal or Blogspot? No. Surely a content manager or a blogger profile would not satisfy my desires, however you will tell me:

>Carlos, Wordpress or Blogspot is customizable and can be managed as well.

Yes, but not 100%, you always have that feeling of not wanting something on your site, and I say this because I have some friends who have their personal sites hosted somewhere like the ones already described (I hope they also read this post). Also in Blogspot for example, if Google decides that your content violates some terms and conditions they can close the site, and you are left without your precious content. After googling for a while I found something wonderful in [this post][1]: [Github][2] + [Jekyll][3], the decision was made. How did I do it? Let's get to it:

1. You must create an account on Github (if you don't already have one).
2. [Follow steps][4] to create a repository compatible with Github Pages, in short, that repo must have the name `<username_github>.github.io`, where `<username_github>` is your Github username.
3. [Find a template][5] that seems nice to you so that you can start your site based on it, then edit the variables in the `_config.yml` file of the chosen template. Of course, you can also start your templates from scratch.
4. Clone the repository you created earlier.
5. Upload the template you chose to that repository.

Wait about ten minutes and enter your Github Pages domain, that domain will be `<username_github>.github.io`, you should now see your site on the network. So far so good, we have already configured the part that corresponds to Github, now we are going to use Jekyll. Jekyll in short is a Ruby gem that allows us to manage our site locally, before uploading it to the network.

6. You must [Install Jekyll on Windows][6], the link will take you to a place where they explain it wonderfully, I'll tell you, you must have Ruby on your machine. If you are on a Mac, Ruby is already installed. 
7. Having comments at the end of each Post is easy if you use [Disqus][7], I leave you their website, you should have no problems setting it up. Create an account.
8. Edit your template: colors, font type, give it your personal touch (I'm still in this step ;)).

In each commit you make to your repository, the changes will be reflected instantly. Well I think that's all, I hope I haven't left anything untreated. If you have any questions, let me know below in the comments box. 
In the next post we will start with some web programming topics! {% highlight python %}print("See you soon"){% endhighlight %}

[1]: http://raulavila.com/2015/01/como-hice-el-blog/
[2]: https://github.com/
[3]: http://jekyllrb.com/
[4]: https://pages.github.com/
[5]: http://jekyllthemes.org/
[6]: http://yesez5.github.io/2014/04/08/instalar-jekyll-windows/
[7]: https://disqus.com/

<small><i>Translated using GPT 5.3 Codex</i></small>
