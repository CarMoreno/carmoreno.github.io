---
layout:     post
title:      La comodidad de TortoiseGit, instalación y manejo
date:       2016-04-14 14:24:10
author:     Carlos Andrés Moreno
summary:    Explico cómo instalar y usar TortoiseGit, el cliente gráfico de GIT.
categories: Tutoriales
thumbnail:  code-fork
tags:
- TortoiseGit
- Git
- Windows
---
## Introducción

Cuando empiezas a trabajar en equipo, te das cuenta que la gestión del manejo de código es parte fundamental en el desarrollo de un proyecto y, que métodos cómo: _"Te envió el código al correo"_ o _"Pasame el código a la memoria"_ son simplemente inútiles, puesto que es prácticamente imposible estar al tanto de las versiones, de las funcionalidades modificadas y de quién las hizo. Es en este momento cuando los Sistemas de Control de Versiones (VCS) entran a salvarnos. Actualmente existen muchos VCSs (e.g. Subversion, Perforce, Git), en este post hablaremos de TortoiseGit, un cliente gráfico para Windows que nos ayudará a trabajar con Git.

Para seguir este post es muy importante que tengas experiencias en el uso de GIT, por lo menos que sepas lo que es un _commit_, un _push_, un _branch_, un _pull_ y obviamente, que tengas instalado Git en tu ordenador y que el Sistema Operativo del mismo sea Windows (existe un cliente gráfico para Linux llamado [RabbitSVN](http://rabbitvcs.org/), el link te dirige al _homepage_ del proyecto). Teniendo esto claro, continuemos.

## Instalar TortoiseGit
Primero lo primero, vamos a instalar TortoiseGit siguiendo los siguientes pasos:

* Descarga e instala GIT si es que aún no lo has hecho.

* [Descargate el archivo binario de TortoiseGit](https://tortoisegit.org/download/) para tu versión de Windows (yo estoy usando un Windows 10 de 64 bits).

* Clic derecho sobre el binario y ejecutar como administrador.

![inicio](http://i.imgur.com/XZWfZLx.png)

* Damos next, luego nos saldrá uno cuadro donde vemos la licencia del software.

![lic](http://i.imgur.com/6Lzs8iy.png)

* Damos next y veremos lo que será instalado en nuestro PC, esta es la configuración por defecto de TortoiseGit, te recomiendo que la dejes tal cual.

![recomendada](http://i.imgur.com/IoWCspo.png)

* Damos next y veremos otra ventana, clic en install para comenzar la instalación.

![install](http://i.imgur.com/fs7FfUl.png)

* Damos clic en _finish_ y listo, ya tenemos nuestro TortoiseGit instalado.

Puedes ver como esta herramienta se integra bastante bien en Windows, puedes dar clic derecho y en el menú de opciones verás tres opciones nuevas, como puedes ver en la imagen de mas abajo.

![opciones](http://i.imgur.com/CqGM7lF.png)

> ¿Qué tal si realizamos algunas pruebas?

## Uso de TortoiseGit

Antes de usar Tortoise debemos de realizar una pequeña configuración. Vamos a dar clic derecho, nos dirigimos a `tortoise` y vamos a `settings`, debe de aparecer el siguiente cuadro:

![settings](http://i.imgur.com/6jPPkJa.png)

En la parte izquierda damos clic en la sección `Git`, esto lo hacemos para establecer nuestras credenciales. Como sabes Git funciona con Github por lo que Tortoise necesita conocer nuestro _username_ y correo electrónico asociado a nuestra cuenta de Github. Como puedes apreciar en la imagen anterior ya he completado esos campos.

Ahora que tenemos Tortoise instalado y configurado, vamos a realizar algunas acciones:

### Clonar un repositorio remoto

Dirigite al lugar donde vas a clonar el repositorio remoto, en mi caso lo haré en el escritorio, vamos a dar clic derecho, `Git Clone`. Debe de aparecer la siguiente ventana.

![clone](http://i.imgur.com/OcnG1Qz.png)

Te explico, en el campo con nombre `URL` debes de pegar la url del proyecto que deseas clonar, en mi caso la url es [https://github.com/CarMoreno/Vibora](https://github.com/CarMoreno/Vibora), un proyecto pequeño que hice hace tiempo y que está alojado en Github. Luego verás que el campo `Directory` se completará automáticamente, este campo nos dice dónde quedará alojado el repositorio una vez haya sido clonado, en mi caso será en `C:\Users\Usuario\Desktop\Vibora`. Ahora damos en `OK`.

![finClonar](http://i.imgur.com/El2kIxT.png)

Dirigite al sitio donde quedó clonado tu proyecto, en mi caso el escritorio, ya puedes ver el proyecto clonado.

### Hacer Push a un repositorio remoto desde nuestro repositorio local

* Vamos a crear un repositorio local, creamos una nueva carpeta y damos clic derecho, `Git create repository here...` y damos en aceptar al cuadro emergente que nos aparecerá.

* Dentro de la carpeta vamos a crear un nuevo archivo, yo le pondré `hola.py` y escribiré algo simple

{% highlight python %} print ("Hola tortoise ...") {% endhighlight %}

* Ahora le vamos a decir a TortoiseGit que añada ese archivo a nuestro repositorio local, para ello damos clic derecho sobre el archivo, seleccionamos `Tortoise` y damos clic en `add`. Luego clic en OK.

![add](http://i.imgur.com/6uKhzHi.png)

* Vamos a _commitear_ todo, damos clic derecho `Git commit -> master`, escribimos el mensaje del commit y clic en close.

![commit](http://i.imgur.com/5415AOn.png)

* Con todo _commiteado_ vamos a hacer un `push` hacia un repositorio remoto, damos clic derecho, `tortoise`, y en la parte superior clic en `push`. y nos aparece el siguiente cuadro.
La parte importante está mostrada en la imagen en el cuadro rojo, en esta sección llamada _Destination_ es donde le vamos a decir a TortoiseGit dónde queremos que haga el push. Es decir le indicaremos el repositorio remoto donde queremos alojar el código.

![push](http://i.imgur.com/QqoaD1B.png)

* Damos clic en `manage` (ver la imagen anterior) y nos saldrá la siguiente ventana

![manage](http://i.imgur.com/mkSgsSq.png)

* Luego en el campo URL pegamos el repositorio remoto donde queremos hacer push, yo he creado con antelación un repositorio en Github llamado _InspirationBlog_, la URL en mi caso es [https://github.com/CarMoreno/InspirationBlog](https://github.com/CarMoreno/InspirationBlog). Y damos clic en aceptar, luego damos en `OK`.

Debe aparecer una ventana donde te pregunta tu _username_ de Github y tu clave, llena esos campos y el push debería ocurrir sin error.

### Hacer un pull

Todas las mañanas antes de empezar a codear, deberías de actualizar tu repositorio local con la ultima versión del master, puede que un compañero del proyecto haya realizado algunos cambios y tu no lo sepas, para ello solo haces clic derecho, `tortoise` y en la parte superior das clic en `pull`, debe aparecer la ventana de abajo

![pull](http://i.imgur.com/Hz6gJLy.png)

Elige la opción `Arbitrary url` para elegir la url del repositorio al que vas a hacer pull, luego da clic en `OK` y listo.

### Crear una rama en un repositorio local

Tal vez quieras trabajar en una rama aparte para probar algunos cambios antes de hacer un `merge` con el master, para ello simplemente das clic derecho, `totoise` y das clic en `Create Branch`, Debe de salir una ventana para elegir el nombre de la rama y desde donde nacerá (¿la rama nace desde el master, o desde otra rama?), das clic en aceptar y la rama debe de haber sido creada.

Para ubicarte en la rama que has creado damos clic derecho, `tortoise` y damos clic en `Switch/Checkout` y te saldrá un cuadro donde debes elegir a la que te quieres cambiar.

![rama](http://i.imgur.com/D5nv9J7.png)

Yo he creado una rama con nombre `ramita` la seleccionamos y damos en `OK`.

Ahora que estamos en una rama podemos hacer cualquier acción como si estuviéramos en el master, si das clic derecho podrás ver en el menú de opciones `Git commit -> "ramita" ` indicando que los commits solo afectaran a esa rama. Si quieres volver al master, el procedimiento es igual.

### Eliminar una rama

Para eliminar una rama damos clic derecho, `tortoise`, `Switch/Checkout` y nos pasamos al master. Ya en el master volvemos a la ventana de `Switch/Checkout` y damos clic en el botón de los `...` en la imagen se muestra.

![eliminarama](http://i.imgur.com/T56PWhI.png)

Veremos una ventana donde están todas las ramas que actualmente tenemos en nuestro repositorio, seleccionamos la que queremos eliminar y damos clic derecho, `Delete branch`, como se muestra en la imagen de abajo.

![deletebranch](http://i.imgur.com/gaetc31.png)

## Conclusión

TrotoiseGit nos ofrece una interfaz amigable e intuitiva para trabajar nuestros repositorios, hoy hemos aprendido a instalarla y a realizar algunas acciones con él, personalmente hace mucho que lo uso y puedo decir que sus versiones han mejorado bastante, tiene una comunidad activa y sacan _release_ del software continuamente. Te animo a que lo uses, te va a gustar mucho.

Si no entendiste algunos pasos y tienes alguna duda referente al tema, siempre puedes comentar mas abajo, nos vemos en una próxima ocasión.
{% highlight python %}print("Hasta pronto"){% endhighlight %}