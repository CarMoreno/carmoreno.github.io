---
layout: post
title: Pythonic Patterns Factory Pattern
date: 2016-01-06 21:10:12
author: Carlos Andrés Moreno
summary: Understanding the Factory design pattern.
categories: Python
thumbnail: cubes
tags:
- Design patterns
- Factory
- Design Patterns
lang: en
page_id: patron-factory
---
## Introduction

Today we are going to start a series of posts where we will study the most used design patterns in software development, each one will be accompanied by its corresponding coding; If you search on the net, you will find many examples of design patterns in Java. I want these entries to be somewhat different from the majority of articles on the Internet, so we will encode the examples in Python, version 2.7.9, and I will try to make myself understood as much as possible.

To follow these posts you must have a basic knowledge of Python Programming in addition to being clear about object-oriented programming concepts (what is a class, what is an object, what is inheritance, what is a method, an attribute, etc.). It would be a plus if you have already done some OOP with Python, although the latter is not essential.

## What is a software design pattern?

> One cup of milk, 6 eggs, 1/2 cup of water, sugar and two teaspoons of vanilla essence; First you must preheat the oven to 180°.

_"Design patterns are recipes"_ (at this moment I remember the professor who told me this for the first time), tested by many developers and who have attested that they work for certain problems, we just have to learn to use them in the appropriate contexts, since depending on the problem we will choose one or the other. Why should we go outside the standards? If we know that a pattern will provide the solution to a problem, we simply use it, there is no need to re-invent the wheel!

The quote that brings us together today is the **Factory** Design Pattern, we will understand how it works and at the end we will make a small example.

## What is the Factory Pattern?

The Factory pattern is part of the creation patterns. Let me explain, within the design patterns there are three categories:

1. Creation patterns.
2. Behavior patterns.
3. Structural patterns.

If you want to go a little deeper into these categories, you can [read more information about it][1].

As its name indicates, the idea of ​​this pattern is to have a factory that creates objects of different types. This is extremely useful when you do not know in advance which object to create, therefore they will be created at runtime. The factory uses parameters to determine what object it should create, we (obviously) must provide it with such parameters.

## Get to the factory!

What better than a good example to internalize what was previously explained, we will make a factory that creates people.

### Ingredients:
1. A super-class called `Person`.
2. Two classes that will be named `Male` and `Female`, these inherit from `Person`.
3. A class `Factory`, which will represent the factory as such.
4. A small file, which we will call `main` from where the application will be started.
5. Salt and pepper to taste :)

### Preparation:

In the following image you can see the files that I have created, all at the same level.

![structure][2]

Now let's look at what each of these have, in order.

1. Super Persona Class:

{% highlight python %}
"""
Class that defines a person
"""

class Person(object):
	"""For our case, a person will have a name,
	an age and a gender, usually
	in Java this class would be an 'interface' """
	def __init__(self):
		self.name = None
		self.age = None
		self.gender = None

# Some getters...
	def get_name(self):
		return self.name

def get_age(self):
		return self.age

def get_gender(self):
		return self.gender

def __str__(self):
		return "Information about a person:\n1. Name: {n}\n2. Age: {e}\n3. Gender: {g}".format(
			n=self.get_name(), e=self.get_age(), g=self.get_gender())
{% endhighlight %}

2. Women's Class:

{% highlight python %}
from persona import Persona

class Feminine (Person): 
	"""This class inherits from the super class Person,
	we will only define its constructor"""
	
	def __init__(self, name, age, gender):
		self.name = name
		self.age = age
		self.gender = gender
		print "Hello Miss "+name+" your age is "+str(age)
{% endhighlight %}

3. Male Class:

{% highlight python %}
from persona import Persona

class Male(Person): # We inherit from Person
	"""This class inherits from the super class Person,
	we will only define its constructor"""

def __init__(self, name, age, gender):
		self.name = name
		self.age = age
		self.gender = gender
		print "Hello mister "+name+" your age is "+str(age)
{% endhighlight %}


4. Factory Class:

{% highlight python %}
from feminine import Feminine
from masculine import Masculine

class Factory(object):
	"""This class is our factory, as you already know
	Python defines a constructor with no arguments 
	by default for each class, so it is not necessary 
	write one"""

def get_person(self, name, gender, age):
		"""Method that returns person objects according to gender"""

#gender is the parameter used by the factory 
		#to choose the obj to create
		if (gender is 'F'): 
			return Female(name, age, gender)
		elif (gender is 'M'):
			return Male(name, age, gender)
{% endhighlight %}

5. Main file:

{% highlight python %}
import factory
if __name__ == '__main__':
	my_factory = factory.Factory()

#Factory, create a person!
	person = my_factory.get_persona('Guido Vann Rosum', 'M', 30)
	#a male person has been created
	print person 
	# print person.get_name()
	# print person.get_gender()
{% endhighlight %}

Things to say here:

1. In the `Person` class the _magic_ method_ `__str__` has been overwritten, so that it returns a small personalized message to our liking.

2. In this case the parameter used by the factory to decide which object to create is a _char_ that refers to the gender.

3. In the `main` file, when we write _print persona_, we are using the `__str__` magic method (which was previously customized) to display information about the object.

4. We can make use of other methods defined in `Person` such as `get_name()` or `get_gender()`, this thanks to the fact that the created object (`Male` object) inherits from `Person` (an _is-a_ relationship). I have commented the above in the main file, you can uncomment if you want.

### How about we try the recipe?:

Open a terminal and run the `main` file, you should see something like this:

![result][3]

A Person object has been created, specifically of the Male gender, we have passed the character 'M' to the constructor, therefore the factory has decided to create a Male object.

The dish looks good, doesn't it? I encourage you to now create a 'Female' object and see what happens, you can also add more methods, try with other parameters and why not, introduce other classes; Remember that you can comment if you have any questions. That being said, see you in a next post.

{% highlight python %}print("See you soon"){% endhighlight %}

[1]:https://es.wikipedia.org/wiki/Patr%C3%B3n_de_dise%C3%B1o
[2]:../../../../../../images/2016-01-06/structure.png
[3]:../../../../../../images/2016-01-06/answer.png

<small><i>Translated using GPT 5.3 Codex</i></small>
