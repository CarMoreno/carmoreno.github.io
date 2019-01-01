---
layout:     post
title:      ¿Cuál es la diferencia entre Var y Let?
date:       2018-10-24 15:25:42
author:     Carlos Andrés Moreno
summary:    Establcememos las diferencias que existen entre var y let y realizamos ejemplos para comprender e interiorizar.
categories: javascript
thumbnail: university 
tags:
- Javascript
- Fundamentos
---

## Introducción

Los nuevos estándares de Javascript han traído nuevas características y funcionalidades que están cambiando la forma en como este lenguaje ha sido concebido, tanto así que Typescript prácticamente ha revolucionado la forma en como estamos programando en Javascript; sí, ya sabemos que Typescript al final es código javascript escrito de otra forma y que al final, la traducción de este nos dá puro JS nativo. Sin embargo, poder crear tipos, interfaces, clases, poder encapsular atributos y métodos es algo que hace unos años atrás, era mas complicado de hacer con Javascript. 

Con ES2015, llegó algo que sin duda es tremendamente potente, una nueva forma de declarar variables, que se asemeja mucho más a los lenguajes de programación tradicionales. Con esta nueva característica, podremos declarar variables cuyo alcance sea local, sin afectar variables globales y, al ser su alcance local, su ciclo de vida empieza y termina en determinado bloque.

## Pero entonces, ¿Cuál es la diferencia entre declarar una variable con var y con let?

Cuando hacemos uso de `var`, la variable podrá ser accedida a lo largo de toda la función, mientras que con `let`, la variable solo tendrá alcance dentro del bloque donde fue definida. Miremos algunos ejemplos.

{% highlight javascript %}

function esFinDeMes() {
    var mensaje = "Hola"
    var dias = 30
    var response = false;
    // hace referencia a la variable global dias
    if (dias === 30) {
        // Una variable distinta a la variable mensaje.
        let mensaje = "Adiós";
        // Una variable distinta a la variable global dias.
        let dias = 0;

        let diasAsString = dias.toString();
        // La misma variable response, definida globalmente
        var response = true;
        console.log(mensaje); // Mostrará por consola 'Adiós';
        console.log(dias); // Mostrará por consola 0;
        console.log(response) // "Mostrará por consola true"
    }

    /**
    Luego de que cerramos esta llave, el bloque del if finaliza, 
    y con el, las variables mensaje y dias, definidas dentro de
    este bloque, mueren:
    **/

    console.log(mensaje); // "Mostrará por consola Hola"
    console.log(dias); // "Mostrará por consola 2
    console.log(response); // "Mostrará por consola true"
    // Obtendremos un ReferenceError: diasAsString no está definido
    console.log(diasAsString);
}
{% endhighlight %}

Cuando usamos `let`, podemos obtener algunas errores, en el ejemplo podemos apreciar que cuando queremos acceder a una variable que no está definida, entonces obtendremos un `ReferenceError`, cosa que no pasa si la variable fue declarada con `var`, donde obtendremos como resultado `undefined`. Otro error que puede ocurrir, es definir dos variables con el mismo nombre, usando `let`, por ejemplo;

{% highlight javascript %}
let saludo;
let saludo; // SyntaxError

// O bien:
let saludo;
var saludo; // SyntaxError
{% endhighlight %}

También podemos usar la definición con `let` en bucles, por ejemplo:

{% highlight javascript %}
for (let i = 0; i<20; i++) {
  console.log(i); // 0, 1, 2, 3, 4 ... 19
}

console.log(i); // ReferenceError: i is not defined
{% endhighlight %}


## Mas sobre let y var

Para un estudio más profundo sobre let, puedes hacer [click acá](https://developer.mozilla.org/es/docs/Web/JavaScript/Referencia/Sentencias/let)

## Conclusión

Espero que con este pequeño articulo haya quedado claro el comportamiento de las variables usando las palabras reservadas `let` y `var`, si tienes algún comentario al respecto, puedes dejarlo más abajo. Nos vemos después. 

{% highlight python %}print("Hasta pronto"){% endhighlight %}


 
