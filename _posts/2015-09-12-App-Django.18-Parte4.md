---
layout:     post
title:      La Biblioteca, aplicación en Django 1.8 | Parte IV
date:       2015-09-12 16:30:10
author:     Carlos Andrés Moreno
summary:    Construyendo una aplicación en Django 1.8, cuarta parte.
categories: Django
thumbnail:  django
series: Django dummies
tags:
- aplicación
- Django 1.8
- Biblioteca
---

Bienvenidos a la cuarta entrega de la construcción de una app en Django 1.8, en la [entrega pasada][1]
hablamos un poco acerca del sitio de administración que este Framework nos ofrece para gestionar de una
manera rápida y sencilla nuestra base de datos. El tópico que nos reúne hoy son las vistas y las templates; si hablamos de estos dos elementos es menester también hablar de las urls, pues sin estas
no podrían trabajar en armonía las vistas y las templates.

## ¿Qué son las Vistas en Django?
Son funciones o métodos. Como espero que sepas, Django es un Framework web que se acoge el patrón de arquitectura de software llamado [_Modelo-Vista-Controlador (MVT)_][2], (aunque con algunos ligeros cambios) no me quiero extender mucho en este tema, pues no es el objetivo de este post. Pero por respeto solo diré **a groso modo** que:

* **El Modelo** hace alusión a como represento y acceso mis datos en mi base de datos.
* **El Controlador** hace las veces de puente, este _escucha_ eventos, que por lo general son acciones que el usuario realizará en la aplicación, paso siguiente dispara una petición al modelo para que este le cumpla lo pedido (dado el caso en que se pueda)
* **La Vista** es como se muestran esos datos traídos desde el modelo, se debe de mostrar al usuario algo agradable, lo que en una aplicación web se traduciría en código HTML y Hojas de estilo.

Las Vistas en Django son en donde tu escribes la lógica que se llevará a cabo cuando pase algún evento proporcionado por el usuario, y hará las correspondientes peticiones al Modelo, en este sentido haciendo un comparativo con _MVC_, podemos ver que las Vistas en Django son equivalente a los Controladores.

## ¿Qué son las Templates en Django?
Las templates en Django son las que se encargan de mostrar los datos que traen las Vistas desde el Modelo, aquí encontramos nuestro código HTML, las Hojas de estilo en cascada y scripts de Javascipt dado el caso, el Framework nos proporciona un [motor de templates][3] que nos permite manipular y decidir <ins>**que datos se mostrarán**</ins>. Puedes [leer mas de la arquitectura de este Framework][4] si así lo deseas.

## ¿Qué son las Urls en Django?
Son expresiones regulares. Básicamente las urls en Django permiten que las vistas y las templates trabajen en armonía, nosotros necesitamos las urls puesto que el Framework hace una especie de mapeo entre patrónes de urls asociados a vistas, entonces de acuerdo a una u otra url, se ejecutará una vista determinada. Django sigue una filosofía de urls limpias y legibles, por lo que no encontrarás urls de la forma `www.misitio.com/?a=3&&b=4` (como sucede en `PHP` por ejemplo). 
Teniendo un poco el horizonte mas claro, vamos a empezar a jugar con Vistas, Templates y Urls en nuestra app de la Biblioteca.

## Vistas, Templates y Urls en nuestra App
Para entender mejor como orquestan estos elementos, vamos a empezar haciendo una vista muy básica, abre la carpeta de la aplicación y en el archivo `views.py` coloca lo siguiente:

{% highlight python %}
#sitiolectura/biblioteca/views.py
from django.http import HttpResponse
# Create your views here.

def primer_vista(request):#siempre recibe un parametro HttpRequest
	return HttpResponse("Hola, soy tu primera vista")
{% endhighlight %}

Entrando más en detalle, podemos decir que una vista es una función o método que toma como parámetro <ins>**siempre**</ins> un objeto `HttpRequest`, en este objeto va la información referente a la solicitud que estamos haciendo, por ejemplo si el método solicitado es `POST` o `GET`. Y retorna un objeto `HttpResponse`, con la información de la página que va a mostrar, o una excepción, si algo anda mal. La vista por si sola no hace nada, necesitamos asociar esta vista a una dirección url, para esto vamos a manejar dos ficheros. El primer fichero Django ya nos lo crea, búscalo en el directorio del proyecto `sitiolectura/sitiolectura/urls.py`, el otro lo crearemos nosotros, ve a la carpeta de la aplicación `sitiolectura/biblioteca` y crea un nuevo archivo llamado `urls.py`. Vamos a editar el primero `sitiolectura/sitiolectura/urls.py`.

{% highlight python %}
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
]
{% endhighlight %}

Ignorando las líneas que de seguro tienes comentadas en ese archivo, lo que podemos apreciar acá es la forma en como Django relaciona una patrón url `/admin`, con el módulo `admin.site.urls` de la aplicación Admin, usada en la entrada pasada. En este sentido, cuando nos dirigimos a `localhost:8000/admin` empezamos a usar ese fichero url de dicha app para los siguientes enlaces que vayamos usando, como por ejemplo `localhost:8000/admin/Libro`.

Vamos a hacer lo mismo para nuestra aplicación de la Biblioteca, por lo tanto edita ese archivo y coloca lo siguiente

{% highlight python %}
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^biblioteca/', include('biblioteca.urls')),#no olvides la coma al final
]
{% endhighlight %}

De esta forma le decimos a Django que el patrón `/biblioteca` usará el modulo urls de nuestra aplicación. Ahora editemos el fichero `urls.py` que hemos creado nosotros.

{% highlight python %}
from django.conf.urls import include, url
from . import views #Le decimos a Django que de este directorio importe el fichero views

urlpatterns = [
    url( r'^$' , views.primer_vista, name= 'primera-vista' ),
]
{% endhighlight %}

Con esto, Django hará una unión de los patrones urls de los archivos editados anteriormente, es decir, unirá el patrón de `sitiolectura/sitiolectura/urls.py`, a saber `/biblioteca` con el patrón de 
`sitiolectura/biblioteca/urls.py`, que es una cadena vacía, (por decirlo de forma un tanto grosera).

La función url necesita dos argumentos como mínimo para funcionar, el primero será un patrón, mejor conocido como expresión regular o _regex_, y el segundo es la vista asociada a ese patrón, usamos el argumento _name_ para poder hacer referencia a esta url desde cualquier parte de nuestro proyecto, puedes pensar que es una especie de identificador para esa url determinada. Existen otros argumentos como _prefix_ que no usaremos en la aplicación. Te dejo [documentación útil al respecto][6].

Con lo que tenemos hasta ahora, si abres el navegador y colocas `localhost:8000/biblioteca` podrás ver como trabajan en conjunto las `vistas` y las `urls`. Ignora mis marcadores personales :D...

![primeravista][5]

Hasta acá hemos visto como funcionan las urls y las Vistas en conjunto. Pero ¿y las templates?, bueno creo que eso será tema para el próximo post, junto con las llamadas _"Vistas Genéricas"_. Espero haberme explicado de la mejor forma, si tienes alguna duda, puedes dejarme un comentario mas abajo en la caja de comentarios.

{% highlight python %}print("Hasta pronto"){% endhighlight %}

[1]:http://carmoreno.github.io/blog/2015/09/06/App-Django1.8-Parte3/
[2]:https://es.wikipedia.org/wiki/Modelo%E2%80%93vista%E2%80%93controlador
[3]:https://docs.djangoproject.com/en/1.8/ref/templates/language/
[4]:https://es.wikipedia.org/wiki/Django_(Framework)
[5]:../../../../../../images/2015-09-12/primeraVista.png
[6]:https://docs.djangoproject.com/en/1.8/ref/urls/




