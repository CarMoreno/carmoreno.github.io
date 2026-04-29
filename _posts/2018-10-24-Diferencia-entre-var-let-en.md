---
layout: post
title: What is the difference between Var and Let?
date: 2018-10-24 15:25:42
author: Carlos Andrés Moreno
summary: We will establish the differences that exist between var and let and make
  examples to understand and internalize.
categories: javascript
thumbnail: university
tags:
- javascript
- Basics
lang: en
page_id: diferencia-entre-var-let
---
## Introduction

The new Javascript standards have brought new features and functionalities that are changing the way this language has been conceived, so much so that Typescript has practically revolutionized the way we are programming in Javascript; Yes, we already know that Typescript in the end is javascript code written in another way and that in the end, the translation of this gives us pure native JS. However, being able to create types, interfaces, classes, being able to encapsulate attributes and methods is something that a few years ago was more complicated to do with Javascript.

With ES2015, something that is undoubtedly tremendously powerful arrived, a new way of declaring variables, which is much more similar to traditional programming languages. With this new feature, we can declare variables whose scope is local, without affecting global variables and, since their scope is local, their life cycle begins and ends in a certain block.

## But then, what is the difference between declaring a variable with var and with let?

When we use `var`, the variable can be accessed throughout the entire function, while with `let`, the variable will only have scope within the block where it was defined. Let's look at some examples.

{% highlight javascript %}

function isEndOfMonth() {
    var message = "Hello"
    var days = 30
    var response = false;
    // refers to the global variable days
    if (days === 30) {
        // A variable other than the message variable.
        let message = "Goodbye";
        // A variable other than the global variable days.
        let days = 0;

let daysAsString = days.toString();
        // The same response variable, defined globally
        var response = true;
        console.log(message); // Will show 'Goodbye' in the console;
        console.log(days); // Will show by console 0;
        console.log(response) // "Console will show true"
    }

/**
    After we close this brace, the if block ends, 
    and with it, the variables message and days, defined within
    this block, die:
    **/

console.log(message); // "It will show Hello in the console"
    console.log(days); // "It will show by console 2
    console.log(response); // "It will show true in the console"
    // We will get a ReferenceError: diasAsString is not defined
    console.log(daysAsString);
}
{% endhighlight %}

When we use `let`, we can get some errors, in the example we can see that when we want to access a variable that is not defined, then we will get a `ReferenceError`, which does not happen if the variable was declared with `var`, where we will get `undefined` as a result. Another error that can occur is defining two variables with the same name, using `let`, for example;

{% highlight javascript %}
let greeting;
let greeting; // SyntaxError

// Or:
let greeting;
var greeting; // SyntaxError
{% endhighlight %}

We can also use the definition with `let` in loops, for example:

{% highlight javascript %}
for (let i = 0; i<20; i++) {
  console.log(i); // 0, 1, 2, 3, 4...19
}

console.log(i); // ReferenceError: i is not defined
{% endhighlight %}


## More about let and var

For a more in-depth study on let, you can do [click here](https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Sentences/let)

## Conclusion

I hope that with this small article the behavior of variables using the reserved words `let` and `var` has become clear, if you have any comments about it, you can leave it below. See you later.

{% highlight python %}print("See you soon"){% endhighlight %}

<small><i>Translated using GPT 5.3 Codex</i></small>
