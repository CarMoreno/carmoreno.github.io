---
layout: post
title: I promise you! - Promises in Javascript
date: 2019-10-22 18:03:19
author: Carlos Andrés Moreno
summary: Everything you need to know about promises in Javascript.
categories: javascript
thumbnail: handshake-o
tags:
- javascript
- Promises
lang: en
page_id: todo-promesas-javascript-async-await-callbacks
---
# Introduction

I had been thinking about writing this article for a long time, because at the time it was a very confusing topic for me and I want to somehow guide the reader a little in understanding the **so** famous _Promises_ of Javascript, present since the ES6 version. The objective is to review the callback functions, this will help to better understand Promises and then we will explain what role Async and Await play in all this; the latter introduced from ES7.

Throughout this post we will work with an example, which we will modify as we progress. At the end of this article you have the link to the repository with the example code, so you can study it.

It would be excellent if the reader had knowledge of basic Javascript, since aspects such as arrow functions, array methods (map, filter, forEach), string _templates_, among others, will not be explained.

Finally, for this article NodeJS version 10.16.3, NPM 6.9.0 and Nodemon 1.19.4 were used on Windows 10 64-bit.

### Let's talk about Callbacks

Look carefully at the following code snippet:

{% highlight javascript %}
setTimeout( function () {
    console.log('Hello World');
}, 3000);
{% endhighlight %}

I hope it's familiar to you; <a href='https://developer.mozilla.org/es/docs/Web/API/WindowTimers/setTimeout' _target='_blank'>setTimeout</a> **is the main function, which executes another function** sent by parameter after a certain time. The previous example will wait 3 seconds, then execute the anonymous function that displays the typical "Hello World" in the console. The anonymous function is, in this example, the callback function.

> The callback function is a function that is executed from a main function.

We can rewrite the above in this way, to see it more clearly:

{% highlight javascript %}
let callback = function () {
    console.log('Hello World');
}
setTimeout( callback , 3000); // Good
setTimeout( callback() , 3000); // Bad
{% endhighlight %}

As you see, it is the definition of the function itself, which is passed as a parameter, that is, the function is not executed in the parameter, this is very important.

Now, an example will be made that will be used from this point of the article onwards. In your favorite text editor, create a new file called _callback.js_ and write the following code

{% highlight javascript %}
/**
We simulate a database of 3 employees: Carlos,
Andrés and Juan, and the salaries they earn related
by your ID:

- Carlos wins 2000
- Andrés wins 5000
- Juan does not have salary information at the moment.
**/
let employees = [
    { id: 1, name: 'Carlos' },
    { id: 2, name: 'Andrés' },
    { id: 3, name: 'John' }
]

let wages = [
    { id: 1, salary: 2000 },
    { id: 2, salary: 3000}
];

/**
- Returns the employee by ID
- @param {} id
- @param {} callback
**/
let getEmployee = (id, callback) => {

// We search for the employee by his id
    let employeeDB = employees.find( employee => employee.id === id);
    if(!employeeDB) {
        // If the employee does not exist, then the first argument of
        // callback will be an error message, and as a second parameter
        // will have nothing, since the employee was not found
        callback(`The employee with ID ${id} does not exist in the database`);
    }
    else {
        // No error (null as first parameter), as second
        // parameter we send the employee found, this is it
        // we will get later when we call the function
        // getEmployee, keep reading..
        callback(null, employeeDB);
    }

  }
  {% endhighlight %}

In the first lines, there is test data: Three employees and their salary information, except for Juan, for whom this information is not known.

Now pay attention to the _getEmployee_ function, which receives as parameters the employee ID and a callback function that will be executed from the body of the function. Also look at the statement `callback(null, DBemployee)`, this tells us that the callback parameter must be a function that receives two arguments. Two arguments, usually `error` and `response` **in that order**.

Based on the above, for the `callback(null, employeeDB)` statement we are saying that there is no error and that please return the employee you found. And in `` callback(`The employee with ID ${id} does not exist in the database`); `` we are returning an error message and like, the employee was not found, so the second argument does not exist.

It's time to run the _getEmployee_ function so you can see how the employee can be obtained and the errors (if any). At the end of the file, write the following:

{% highlight javascript %}
getEmployee(3, (error, employee) => {
    if (error) {
        console.log(error);
        return;
    }
    console.log('The database employee is: ', employee);
})
{% endhighlight %}

The previous statement executes the function _getEmpleado_, which receives the number 3 as ID and as a callback an _arrow function_ with two arguments: `error` and `employee`. If there is an error, then it displays it in the console and exits the callback function (also anonymous) with a `return`, otherwise it displays the employee's record in the console.

The previous call can also be rewritten like this, to see it more clearly:

{% highlight javascript %}
let callback = (error, employee) => {
    if(error) {
        console.log(error);
        return;
    }
    console.log('The database employee is: ', employee);
}

getEmployee(3, callback);
{% endhighlight %}

To test it, open a terminal and type in it `node callback.js` or, if you have nodemon installed `nodemon callback.js`; try putting in an ID that doesn't exist in the database, and see what happens.

Now imagine that you want to find out the employee's salary, the function _getSalario_ would be more or less like this:

{% highlight javascript %}
/**
- Returns the salary information of an employee
- @param {} employee
- @param {} callback
**/
  let getSalary = (employee, callback) => {
    // We look for the salary according to the employee id
    let salaryDB = salaries.find( salary => employee.id === salary.id);
    if(!salaryDB) {
        callback(`No salary found for employee ${employee.name.toUpperCase()}`);
    }
    else {
        // error parameter null (no error),
        // in the second parameter we create an object that
        // it will be what we will get when we call the getSalario function
        callback(null, {
            name: employee.name,
            salary: salaryDB.salary,
            id: employee.id
        });
    }
  }
  {% endhighlight %}

The function _getSalario_ then receives an employee and a callback function that returns us if there was an error or the object with the necessary information. To call the _getSalary_ function, we must first get the employee, like this:

{% highlight javascript %}
// First we get the employee
getEmployee(4, (error, employee) => {
    if(error) {
        console.log(error);
        return;
    }
    // If we got here it was because there was no
    // error and we have in 'employee' the
    // information, so we call getSalary

getSalary(employee, (error, salary) => {
        if(error) {
            console.log(error);
            return;
        }
        // We show the object with the info. of the salary
        console.log('The database salary is:', salary);
    })
    console.log('The database employee is: ', employee);

});
{% endhighlight %}

### Callback Problems

What if you need a function that requires an employee's salary for some specific logic? ...You will have to make more calls, nesting and the code becomes unmaintainable.

{% highlight javascript %}
// First we get the employee
getEmployee(4, (error, employee) => {
    ...
    getSalary(employee, (error, salary) => {
        ...
        getExtralegalBonus(salary, (error, ExtralegalBonus) => {
            ...
            getAnotherFunction(..)
            ....
            ...
        })
    })
}

Well, this is where the promises come to help us.
{% endhighlight %}

# Promises to the rescue

### What are promises?

A Promise is nothing more than an Object to which callback functions are assigned to represent the success or failure of an asynchronous operation; Instead of passing callbacks to a function like we did above, we'll make our functions return Promise objects and then attach error and success callbacks. Let's look at how our example would look if we now worked with Promises.

I advise you, create a new file called _promesas.js_ and in it, write the following:

{% highlight javascript %}
/**
We simulate a database of 3 employees: Carlos,
Andrés and Juan, and the salaries they earn related
by your ID:

- Carlos wins 2000
- Andrés wins 5000
- Juan does not have salary information at the moment.
**/

let employees = [
    { id: 1, name: 'Carlos' },
    { id: 2, name: 'Andrés' },
    { id: 3, name: 'John' }
]

let wages = [
    { id: 1, salary: 2000 },
    { id: 2, salary: 3000}
];

/**
- Returns a promise that employees have
- @param {} id: YOU ONLY RECEIVE AN ID, YOU DO NOT RECEIVE CALLBACKS!!
**/
let getEmployee = (id) => {
    return new Promise( (resolve, reject) => {
        let employeeDB = employees.find( employee => employee.id === id);
        if(!employeeDB) {
            // Something went wrong, so we use reject
            reject(`The employee with ID ${id} does not exist in the DB`);
        }
        else {
            // Everything OK, we use resolve to return our object.
            resolve(employeeDB);
        }
    });
}
  {% endhighlight %}

The _getEmployee_ function has been redefined and now returns a Promise object, let's look at each important aspect in detail:

1. _Promise_ is a Javascript object that receives a function with two arguments, by standard, we call these arguments `resolve` (when everything has gone OK and we are going to return the correct data) and `reject` (when there has been an error).

2. Both arguments, `resolve` and `reject` are functions, can you see? Look for example when we call `reject` when an error has occurred: **reject(`The employee with ID ${id} does not exist in the database`);** and `resolve`, when everything has gone well and we are going to return the data: **resolve(employeeDB)**.

> Use Promises instead of callback functions whenever you can.

Now, how can we execute this function? Write the following:

{% highlight javascript %}
getEmployee(1).then( employee => {
    console.log('The Database employee is: ',employee);
})
.catch(error => console.log(error));
{% endhighlight %}

The _then_ method of the _Promise_ object receives a function that will be executed when everything is OK (i.e. our `resolve`). And the catch method receives a function that will be executed when there was an error (exactly, the `reject`). Maybe this way you will see it more clearly:

{% highlight javascript %}

let resolve = employee => {
    console.log('The Database employee is: ', employee);
}

let reject = error => {
    console.log(error)
}

getEmployee(1).then( resolve ).catch( reject );
{% endhighlight %}

Now open a terminal and type `node promises.js` and see what happens. You should see the same thing, as when we use pure callbacks, instead of Promises.

We can also rewrite the function _getSalario_ to return a _Promise_, in this case, it would look like this:

{% highlight javascript %}

/**
@param {} employee
**/
let getSalary = (employee) => {
    return new Promise( (resolve, reject) => {
        let salaryDB = salaries.find( salary => employee.id === salary.id);
        if(!salaryDB) {
            // Something went wrong, so we use reject
            reject(`No salary found for employee ${employee.name.toUpperCase()}`);
        }
        else {
            // Everything OK, we use resolve to return our object.
            resolve({
                name: employee.name,
                salary: salaryDB.salary,
                id: employee.id
            });
        }
    });
}
{% endhighlight %}

Now we would no longer have to nest functions within others, in order to obtain the salary of a particular employee, since the promises are executed sequentially. As soon as one finishes, the other follows in the order in which they are placed. To get the salary based on the employee, we could do this:

{% highlight javascript %}
getEmployee(1).then( employee => {
    /** In this first "then" we are solving
    successfully the Promise returned by the
    getEmployee method.
    We return the getSalario function with the
    particular employee, as we already saw, getSalary
    returns a new Promise. then
    we can "chain" another "then" below that will allude
    to the Promise returned by the getSalary method. **/
    return getSalary(employee);
})
.then( objSalaryInfo => {
    // In this second "then" we are successfully solving the
    // Promise returned by the getSalary method.
    console.log(`The salary of ${objSalaryInfo.name} is ${objSalaryInfo.salary}$`);
})
.catch(error => console.log(error));
// This catch is useful for any error, whether from the Promise
// returned by the getEmployee method or the getSalary method.
{% endhighlight %}

The above is known as chain promises. When resolving the first promise, we must return the second so that it is resolved immediately afterwards, so that a third or fourth promise exists. Try running `node promises.js`

It's a bit strange syntax, not at all intuitive, but it works. It would be great if there was a better way to "chain" promises, don't you think? Well, this is where _Async_ and _Await_ come into play.

# Our friends Async and Await.

_Async_ and _Await_ were designed for handling promises, when we prefix the word _async_ to a function, it will immediately return a promise without the need for us to use the Promise object that we saw previously. The resolve will be whatever the _async_ function returns itself. And the reject will be thrown if there was an error within the function.

The word _await_ is used before calling a function that returns a promise and forces you to wait for it to be resolved. Something important to clarify here is that _await_ can only be used within an _async_ function.

The best thing is to see this in action with the example we have been working on. Create a new file named `async-await.js` and write the following:

{% highlight javascript %}
let employees = [
    { id: 1, name: 'Carlos' },
    { id: 2, name: 'Andrés' },
    { id: 3, name: 'John' }
]

let wages = [
    { id: 1, salary: 2000 },
    { id: 2, salary: 3000} 
];

/**
 * Returns a promise that employees have
 * @param {*} id 
 */
let getEmployee = async(id) => {
    
    let employeeDB = employees.find( employee => employee.id === id);
    if(!employeeDB) {
        throw new Error(`The employee with ID ${id} does not exist in the database`);
    }
    else {
        return employeeDB;
    }
}

/**
 * 
 * @param {*} employee 
 */
let getSalary = async(employee) => {
    let salaryDB = salaries.find( salary => employee.id === salary.id);
    if(!salaryDB) {
        throw new Error(`No salary found for employee ${employee.name.toUpperCase()}`);
    }
    else {
        return {
            name: employee.name,
            salary: salaryDB.salary,
            id: employee.id
        };
    }
}

let getInformation = async(id) => {
    let employee = await getEmployee(id);
    let response = await getSalary(employee);
    return `Employee ${answer.name} has a salary of ${answer.salary}$`;
}

getInformation(3).then( message => {
    console.log(message);
})
.catch( error => {
    console.log('error :', error);
})
{% endhighlight %}

Now notice how the _getEmployee_ and _getSalary_ functions are constructed using the word _async_, this makes these functions return promises. If the promise resolves successfully, then we will have whatever the function returns. In the case of the _getEmployee_ function it will be a specific employee, while for the _getSalary_ function, it will be an object written by us with the properties _id_, _name_ and _salary_.

In case the promise is not resolved successfully, then we must control this by throwing the exception ourselves, for this we use _throw new Error (...)_. Now let's look at the function _getInformacion_, which receives an employee id. As you see, it also returns a promise (it is defined as _async_) and, it is in this function where we use the _getEmployee_ and _getSalary_ functions, prefixing the reserved word _await_ in both calls; With this we are giving the instruction to our program to please wait for the promises that these functions return to be resolved. As you can see, it gives the illusion that the program was synchronous.

If the promise returned by the _getInformation_ function is resolved successfully, then we will have an informative _string_ with the user's salary data, according to the provided id. In the last lines, we call the _getInformacion_ function, resolving it with _then_ and displaying the information through the console. And getting any exception that may occur with _catch_.

To test this code, you can type `node async-await.js` in the terminal

# Code on Github

In the following [repository](https://github.com/CarMoreno/TeLoPrometo), you will have the code of the example that we made in this article.

# Conclusions

I hope that after having finished reading this article, you have a more grounded view of Promise management. Remember that to internalize there is nothing better than practicing. Comment below if you have any questions about it or if you want to contribute something that may not be discussed here.

Thank you for coming this far and we'll see you in another article. {% highlight python %}print("See you soon"){% endhighlight %}

<small><i>Translated using GPT 5.3 Codex</i></small>
