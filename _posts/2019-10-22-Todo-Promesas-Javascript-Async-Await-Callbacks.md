---
layout: post
title: ¡Te lo Prometo! - Promesas en Javascript
date: 2019-10-22 18:03:19
author: Carlos Andrés Moreno
summary: Todo lo que debes saber sobre promesas en Javascript.
categories: javascript
thumbnail: handshake-o
tags:
  - Javascript
  - Promesas
---

# Introducción

Hace mucho tenía pensado realizar este artículo, pues en su momento fue un tema muy confuso para mi y quiero de alguna forma, orientar un poco al lector en la comprensión de las **tan** famosas _Promises_ de Javascript, presentes desde la versión ES6. El objetivo es realizar un repaso sobre las funciones callbacks, esto ayudará a entender de mejor forma las Promesas y luego explicaremos qué papel juega Async y Await en todo esto; esto último introducido a partir de ES7.

A lo largo de este post trabajaremos con un ejemplo, el cual iremos modificando conforme se vaya avanzando. Sería excelente que el lector contara con conocimientos en Javascript básico, ya que no se explicarán aspectos como funciones flecha, métodos de arreglos (map, filter, forEach), string _templates_, entre otros.

Por último, para este artículo se uso NodeJS versión 10.16.3, NPM 6.9.0 y Nodemon 1.19.4 sobre Windows 10 de 64 bits.

### Hablemos de Callbacks

Mira detenidamente el siguiente fragmento de código:

{% highlight javascript %}
setTimeout( function () {
    console.log('Hola Mundo');
}, 3000);
{% endhighlight %}

Espero que te sea familiar; <a href='https://developer.mozilla.org/es/docs/Web/API/WindowTimers/setTimeout' _target='_blank'>setTimeout</a> **es la función principal, que ejecuta otra función** enviada por parámetro después de cierto tiempo. El ejemplo anterior esperará 3 segundos, luego ejecutará la función anónima que muestra por consola el típico "Hola Mundo". La función anónima es, en este ejemplo, la función callback.

> La función callback es una función que se ejecuta desde una función principal.

Lo anterior podemos reescribirlo de esta forma, para verlo más claro:

{% highlight javascript %}
let callback = function () {
    console.log('Hola Mundo');
}
setTimeout( callback , 3000); // Bien
setTimeout( callback() , 3000); // Mal
{% endhighlight %}

Como ves, es la definición de la función en sí misma, la que es pasada como parámetro, es decir, la función no se ejecuta en el parámetro, esto es muy importante.

Ahora, se realizará un ejemplo que será utilizado desde este punto del artículo en adelante. En tu editor de texto favorito, crea un nuevo archivo llamado _callback.js_ y escribe el siguiente código

{% highlight javascript %}
/**
Simulamos una base de datos de 3 empleados: Carlos,
Andrés y Juan, y los salarios que ellos ganan relacionados
por su ID:

- Carlos gana 2000
- Andrés gana 5000
- Juan no posee información de salario en el momento.
**/
let empleados = [
    { id: 1, nombre: 'Carlos' },
    { id: 2, nombre: 'Andrés' },
    { id: 3, nombre: 'Juan' }
]

let salarios = [
    { id: 1, salario: 2000 },
    { id: 2, salario: 3000}
];

/**
- Retorna el empleado por ID
- @param {} id
- @param {} callback
**/
let getEmpleado = (id, callback) => {

    // Buscamos el empleado por su id
    let empleadoDB = empleados.find( empleado => empleado.id === id);
    if(!empleadoDB) {
        // Si el empleado no existe, entonces el primer argumento de
        // callback será un mensaje de error, y como segundo parametro
        // no tendrá nada, pues no se encontró el empleado
        callback(`El empleado con ID ${id} no existe en la base de datos`);
    }
    else {
        // No hay error (null como primer parametro), como segundo
        // parametro mandamos el empleado encontrado, este lo
        // obtendremos despues cuando llamemos a la funcion
        // getEmpleado, sigue leyendo..
        callback(null, empleadoDB);
    }

  }
  {% endhighlight %}

En las primeras líneas, se tienen datos de prueba: Tres empleados y la información de sus salarios, exceptuando a Juan, del cuál no se sabe esta información.

Ahora presta atención a la función _getEmpleado_, el cual recibe como parámetros el ID del empleado y una función callback que se ejecutará desde el cuerpo de la función. También fíjate en la sentencia `callback(null, empleadoDB)`, esto nos dice que, el parámetro callback debe ser una función que reciba dos argumentos. Dos argumentos que, por lo general son `error` y `response` **en ese orden**.

Con base en lo anterior, para la sentencia `callback(null, empleadoDB)` estamos diciendo que no hay error alguno y que por favor, nos devuelva el empleado que encontró. Y en `` callback(`El empleado con ID ${id} no existe en la base de datos`); `` estamos devolviendo un mensaje de error y como, el empleado no se encontró, entonces no existe el segundo argumento.

Es hora de ejecutar la función _getEmpleado_ para que mires cómo se puede obtener el empleado y los errores (si es que hay alguno). Al final del archivo, escribe lo siguiente:

{% highlight javascript %}
getEmpleado(3, (error, empleado) => {
    if (error) {
        console.log(error);
        return;
    }
    console.log('El empleado de la base de datos es: ', empleado);
})
{% endhighlight %}

La anterior sentencia, ejecuta la función _getEmpleado_, el cual recibe como ID el número 3 y como callback una _arrow function_ con dos argumentos: `error` y `empleado`. Si existe un error, entonces lo pinta en consola y sale de la función callback (anónima además) con un `return`, de lo contrario entonces muestra en consola el registro del empleado.

La anterior llamada también se puede reescribir así, para verlo más claro:

{% highlight javascript %}
let callback = (error, empleado) => {
    if(error) {
        console.log(error);
        return;
    }
    console.log('El empleado de la base de datos es: ', empleado);
}

getEmpleado(3, callback);
{% endhighlight %}

Para probarlo, abre una terminal y escribe en ella `node callback.js` o bien, si tienes instalado nodemon `nodemon callback.js`; intenta colocar un ID que no exista en la base de datos, y mira qué ocurre.

Ahora imagina que quieres averiguar el salario del empleado, la función _getSalario_ sería mas o menos así:

{% highlight javascript %}
/**
- Retorna la informacion del salario de un empleado
- @param {} empleado
- @param {} callback
**/
  let getSalario = (empleado, callback) => {
    // Buscamos el salario segun el id del empleado
    let salarioDB = salarios.find( salario => empleado.id === salario.id);
    if(!salarioDB) {
        callback(`No se encontró un salario para el empleado ${empleado.nombre.toUpperCase()}`);
    }
    else {
        // parametro error null (no hay error),
        // en el segundo parametro armamos un objeto que
        // sera lo que obtendremos cuando llamemos la funcion getSalario
        callback(null, {
            nombre: empleado.nombre,
            salario: salarioDB.salario,
            id: empleado.id
        });
    }
  }
  {% endhighlight %}

La función _getSalario_ recibe entonces un empleado y una función callback que nos retorna si hubo error o el objeto con la informacion necesaria. Para llamar a la función _getSalario_, primero debemos obtener el empleado, así:

{% highlight javascript %}
// Primero obtenemos el empleado
getEmpleado(4, (error, empleado) => {
    if(error) {
        console.log(error);
        return;
    }
    // Si llegamos acá fue porque no hubo
    // error y tenemos en 'empleado' la
    // información, así que llamamos a getSalario

    getSalario(empleado, (error, salario) => {
        if(error) {
            console.log(error);
            return;
        }
        // Mostramos el objeto con la info. del salario
        console.log('El salario de la base de datos es:', salario);
    })
    console.log('El empleado de la base de datos es: ', empleado);

});
{% endhighlight %}

### Problemas de los Callbacks

¿Qué tal si necesitas una función que requiera el salario de un empleado para alguna lógica en específico? ... Tendrás que hacer mas llamados, anidados y el código se vuelve inmantenible.

{% highlight javascript %}
// Primero obtenemos el empleado
getEmpleado(4, (error, empleado) => {
    ...
    getSalario(empleado, (error, salario) => {
        ...
        getPrimaExtralegal(salario, (error, primaExtralegal) => {
            ...
            getOtraFuncion(..)
            ....
            ...
        })
    })
}

Bueno, acá es donde vienen las promesas a echarnos una mano.
{% endhighlight %}

# Promesas al rescate

### ¿Qué son las promesas?

Una Promesa no es nada más que un Objeto al que se le asignan funciones callback para representar el éxito o el fracaso de una operación asíncrona; en lugar de pasar callbacks a una función como hicimos anteriormente, haremos que nuestras funciones retornen objetos Promise y luego adjuntaremos callbacks de error y éxito. Miremos cómo quedaría nuestro ejemplo si ahora trabajáramos con Promesas.

Te aconsejo, crees un nuevo archivo llamado _promesas.js_ y en el, escribe lo siguiente:

{% highlight javascript %}
/**
Simulamos una base de datos de 3 empleados: Carlos,
Andrés y Juan, y los salarios que ellos ganan relacionados
por su ID:

- Carlos gana 2000
- Andrés gana 5000
- Juan no posee información de salario en el momento.
**/

let empleados = [
    { id: 1, nombre: 'Carlos' },
    { id: 2, nombre: 'Andrés' },
    { id: 3, nombre: 'Juan' }
]

let salarios = [
    { id: 1, salario: 2000 },
    { id: 2, salario: 3000}
];

/**
- Retorna una promesa que tiene los empleados
- @param {} id : SOLO RECIBE UN ID, NO RECIBE CALLBACKS!!
**/
let getEmpleado = (id) => {
    return new Promise( (resolve, reject) => {
        let empleadoDB = empleados.find( empleado => empleado.id === id);
        if(!empleadoDB) {
            // Algo salio mal, entonces usamos reject
            reject(`El empleado con ID ${id} no existe en la BBDD`);
        }
        else {
            // Todo OK, usamos resolve para devolver nuestro objeto.
            resolve(empleadoDB);
        }
    });
}
  {% endhighlight %}

La función _getEmpleado_ a sido re-definida y ahora retorna un objeto Promise, miremos a detalle cada aspecto importante:

1. _Promise_ es un objeto de Javascript que recibe una función con dos argumentos, por estandar, llamamos a estos argumentos `resolve` (cuando toda ha ido OK y vamos a retornar los datos correctos) y `reject` (cuando a habido algún error).

2. Ambos argumentos, `resolve` y `reject` son funciones, ¿lo alcanzas a ver?. Mira por ejemplo cuando llamamos a `reject` cuando ha sucedido un error: **reject(`El empleado con ID ${id} no existe en la base de datos`);** y a `resolve`, cuando todo ha ido bien y vamos a retornar los datos: **resolve(empleadoDB)**.

> Usa Promesas en lugar de funciones callbacks, siempre que puedas.

Ahora, ¿Cómo podemos ejecutar esta función?. Escribe lo siguiente:

{% highlight javascript %}
getEmpleado(1).then( empleado => {
    console.log('El empleado de la Base de datos es: ',empleado);
})
.catch(error => console.log(error));
{% endhighlight %}

El método _then_ del objeto _Promise_, recibe una función que será ejecutada cuando todo está bien (es decir, nuestro `resolve`). Y el método catch, recibe una función que será ejecutada cuando hubo algún error (exacto, el `reject`). Tal vez, así lo veas mas claro:

{% highlight javascript %}

let resolve = empleado => {
    console.log('El empleado de la Base de datos es: ', empleado);
}

let reject = error => {
    console.log(error)
}

getEmpleado(1).then( resolve ).catch( reject );
{% endhighlight %}

Ahora abre una terminal y escribe `node promesas.js` y mira lo que ocurre. Deberías ver lo mismo, que cuando usamos callbacks puras, en lugar de Promesas.

La función _getSalario_ también la podemos reescribir para que retorne una _Promise_, en este caso, quedaría de la siguiente forma:

{% highlight javascript %}

/**
@param {} empleado
**/
let getSalario = (empleado) => {
    return new Promise( (resolve, reject) => {
        let salarioDB = salarios.find( salario => empleado.id === salario.id);
        if(!salarioDB) {
            // Algo salio mal, entonces usamos reject
            reject(`No se encontró un salario para el empleado ${empleado.nombre.toUpperCase()}`);
        }
        else {
            // Todo OK, usamos resolve para devolver nuestro objeto.
            resolve({
                nombre: empleado.nombre,
                salario: salarioDB.salario,
                id: empleado.id
            });
        }
    });
}
{% endhighlight %}

Ahora ya no tendríamos que anidar funciones dentro de otras, para poder obtener el salario de un empleado en particular, ya que las promesas se ejecutan secuencialmente. Apenas termina una, sigue la otra en el orden en que son colocadas. Para obtener el salario con base al empleado, podríamos hacer esto:

{% highlight javascript %}
getEmpleado(1).then( empleado => {
    /** En este primer "then" estamos resolviendo
    exitosamente la Promise devuelta por el
    método getEmpleado.
    Retornamos la función getSalario con el
    empleado en particular, como ya vimos, getSalario
    devuelve una nueva Promise. Entonces
    podemos "encadenar" otro "then" mas abajo que hará alusión
    a la Promise retornada por el método getSalario. **/
    return getSalario(empleado);
})
.then( objInfoSalario => {
    // En este segundo "then" estamos resolviendo exitosamente la
    // Promesa devuelta por el método getSalario.
    console.log(`El salario de ${objInfoSalario.nombre} es ${objInfoSalario.salario}$`);
})
.catch(error => console.log(error));
// Este catch, nos sirve para cualquier error, ya sea de la Promise
// devuelta por el método getEmpleado o por el método getSalario.
{% endhighlight %}

A lo anterior se le conoce como promesas en cadena, al resolver la primera promesa, debemos retornar la segunda para que sea resuelta inmediatamente después, y así sí existiera una tercera o cuarta promesa. Prueba ejecutando `node promesas.js`

Es una sintaxis un poco extraña, nada intuitiva, pero que funciona. Sería genial que existiera una forma mejor de "encadenar" promesas, ¿no crees?. Bueno, acá es donde entran en acción _Async_ y _Await_

# Nuestros amigos Async y Await.

_Async_ y _Await_ fueron pensados para el manejo de promesas, cuando anteponemos la palabra _async_ a una función, está retornará inmediatamente una promesa sin necesidad de que usemos el objeto Promise que vimos anteriormente. El resolve será lo que sea que retorne en sí misma la función _async_. Y el reject será lanzado sí hubo algún error dentro de la función.

La palabra _await_ es usada antes del llamado a una función que retorna una promesa y fuerza a esperar a que esta sea resuelta. Algo importante que aclarar acá es que _await_ solo puede ser usada dentro de una función _async_.

Lo mejor es ver esto en acción con el ejemplo que hemos venido trabajando. Crea un nuevo archivo con nombre `async-await.js` y escribe lo siguiente:

{% highlight javascript %}
let empleados = [
    { id: 1, nombre: 'Carlos' },
    { id: 2, nombre: 'Andrés' },
    { id: 3, nombre: 'Juan' }
]

let salarios = [
    { id: 1, salario: 2000 },
    { id: 2, salario: 3000} 
];

/**
 * Retorna una promesa que tiene los empleados
 * @param {*} id 
 */
let getEmpleado = async(id) => {
    
    let empleadoDB = empleados.find( empleado => empleado.id === id);
    if(!empleadoDB) {
        throw new Error(`El empleado con ID ${id}  no existe en la base de datos`);
    }
    else {
        return empleadoDB;
    }
}

/**
 * 
 * @param {*} empleado 
 */
let getSalario = async(empleado) => {
    let salarioDB = salarios.find( salario => empleado.id === salario.id);
    if(!salarioDB) {
        throw new Error(`No se encontró un salario para el empleado ${empleado.nombre.toUpperCase()}`);
    }
    else {
        return {
            nombre: empleado.nombre,
            salario: salarioDB.salario,
            id: empleado.id
        };
    }
}

let getInformacion = async(id) => {
    let empleado = await getEmpleado(id);
    let respuesta = await getSalario(empleado);
    return `El empleado ${respuesta.nombre} tiene un salario de ${respuesta.salario}$`;
}

getInformacion(3).then( mensaje => {
    console.log(mensaje);
})
.catch( error => {
    console.log('error :', error);
})
{% endhighlight %}

Fíjate ahora cómo están construidas las funciones _getEmpleado_ y _getSalario_ usando la palabra _async_, esto hace que estas funciones retornen promesas. Si la promesa se resuelve exitosamente, entonces tendremos lo que sea que la función retorne. Para el caso de la función _getEmpleado_ será un empleado en específico, mientras que para la función _getSalario_, será un objeto escrito por nosotros con las propiedades _id_, _nombre_ y _salario_.

En caso de que la promesa no se resuelva exitosamente, entonces debemos contralor esto lanzando nosotros mismo la excepción, para ello usamos _throw new Error (...)_. Ahora fijémonos en la función _getInformacion_, la cual recibe un id de empleado. Como ves, también retorna una promesa (esta definida como _async_) y, es en esta función donde usamos las funciones _getEmpleado_ y _getSalario_, anteponiendo la palabras reservada _await_ en ambos llamados; con esto estamos dando la instrucción a nuestro programa de que por favor espere a que las promesas que retornan dichas funciones, sean resueltas. Como ves, dá la ilusión de que el programa fuera síncrono.

Si la promesa que retorna la función _getInformación_ es resuelta de manera exitosa, entonces tendremos un _string_ informativo con los datos de salario del usuario, según el id proporcionado. En las últimas líneas, realizamos el llamado a la función _getInformacion_ resolviéndola con _then_ y mostrando por consola la información. Y obteniendo alguna excepción que pueda ocurrir con _catch_. 

Para probar este código, puedes escribir en el terminal `node async-await.js`

# Código en Github

En el siguiente [repositorio](https://github.com/CarMoreno/TeLoPrometo), tendrás el código del ejemplo que realizamos en este artículo.

# Conclusiones

Espero que luego de haber terminado de leer este artículo, tengas un panorama más aterrizado del manejo de Promesas. Recuerda que para interiorizar no hay nada mejor que practicar. Comenta más abajo si tienes alguna duda al respecto o si quieres aportar algo que tal vez, no esté comentado acá.

Gracias por llegar hasta acá y nos vemos en otro artículo. {% highlight python %}print("Hasta pronto"){% endhighlight %}
