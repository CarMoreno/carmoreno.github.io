---
layout:     post
title:      Un curriculum interactivo
date:       2017-01-07 21:18:23
author:     Carlos Andrés Moreno
summary:    Te cuento un poco sobre mi curriculum interactivo y algunas ideas para que crees uno propio
thumbnail:  gamepad
categories: Ideas
tags:
- Juego
- Html5
- curriculum
- Javascript
---

# Introducción
Se siente un poco extraño volver a escribir, hace mas de cuatro meses que no redacto nada en el blog. He estado muy ocupado con la universidad, ¡por fin defendí mi trabajo de grado! y luego estuve realizando prácticas en una empresa de desarrollo de software. Han pasado bastantes cosas en estos últimos cuatro meses (tal vez luego les cuente).

Ahora sí a lo que vinimos, para nadie es un secreto que hacer un buen _curriculum_ es vital a la hora de buscar empleo y si tenemos en cuenta que, como nosotros, hay muchos más candidatos que se presentan a la misma vacante es de gran importancia destacarse del resto de candidatos. Hoy te vengo a dar una idea de como puedes hacer esto.

# ¿De donde obtuve la idea?

De [Javier Muñiz](https://twitter.com/javianmuniz), él es un Ingeniero Informático, escritor, desarrollador de video juegos y _youtuber_ español. Acostumbro ver [su contenido](https://www.youtube.com/channel/UCt4oJu2ItngyTNBwPNmJDfA) en _Youtube_ cada vez que tengo algún rato libre, en su canal trata de dar _tips_ y consejos sobre cómo mejorar en aspectos personales y laborales. En uno de sus videos mencionó que una buena idea para destacar del resto es hacer algo que impacte y que tenga que ver con tu campo de conocimiento, Javier realizó un juego en _HTML5_ donde se presentaba a sí mismo y daba a conocer sus habilidades.

La temática de [su juego](http://seetio.com/curriculum/) es simple, pero la idea es fantástica y me propuse realizar uno propio (por supuesto, con otra temática). Con un juego puedes demostrar tus capacidades de programación al mismo tiempo que te presentas y hablas un poco de ti. Además ¿Un juego como _curriculum_?, seguro que te desmarcará del resto.

Luego empecé a _googlear_ un poco y descubrí que no solo Javier tenía un juego de _curriculum_, encontré a [Daniel Sternlicht](http://danielsternlicht.com/), a [Robby Leonardi](http://www.rleonardi.com/interactive-resume/) y a Miquel Camps (su juego no está disponible a la fecha ;_;). Ingenieros que hicieron lo mismo que Javier, ¡en este momento estaba súper entusiasmado!, así que me puse manos a la obra.

# ¿Cómo lo hice?

[Mi juego](http://carmoreno.github.io/cvgame) está desarrollado con tecnologías web, se puede jugar desde cualquier navegador e incluso desde dispositivos móviles. El juego en su totalidad está programado en _Javascript_, haciendo uso de [Phaser](http://phaser.io/), un _framework_ para la construcción de videojuegos que ofrece muchas ventajas (manejo de _sprites_, sistema de físicas, funciones para _responsive_, entre otras). No tenía ni idea sobre este _framework_, así que tuve que aprender a usarlo, por suerte hay bastantes foros (en inglés) y el tutorial oficial de _Mozilla_ en español, la verdad es muy sencillo de usar si ya tienes algo de experiencia en _Javascript_ y haz hecho algún juego antes.

Primero hice un diseño en papel del juego, con el fin de determinar cómo iba a funcionar y cómo iba a ser su aspecto. La imagen de más abajo muestra el _sketch_, algo simple pero lo importante era tener una idea general de cómo iba a quedar el juego. Quería que el juego tuviera un aspecto pixelado, que el avatar fuera al estilo NES o Súper Nintendo y que fuera fácil de usar.

![sketch](http://i.imgur.com/TdLV2gD.png)
_Diseño en papel_

Pasó más o menos un mes desde que hice el diseño en papel, me ocupé en mi trabajo de grado y lo pospuse por un par de días. Hasta que por fin empecé a aprender el _framework_, sus funciones, ventajas, características e iba programando partes del juego. Te dejo el [tutorial oficial de Mozilla](https://developer.mozilla.org/es/docs/Games/Workflows/HTML5_Gamedev_Phaser_Device_Orientation) para que comiences a aprender a usar _Phaser_.

![juego](http://i.imgur.com/i8TOAIY.png) 
_Aspecto final_

Después de mas o menos 20 días, lo terminé y la verdad que estoy muy contento con el resultado, además me divertí mucho programándolo y recordé conceptos de _Javascript_, también aprendí algo de _Photoshop_ jaja... Y de seguro lo hubiera terminado antes, todos los días no me sentaba a programarlo. Espero que te animes a realizar el tuyo propio, con alguna otra temática. Si encuentras algún comportamiento extraño en [mi juego](http://carmoreno.github.io/cvgame), te agradecería que lo comentes más abajo.

# Conclusión

Un juego donde muestres lo que puedes hacer es sin duda una gran opción que te va a destacar del resto, anímate y crea uno propio, nos vemos en una próxima entrada.

{% highlight python %}print("Hasta pronto"){% endhighlight %}