---
layout:     post
title:      ¿Cómo configurar archivos estáticos en Django 1.8?
date:       2015-08-15 18:46:24
author:     Carlos Andrés Moreno
summary:    Configuración de archivos estáticos en Django 1.8
categories: Django
thumbnail:  django
tags:
- Como
- configurar
- estático
- Django 1.8
---
Cuando empecé a aprender Django me topé con un problema muy molesto, **la configuración de archivos estáticos**, como las imágenes, las hojas de estilo y los ficheros de Javascript, me tocó googlear un buen rato hasta que por fin pude encontrar la solución después de algunos días intentándolo. Por eso quise escribir este pequeño post explicando como hacerlo.

Supongo que el lector ya ha iniciado su proyecto Django con el comando `django-admin startproject <name_project>` y que ha creado (y registrado en `settings.py`) previamente su aplicación con `python manage.py startapp <name_app>`. Con esto en mente continuemos, abran su fichero `settings.py` e incluyan las siguientes líneas al final del mismo:

{% highlight python %}
   #Configuracion de archivos estaticos en Django
   STATICFILES_DIRS = (
       os.path.join(BASE_DIR, 'media'),
   )
   MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
{% endhighlight %}

En la primera línea le estamos diciendo a Django que _el_ _directorio_ de archivos estáticos estará ubicado en `<name_project>/media` y en la segunda línea le estamos diciendo que _la_ _raíz_ de los archivos estáticos será `<name_project>/media`, es decir la raíz de nuestro proyecto como tal. 

Debemos de ir pues a la **raíz de nuestro proyecto** y creamos la carpeta `media`. Es algo redundante tener que especificar en donde se guardará, y la raíz donde se guardará. Pero ya sabes como es Python...

> ... Explícito es mejor que implícito.

Listo, hemos acabado de configurar nuestros archivos estáticos. Ahora por ejemplo cuando queramos hacer uso de ellos en las templates basta con hacer:

* **Archivo de template** : _dentro de la carpeta_ `media` hice otra carpeta llamada `css`, fíjate como usé el tag `static`
![template][1]

* **Hoja de estilos:** llamada `estilos.css` presente en `media/css`
![estilos][2]

Cuando usamos el tag `load staticfiles` cargamos la ruta de nuestro directorio de archivos estáticos, es decir `<name_project>/media`, luego cada vez que escribamos una etiqueta `static` estaremos haciendo referencia a esa ruta.

Bueno, eso es todo por ahora. Si tienen alguna duda, comentario o inquietud, o simplemente quieren aportar algo pueden dejar su comentario mas abajo. En el siguiente post les enseñaré a configurar Django 1.8 en Windows. {% highlight python %}print("Hasta pronto"){% endhighlight %}

[1]: ../../../../../../images/2015-08-15/template.png
[2]: ../../../../../../images/2015-08-15/estilo.png


