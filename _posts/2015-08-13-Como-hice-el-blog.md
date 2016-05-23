---
layout:     post
title:      Github Pages y Jekyll... Un blog bastante cool.
date:       2015-08-13 19:29:04
author:     Carlos Andrés Moreno
summary:    Te explico como hice el sitio
categories: Tutoriales
thumbnail:  jekyll
tags:
- Como
- Hice
- Blog
---
<!-- ![Thumper](http://www.webhostwhat.com/wp-content/uploads/host-jekyll-blog-github.jpg) -->
![Picture](../../../../../../images/2015-08-13/Github+Jekyll.jpg)
Cuando me vino a la mente la idea de crear este sitio estaba seguro de que quería crearlo en una plataforma que yo mismo pudiera administrar, configurar y organizar. ¿WordPress, Drupal o Blogspot?, No. De seguro que un administrador de contenidos o un perfil en blogger no daría satisfacción a mis deseos, sin embargo ustedes me dirán:

>Carlos, Wordpress o Blogspot es personalizable y se puede administrar también.

Sí pero no 100%, siempre te queda ese sin sabor de no querer algo en tu sitio, y lo digo porque tengo algunos amigos que tienen sus sitios personales hospedados en algún lugar como los ya descritos (espero que ellos también lean este post). Además en Blogspot por ejemplo, si Google decide que tu contenido viola algunos términos y condiciones pueden cerrarte el sitio, y te quedas sin tu preciado contenido. Después de googlear un rato encontré algo maravilloso en [este post][1]: [Github][2] + [Jekyll][3], la decisión estaba tomada. ¿Cómo lo hice?, vamos a ello:

1. Debes de crearte una cuenta en Github (si es que ya no la tienes).
2. [Sigue los pasos][4] para crear un repositorio compatible con Github Pages, en resumen, ese repo debe de tener el nombre `<username_github>.github.io`, donde `<username_github>` es tu nombre de usuario de Github.
3. [Busca una template][5] que te parezca agradable para que con base en ella puedas empezar tu sitio, luego edita las variables del archivo `_config.yml` de la plantilla elegida. Claro está, también puedes empezar desde cero tus templates.
4. Clona el repositorio que creaste anteriormente.
5. Sube el template que elegiste a ese repositorio.

Espera unos diez minutos y entra a tu dominio de Github Pages, ese dominio será `<username_github>.github.io`, ya deberías ver tu sitio en la red. Hasta acá todo bien, ya configuramos la parte que compete a Github, ahora vamos por Jekyll. Jekyll en resumidas cuentas es una gema de Ruby que nos permite administrar nuestro sitio de manera local, antes de subirlo a la red.

6. Debes de [Instalar Jekyll en Windows][6], el enlace te llevará a un lugar donde lo explican de maravilla, te adelanto, debes de tener Ruby en tu máquina. Si estás desde una Mac, Ruby ya viene instalado. 
7. Tener comentarios al final de cada Post es fácil si usas [Disqus][7], te dejo su página web, no deberías de tener problemas para configurarlo. Créate una cuenta.
8. Editar tu plantilla: los colores, tipo de fuente, dale tu toque personal (estoy en este paso aun ;)).

En cada commit que hagas a tu repositorio se verán los cambios reflejados al instante. Bueno creo que es todo, espero no haber dejado nada sin tratar. Si tienen alguna duda me lo dejan saber mas abajo en la caja de comentarios. 
¡ En el próximo post empezaremos con algunos tópicos de programación web !. {% highlight python %}print("Hasta pronto"){% endhighlight %}

[1]: http://raulavila.com/2015/01/como-hice-el-blog/
[2]: https://github.com/
[3]: http://jekyllrb.com/
[4]: https://pages.github.com/
[5]: http://jekyllthemes.org/
[6]: http://yesez5.github.io/2014/04/08/instalar-jekyll-windows/
[7]: https://disqus.com/

