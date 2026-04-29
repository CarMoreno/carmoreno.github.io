---
layout: post
title: Python with Super Powers - Object Oriented Programming
date: 2020-03-03 10:49:19
author: Carlos Andrés Moreno
summary: In this article the concepts of Object Oriented Programming are explained
  and we give examples of the concepts seen using Python.
categories: Python
thumbnail: python
tags:
- OOP
- Python
lang: en
page_id: programacion-orientada-objetos-python-poo-herencia-composicion-clase-objeto-encapsulacion
---
# Introduction

For a long time I wanted to write about object-oriented programming with Python, but lately I have not had enough time to write again as I would like, and personally I prefer to write slowly, calmly and with time, this allows me to create quality posts and not just write for the sake of writing. Right now I have finally had some time and I have decided to build this post.

It will be a fairly extensive article, since the idea is to cover all the concepts of object-oriented programming and make examples in Python to put what has been learned into code. Before I start, I mention that I am using Python version 3.7 on Windows 10 64-bit.

# Object Oriented Programming Concepts

Yes, there are tons of places where you can find information about the different concepts of object-oriented programming, I will try to be as concise and clear when explaining each of them.

## Class

A class is a set of properties and behaviors that define a particular entity. For example, think of a Car. All cars have 4 tires, a make, a color, model and a license plate number (properties); Likewise, all cars can accelerate, brake and turn left or right (behaviors). So, we could think of Cart as a class.

In Python we can define a new class using the keyword `class` followed by the class name, I have created a file with the name `POO_Python.py`. Let's look:

{% highlight python %}
class Car:
    
    def __init__(self, brand, color, license plate, model):
        # Properties
        self.number_tires = 4
        self.brand = brand
        self.color = color
        self.plate = plate
        self.model = model

{% endhighlight %}

The above code creates a class called Car, which has the attributes `tire_number`, `brand`, `color`, `plate` and `model`. The `number_tires` attribute is a constant, it will always be 4.

Now let's move on to the behaviors, which in general terms are the functions or methods of the class.

{% highlight python %}
    ...
    ...
    def accelerate(self):
        print(f"I am {self.brand}, I am accelerating!!")
    
    def brake(self):
        print(f"I'm {self.brand}, I'm slowing down!!")
    
    def flip(self, direction):
        print(f"I am {self.brand}, I am turning to {address}")
    
    def __str__(self):
        """This method will help us see a chain representation of the object"""
        return self.mark
{% endhighlight %}

We define 3 methods of our own: _accelerar()_, _frenar()_ and _flip()_ and the method _\_\_str\_\_()_ that I leave you as a task so that you can investigate more about it ([look here](https://www.tutorialesprogramacionya.com/pythonya/detalleconcepto.php?punto=49&codigo=49&inicio=45)). As you can see, the methods we created will simply display a message on the screen indicating the action that the car is performing.

## Object

An object is the instance of a class. In the class we define the common attributes and behaviors that all **objects** that belong to that class will have. So, if we have a _red_ color_ car, _2020 model_, _Mazda 6 brand_ and with _RED126 license plate_ we are clearly referring to an object of the Car class defined above. In Python we define a new class object, like this:

{% highlight python %}

...
...

# Cart objects are instantiated one level of indentation back, outside the class.
obj_mazda = Car('Mazda 6', 'Red', 'RED126', '2020')
obj_renault = Car('Renault Logan', 'Black', 'FRE009', '2021')
obj_audi = Car('Audi Q3', 'White', 'DPK312', '2016')
{% endhighlight %}

Once we have created the objects, let's do some tests:

{% highlight python %}

...
...

# Cart objects are instantiated one level of indentation back, outside the class.
obj_mazda = Car('Mazda 6', 'Red', 'RED126', '2020')
obj_renault = Car('Renault Logan', 'Black', 'FRE009', '2021')
obj_audi = Car('Audi Q3', 'White', 'DPK312', '2016')

# We look at each object through the console
print(obj_mazda)
print(obj_renault)
print(obj_audi)

# The Mazda 6 is going to turn left
obj_mazda.flip('left')

# The Audi Q3 is going to turn right
obj_audi.flip('right')

# The Renault Logan is going to accelerate
obj_renault.accelerate()

{% endhighlight %}

If we run the previous program, we will have the following output:

![running_example_classes_poo_python](https://i.imgur.com/T7Dl2QA.png)

Now that you have an idea of ​​how to create classes and objects in Python, let's move on to another very important concept in the object-oriented programming paradigm: Inheritance. But first, [here](https://gist.github.com/CarMoreno/a9658c551bb8d15f4579b25bc90e4cd0#file-poo_python-py) you have the complete code for the first part of this article.

## Inheritance

Imagine that you can create a general class (also known as a parent class) in which you define common attributes and behaviors, and then be able to reuse them in other classes (child classes). Well, this is known as Inheritance, a relationship between two or more classes, a very powerful feature of object-oriented programming.

Let's continue with the example of the Car class, don't you think that _color_, _brand_ and _model_ are attributes that a motorcycle, a boat, an airplane or a bicycle also have? In fact _accelerate_, _brake_ and _flip_ are actions that any **Vehicle** can perform (well, a plane can't brake in the air but it can on landing). Thus, we can create a parent class called Vehicle and have in it the common attributes and methods of any vehicle.

{% highlight python %}
Vehicle class:
    
    def __init__(self, brand, color, license plate, model):
        self.brand = brand
        self.color = color
        self.plate = plate
        self.model = model
    
    def accelerate(self):
        print(f"I am {self.brand}, I am accelerating!!")
    
    def brake(self):
        print(f"I'm {self.brand}, I'm slowing down!!")
    
    def flip(self, direction):
        print(f"I am {self.brand}, I am turning to {address}")
    
    def __str__(self):
        """This method will help us see a chain representation of the object"""
        return self.mark

{% endhighlight %}

The Vehicle class is our parent class, we are going to rewrite the Car class that we had previously so that it inherits from Vehicle.

{% highlight python %}
class Car (Vehicle):
    number_tires = 4

def honk_horn(self):
        print(f"I'm {self.brand}, and I'm honking!!")
{% endhighlight %}

When we write the name of the class, in parentheses we must pass it the name of the parent class, from which we are going to inherit. Note that the attribute `number_tires` initialized to 4 is typical of the Car class, we should not place this attribute in the parent class since not all **Vehicles** have 4 tires, we also define a method called _touch\_horn()_ very typical of the Car class, one of the advantages of having the classes organized in this way is that the lines of code are significantly reduced.

Then in the parent class we place the common attributes and methods and in the child classes particular attributes and methods. Thanks to the Vehicle class we can create two other daughter classes and inherit: Motorcycle and Airplane.

{% highlight python %}
class Motorcycle (Vehicle): 
    number_tires = 2

def power_with_kick(self):
        print(f"I'm {self.brand} and I'm powering up with kick!!")

class Airplane (Vehicle):
    number_tires = 32
    
    def remove_tires(self):
        print(f"I am {self.brand} and I am removing the tires!!")
    
    def land(self):
        print(f"I am {self.brand} and I am landing!!")
{% endhighlight %}

Once the classes are created, let's instantiate some objects and test:

{% highlight python %}

# We Create Car Objects
obj_mazda = Car('Mazda 6', 'Red', 'RED126', '2020')
obj_renault = Car('Renault Logan', 'Black', 'FRE009', '2021')
obj_audi = Car('Audi Q3', 'White', 'DPK312', '2016')

# We Create Motorcycle Objects
obj_honda = Motorcycle('Honda CB 500', 'Black', 'XDR321', '2018')
obj_yamaha = Motorcycle('Yamaha R10', 'Blue', 'GTR576', '2016')
obj_suzuky = Motorcycle('Suzuky VStrom 650', 'Gray', 'RET841', '2020')

# Create Airplane Object
obj_jet = Airplane('Private Jet', 'White', 'G-DER4', '2014')


# The Mazda 6 is going to turn left
obj_mazda.flip('left')

# The Audi Q3 is going to turn right
obj_audi.flip('right')

# The Renault Logan is going to accelerate
obj_renault.accelerate()

# ---------------------------------------------------------------

# The Honda is going to start with a kick.
obj_honda.start_with_kick()

# The Honda is going to turn left
honda_obj.flip('left')

# The Yamaha is going to turn right
obj_yamaha.flip('right')

# The Suzuky is going to brake
obj_suzuky.brake()

# ----------------------------------------------

# The Jet accelerates
obj_jet.accelerate()

# The Jet turns right
obj_jet.flip('right')

# The Jet takes off the tires
obj_jet.remove_tires()

# And it lands.
obj_jet.land()

{% endhighlight %}

Opening the terminal and running this code, we have the following results.

![running-inheritance-poo-python](https://i.imgur.com/E759KpU.png)

We then see that all the methods of the parent class Vehicle can be used by the children, but if we try to do something like:

{% highlight python %} obj_mazda.remove_tires() {% endhighlight %}

We will get an error which tells us that the Car class does not have a method _'remove_tires'_

![running-inheritance-poo-python-error](https://i.imgur.com/o2nPk4Z.png)

Which is correct, since this method is in the Avion class.

Inheritance is a type of relationship that exists between classes, but it is not the only one. There is another relationship known as Composition, before continuing, you can access the code that we have carried up to this point in the article by clicking [here](https://gist.github.com/CarMoreno/a9658c551bb8d15f4579b25bc90e4cd0#file-herencia-py).

## Composition

If you have ever ridden in a car, you have realized that there are other more complex objects inside, it **has a** gear lever, **has** seat belts, **has some** seats, among other objects. Each object by itself can be represented by a class, for our example let's look at the LeverChange class.

{% highlight python %}
class ShiftLever:
    
    # We assume that the car starts in Neutral (gear 0 for us)
    current_change = 0

def __init__(self, number_changes = 4, color='Black', weight='50gr'):
        self.number_changes = number_changes
        self.color = color
        self.weight = weight

def upload_change(self):
        self.current_change = self.current_change + 1
        if (self.current_change == self.number_changes):
            print("I can't upload more changes")
        print(f"Shift lever raises gear to {self.current_gear}")
    
    def lower_change(self):
        self.current_change = self.current_change - 1
        if (self.current_change == 0):
            print("I can't download any more changes")
        print(f"Shift lever lowers gear to {self.current_gear}")

def __str__(self):
        return f"Shift lever of {self.number_gears} speeds"

{% endhighlight %}

The LeverChange class has 3 attributes: `number_changes` which is 4 by default, `color`, which is 'Black' by default and `weight` which is '50gr' by default. Now, **for the sake of the example let's assume that all vehicles must have a gear stick** (a boat, for example, is an example of a vehicle without a gear stick). With this in mind, we say that every vehicle **has a** gear lever.

Composition deals with a semantic relationship between a class that _"Has"_ and a class that _"Makes Part"_. In our case the Vehicle class _"Has"_ a LeverChange object and in turn, the LeverChange object "is part" of Vehicle and semantically makes sense. Let's see then how the Vehicle class would look.

{% highlight python %}
Vehicle class:
    
    def __init__(self, brand, color, license plate, model):
        self.brand = brand
        self.color = color
        self.plate = plate
        self.model = model
        # Every Vehicle Has a Gear Lever
        # and in turn, every Gear Lever is part of a Vehicle
        self.shift_lever = Shift_Lever() 
    
    def accelerate(self):
        print(f"I am {self.brand}, I am accelerating!!")
    
    def brake(self):
        print(f"I'm {self.brand}, I'm slowing down!!")
    
    def flip(self, direction):
        print(f"I am {self.brand}, I am turning to {address}")
    
    def __str__(self):
        """This method will help us see a chain representation of the object"""
        return self.mark

{% endhighlight %}

The above would be the only modification we would make to the Vehicle class, now we can do tests to verify the functionality of the shift lever.

{% highlight python %}
# We create the car object, Mazda 6.
obj_mazda = Car('Mazda 6', 'Red', 'RED126', '2020')

print(obj_mazda)

# We set the number of changes for this car to 8
# and the weight of the gear lever in 25gr
obj_mazda.shift_lever.number_of_shifts = 8
obj_mazda.lever_change.weight = '25gr'
print(obj_mazda.shift_lever)

# We upload a change
obj_mazda.shift_lever.shift_raise()

# ---------------------------------------------------------------

# We create the Motorcycle object, Honda CB 500
obj_honda = Motorcycle('Honda CB 500', 'Black', 'XDR321', '2018')
print(obj_honda)

# We set the number of changes for this bike to 6
obj_honda.shift_lever.number_of_shifts = 6
print(obj_honda.shift_lever)

# We upload a change
honda_obj.shift_lever.shift_raise()
{% endhighlight %}

If we run the code again, with the changes made, we have the following results:

![execution-composition-poo-python](https://i.imgur.com/jZL2Yrx.png)

We can then observe that, thanks to the `gear_lever' object found in the Vehicle class, all child classes can access their gear lever and establish the particularities of this object. Try doing the same with the `obj_jet` object.

If you want to go deeper into the relationships between classes, in the following [link](https://vcalpena.wordpress.com/6-relaciones-entre-clases-herencia/) you can access an article that explains more about it. You can see the code up to this point in the post [here](https://gist.github.com/CarMoreno/a9658c551bb8d15f4579b25bc90e4cd0#file-composition-py)

## Encapsulation

This last concept of the object-oriented programming paradigm tells us that a class should not be able to directly modify the attributes of another class, but rather there should be access methods with which we can change and obtain these attributes (the famous _getters_ and _setters_). If you paid attention to the example in the previous section, you may have realized that the objects of the child classes have directly accessed an attribute of the parent class and have modified its value, thus violating the encapsulation principle. Specifically the following lines:

{% highlight python %}
...
obj_mazda.shift_lever.number_of_shifts = 8
obj_mazda.lever_change.weight = '25gr'
...
obj_honda.shift_lever.number_of_shifts = 6
...
{% endhighlight %}

We must understand then that the attributes of a class can present three levels of privacy:

**1. Public:** All the attributes that we have written so far are public, by simply creating an object of said class and using the syntax of the point, we can access and modify any attribute from another class.

**2. Protected:** Establishes that an attribute can only be accessed and modified by the class itself and its child classes (if any), this concept then goes closely hand in hand with Inheritance. To define an attribute as protected, you must declare it with an "underscore", all attributes of the Vehicle class should be protected.

{% highlight python %}
Vehicle class:
    
    def __init__(self, brand, color, license plate, model):
        self._brand = brand
        self._color = color
        self._plate = plate
        self._model = model
    
    def _accelerate(self):
        print(f"I am {self.brand}, I am accelerating!!")
    
    def _brake(self):
        print(f"I'm {self.brand}, I'm slowing down!!")
    
    def _flip(self, direction):
        print(f"I am {self.brand}, I am turning to {address}")
{% endhighlight %}

**3. Private:** Establishes that an attribute can be accessed **only** from the class where it was defined. In this sense, the attributes of the child classes and the attributes of the LeverChange class should be private and have the corresponding _getters_ and _setters_ to access them. To make an attribute private in Python, we must prepend _"double underscores"_

By making the corresponding modifications to the PalancaCambios class, we would have the following:
{% highlight python %}
class ShiftLever:
    
    # We assume that the car starts in Neutral (gear 0 for us)
    __current_change = 0

def __init__(self, number_changes = 4, color='Black', weight='50gr'):
        # Attributes are now private
        self.__number_changes = number_changes
        self.__color = color
        self.__weight = weight
    
    # Getters and Setters
    def get_number_changes(self):
        return self.__number_changes
    
    def set_number_changes(self, number_changes):
        self.__number_changes = number_changes

def get_color(self):
        return self.__color
    
    def set_color(self, color):
        self.__color = color

def get_weight(self):
        return self.__weight
    
    def set_weight(self, weight):
        self.__weight = weight
    # End Getters and Setters
    
    def upload_change(self):
        self.__current_change = self.__current_change + 1
        if (self.__current_change == self.__number_changes):
            print("I can't upload more changes")
        print(f"Shift lever raises gear to {self.__current_gear}")
    
    def lower_change(self):
        self.__current_change = self.__current_change - 1
        if (self.__current_change == 0):
            print("I can't download any more changes")
        print(f"Shift lever lowers gear to {self.__current_gear}")

def __str__(self):
        return f"Shift lever of {self.__number_gears} speeds"
{% endhighlight %}

We then define three _getters_ and three _setters_, one for each private attribute, in this way we make sure to access these attributes through these methods, which act as a kind of interface.

And the daughter classes would look like this:

{% highlight python %}
class Car (Vehicle):

# Private attribute
    __number_of tires = 4

def set_number_tires(self, number_tires):
        self.__number_tires = number_tires

def get_tire_number(self):
        return self.__number_tires
        
    def honk_horn(self):
        print(f"I'm {self._brand}, and I'm honking!!")

class Motorcycle (Vehicle):

# Private attribute
    __number_of tires = 2

def set_number_tires(self, number_tires):
        self.__number_tires = number_tires

def get_tire_number(self):
        return self.__number_tires

def power_with_kick(self):
        print(f"I'm {self._brand} and I'm powering up with kick!!")

class Airplane (Vehicle):

# Private attribute
    __number_of tires = 32
    
    def set_number_tires(self, number_tires):
        self.__number_tires = number_tires

def get_tire_number(self):
        return self.__number_tires

def remove_tires(self):
        print(f"I am {self._brand} and I am removing the tires!!")

def land(self):
        print(f"I am {self._brand} and I am landing!!")
{% endhighlight %}

Finally, we carry out the tests of these modifications in the following way:

{% highlight python %}
# We create the car object, Mazda 6.
obj_mazda = Car('Mazda 6', 'Red', 'RED126', '2020')

print(obj_mazda)

# We set the number of changes for this car to 8
# and the weight of the gear lever in 25gr.

# We use the set_number_changes method
obj_mazda._shift_lever.set_number_shifts(8) 
# We use the set_weight method
obj_mazda._shift_lever.set_weight('25gr') 
print(obj_mazda._shift_lever)

# We upload a change
obj_mazda._shift_lever.up_shift()

# ---------------------------------------------------------------

# We create the Motorcycle object, Honda CB 500
obj_honda = Motorcycle('Honda CB 500', 'Black', 'XDR321', '2018')
print(obj_honda)

# We use the set_number_changes method
obj_honda._lever_change.set_number_changes (6)
print(obj_honda._shift_lever)

# We upload a change
honda_obj.shift_lever.shift_raise()
{% endhighlight %}

Now you can see that we do not access the `__number_changes` attribute directly, but rather we modify it using the _set\_number\_changes()_ method, in the same way with the weight attribute of the LeverChange class.

We must emphasize something very important and that is that Python was not designed to encapsulate attributes. In fact, there are developers who claim that programming in this way in Python goes against the philosophy of the language. Either way, you are free to adopt encapsulation in your classes or not. The way we build the examples is a good starting point for adopting this principle in your programs. The code for the last example with the _getters_ and _setters_ can be found [here](https://gist.github.com/CarMoreno/a9658c551bb8d15f4579b25bc90e4cd0#file-composition_encapsulacion-py).

# Conclusions
In this post we tried to cover most of the object-oriented programming concepts that are applicable to Python, talking from what a Class is to Encapsulation, offering examples as we progressed in the process. I hope that after you have finished reading, you have understood how to apply this programming paradigm in your new programs written in Python.

If you have anything to add, you can leave your comment below. Thank you for coming this far.

{% highlight python %}print("See you soon"){% endhighlight %}

<small><i>Translated using GPT 5.3 Codex</i></small>
