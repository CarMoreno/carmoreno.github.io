---
layout: post
title: What is the difference between HAVING and WHERE?
date: 2017-02-09 18:01:19
author: Carlos Andrés Moreno
summary: We review the operation of the HAVING and WHERE clauses and show their differences
  with a practical example.
categories: SQL
thumbnail: SQL
tags:
- SQL
- Databases
- Consultations
lang: en
page_id: diferencia-entre-having-y-where
---
# Introduction
These last few days I have been studying SQL, reviewing concepts that I had already seen at university and learning new ones, one of them is the _HAVING_ clause that, although I knew it existed, I never felt the need to use it and there were few exercises that I remember doing using this clause. Overall, as I delved deeper into the topic, I realized how useful it is to use it, minimizing queries and making them much more readable and intuitive.

But when I had already mastered and understood the use of _HAVING_, a question arose: Doesn't this statement do the same thing as the _WHERE_ clause? Searching the web I found some answers (in English) that guided me in this regard, but I did not find a clear and concise answer in Spanish (to date) that made clear the use and differences between both clauses.

For this reason, I have decided to write this article to make clear the fundamental difference between _HAVING_ and _WHERE_, as well as an example that shows such difference.

# Understanding HAVING and WHERE clauses

> _WHERE_ operates on **individual records**, while _HAVING_ operates on a **group of records**.

The above is the main difference between these two clauses. With _WHERE_ we can set a condition using **individual records**, those that meet this condition will be selected (deleted or updated); Now, with _HAVING_ we can establish a condition on a **group of records**, something very important is that _HAVING_ is usually accompanied by the _GROUP BY_ clause. The latter is the case given that _HAVING_ operates on the groups that _"returns"_ _GROUP BY_.

So: _WHERE_ on individual records and _HAVING_ on groups of records, however there is nothing better to internalize and fully understand a concept than a good example, and that is precisely what we are going to do next.

# Example

For this example I am using _Oracle Database Express Edition 11g_ along with _SQL Developer_ on Windows 10 64-bit. With the above clarified, let's begin:

* We create a table called movies, which stores code, name, director, release date, genre, director and box office information for a cinema's movies.

{% highlight sql %}
DROP TABLE movies;

-- We create the movies table

CREATE TABLE movies (
	code NUMBER(5) NOT NULL,
	name VARCHAR2(40) NOT NULL,
	director VARCHAR2(30) DEFAULT 'Unknown',
	release_date DATE,
	genus VARCHAR(20),
	collection NUMBER(20),
	PRIMARY KEY (code)
);
{% endhighlight %}

*Now let's insert some records.

{% highlight sql %}
INSERT INTO movies VALUES(1, 'The Hunger Games', DEFAULT, '08/01/2014', 'Science Fiction', 1200000);
INSERT INTO movies VALUES(2, 'Harry Potter and the Goblet of Fire', DEFAULT, '04/10/2012', 'Science Fiction', 6005400);
INSERT INTO movies VALUES(3, 'The Chronicles of Narnia', DEFAULT, '10/22/2008', 'Science Fiction', 5600098900);
INSERT INTO movies VALUES(4, 'Schindler's List', 'Steven Spielberg', '03/22/1999', 'Drama', 456000120);
INSERT INTO movies VALUES(5, 'The Passion of the Christ', 'Steven Spielberg', '08/19/2010', 'Drama', 456000120);
INSERT INTO movies VALUES(6, 'Another Spielberg', 'Steven Spielberg', '07/11/2014', 'Drama', 456000120);
INSERT INTO movies VALUES(7, 'Life is Beautiful', 'Roberto Benigni', '10/23/1998', 'Drama', 1256000000);
INSERT INTO movies VALUES(8, 'The Possible Lives of Mr. Nobody', 'Jaco Van Dormael', '06/11/2009', 'Science Fiction', 340009023);
INSERT INTO movies VALUES(10, 'Finding Nemo', 'Andrew Stanton', '06/02/2007', 'Children', 780003400);
INSERT INTO movies VALUES(11, 'Toy Story', 'Andrew Stanton', '12/22/2004', 'Children', 679000300);
INSERT INTO movies VALUES(12, 'Toy Story 2', 'Andrew Stanton', '06/11/2007', 'Children', 5500300030);
INSERT INTO movies VALUES(14, 'Toy Story 3', 'Andrew Stanton', '06/11/2012', 'Children', 880776000);
INSERT INTO movies VALUES(15, 'Cars', 'Andrew Stanton', '05/14/2005', 'Children', 459000200);
INSERT INTO movies VALUES(16, 'Spirited Away', 'Hayao Miyazaki', '12/22/2004', 'Children', 456700000);
INSERT INTO movies VALUES(17, 'My Neighbor Totoro', 'Hayao Miyazaki', '06/20/1992', 'Children', 5500300210);
INSERT INTO movies VALUES(18, 'The Wind Rises', 'Hayao Miyazaki', '01/11/2013', 'Children', 990776000);
INSERT INTO movies VALUES(19, 'Nausica of the Valley of the Wind', 'Hayao Miyazaki', '10/22/1989', 'Children', 669000200);
{% endhighlight %}

* Let's make some queries that involve the use of _HAVING_ and _WHERE_

{% highlight sql%}
/*1. An easy one: Obtain the total collection, grouped by gender and 
director*/

SELECT genre, director, SUM(receipt) AS TOTAL FROM movies
	GROUP BY genre, director;

{%endhighlight%}

![dot1](http://i.imgur.com/iHpxKUb.png)

{% highlight sql%}
/*2. Now we want to obtain the total collection, grouped by genre and director, taking into account only those films that raised more than 80 pesos*/
  
SELECT genre, director, SUM(receipt) AS TOTAL FROM movies
  GROUP BY genre, director
  HAVING SUM(collection) > 80;
{% endhighlight %}

![dot2](http://i.imgur.com/HfzAGNw.png)

{% highlight sql%}
/*3. Now we want to obtain the total collection, grouped by genre and director, without taking into account the films whose director is
unknown and taking into account only those films that grossed more than 80 pesos.*/

SELECT genre, director, SUM(receipt) AS TOTAL FROM movies
  WHERE director <> 'Unknown' AND director IS NOT NULL
  GROUP BY genre, director
  HAVING SUM(collection) > 80;
{% endhighlight %}
![dot3](http://i.imgur.com/Ema5mgB.png)

* The confusion that _WHERE_ does the same thing as _HAVING_ comes from the following:

{% highlight sql %}
/*We want to obtain the proceeds from films grouped by genre and director but only from those whose genre is drama.*/

-- With where...
SELECT genre, director, SUM(receipt) AS TOTAL FROM movies
  WHERE genre LIKE '%Drama%'
  GROUP BY genre, director;
{% endhighlight %}

![](http://i.imgur.com/t22nqn0.png)

{% highlight sql %}
--With having...
SELECT genre, director, SUM(receipt) AS TOTAL FROM movies
  GROUP BY genre, director
  HAVING genre LIKE '%Drama%';
{% endhighlight %}

![](http://i.imgur.com/xi5Tloh.png)

The two previous queries return the same records, but behave completely differently. In the first, we select genre, director and the sum of the collection **as long as the genre is 'Drama'** (_WHERE_) and later we group them by genre and director (_GROUP BY_).

In the second we select the genre, director and add up the collection, **regardless of whether the genre is 'Drama' or not**, then we group them by genre and director (_GROUP BY_). Finally, we select only the records whose genre is 'Drama' (_HAVING_). Also, if you paid attention, the result of the query made with _HAVING_ takes twice as long as the query made with WHERE (`0.008 sec` and `0.004 sec` respectively).

You may be wondering when to use _HAVING_ or _WHERE_? From my point of view, we should use _HAVING_ only when the use of group functions (`AVG`, `SUM`, `COUNT`, `MAX`, `MIN`) is involved, because with _WHERE_ we cannot make conditions that involve these functions. For example, if you try this, you will get an error:

{%highlight sql%}
/*Obtain the average collection of the films, grouped by director, taking into account only those averages less than 40 and with known author*/

SELECT director, AVG(receipt) AS AVERAGE FROM movies
  WHERE AVG(recaudo) < 40 AND director NOT LIKE '%Unknown%'  
  GROUP BY director; 
{%endhighlight%}

![error](http://i.imgur.com/iaAH8RO.png)

The previous query generates an error since we are using group functions with a _WHERE_ clause, which only operates on individual records, better try this:

{%highlight sql%}
/*Obtain the average collection of the films, grouped by director, taking into account only those averages less than 40 and with known author*/

SELECT director, AVG(receipt) AS AVERAGE FROM movies
  GROUP BY director
  HAVING AVG(collection) < 40 AND director NOT LIKE '%Unknown%'; 
{%endhighlight%}

![](http://i.imgur.com/qIXK8rX.png)

I then recommend using _HAVING_ when group functions are involved. If you have a simple condition that involves comparing individual fields then use _WHERE_ (e.g. that the name is equal to a string, that the collection of a record is less than a value, etc.)

and of course, if you have other recommendations you can leave your comment below, it is always good to share what you know.

# Conclusion

I hope that from this article you have learned that _WHERE_ and _HAVING_ behave differently even though sometimes they seem to do exactly the same thing. If you have any suggestions to make or want to contribute something else, you can leave them below in the comments. See you in a next entry.

{% highlight python %}print("See you soon"){% endhighlight %}

<small><i>Translated using GPT 5.3 Codex</i></small>
