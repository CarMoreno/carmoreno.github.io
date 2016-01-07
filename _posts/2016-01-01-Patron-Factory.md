---
layout:     post
title:      Patrones Pythonicos Patrón Factory
date:       2016-01-06 21:10:12
author:     Carlos Andrés Moreno
summary:    Entendiendo el patrón de diseño Factory.
categories: Blog
thumbnail:  cubes
tags:
- Patrones de diseño
- Factory
- Design Patterns
---
## Introducción

Hoy vamos a empezar una serie de posts donde estudiaremos los patrones de diseño más usados en el desarrollo de software, cada uno vendrá acompañado por su correspondiente codificación; si buscas en la red, encontrarás muchos ejemplos de patrones de diseño en Java. Quiero que estas entradas sean un tanto diferentes a la mayoría de artículos que están en Internet, por ello realizaremos la codificación de los ejemplos en Python, en su versión 2.7.9 y trataré de hacerme entender lo más posible.

Para seguir estos post debes de tener un conocimiento básico de Programación en Python además de tener claro conceptos de programación orientada a objetos (qué es una clase, qué es un objeto, qué es herencia, qué es un método, un atributo, etc.). Sería un plus si ya has hecho algo de POO con Python, aunque no es fundamental esto último. 

## ¿Qué es un patrón de diseño de software?

> Una taza de leche, 6 huevos, 1/2 taza de agua, azúcar y dos cucharaditas de esencia de vainilla; primero debes precalentar el horno a 180°.

_"Los patrones de diseño son recetas"_ (en este momento recuerdo al profesor que me dijo esto por primera vez), probadas por muchos desarrolladores y que han dado fé de que funcionan para determinados problemas, solo debemos aprender a usarlos en los contextos adecuados, ya que dependiendo del problema elegiremos uno u otro. ¿Por qué debemos salirnos de los estándares?, si se sabe que un patrón dará la solución a un problema simplemente lo usamos, ¡no hay que re-inventar la rueda!.

La cita que nos reúne hoy es el Patrón de diseño **Factory**, entenderemos como funciona y al final haremos un pequeño ejemplo.

## ¿Qué es el Patrón Factory?

El patrón Factory hace parte de los patrones de creación. Te explico, dentro de los patrones de diseño existen tres categorías:

1. Patrones de creación.
2. Patrones de comportamiento.
3. Patrones estructurales.

Si quieres profundizar un poco en estas categorías, puedes [leer más información al respecto][1]. 

Como su nombre lo indica, la idea de este patrón es tener una fábrica que cree objetos de distinto tipo, esto es suprémamente útil cuando no se sabe con antelación que objeto crear, por lo tanto se crearán en tiempo de ejecución. La factoría hace uso de parámetros para determinar qué objeto debe crear, nosotros (obviamente) debemos de proporcionarle tales parámetros.

## ¡Manos a la fábrica!

Qué mejor que un buen ejemplo para interiorizar lo anteriormente explicado, haremos una factoría que cree personas.

### Ingredientes:
1. Una super-clase llamada `Persona`.
2. Dos clases que llevarán por nombre `Masculino` y `Femenino`, estas heredan de `Persona`.
3. Una clase `Factoria`, que nos representará la factoría como tal.
4. Un pequeño fichero, al que llamaremos `main` desde donde se iniciará la aplicación.
5. Sal y pimienta al gusto :)

### Preparación:

En la siguiente imagen podrás ver los ficheros que he creado, todos en el mismo nivel.

![estructura][2]

Ahora miremos queé tienen cada uno de estos, en orden.

1. Super Clase Persona:

{% highlight python %}
"""
Clase que define a una persona
"""

class Persona(object):
	"""Para nuestro caso, una persona tendra un nombre, una edad y un genero, por lo general
	en Java esta clase sería una 'interfaz' """
	def __init__(self):
		self.nombre = None
		self.edad = None
		self.genero = None

	# Algunos getters ...
	def get_nombre(self):
		return self.nombre

	def get_edad(self):
		return self.edad

	def get_genero(self):
		return self.genero

	def __str__(self):
		return "Informacion de una persona:\n1. Nombre: {n}\n2. Edad: {e}\n3. Genero: {g}".format(
			n=self.get_nombre(), e=self.get_edad(), g=self.get_genero())
{% endhighlight %}

2. Clase Femenino:

{% highlight python %}
from persona import Persona

class Femenino(Persona): 
	"""Esta clase hereda de la super clase Persona, solo definiremos su constructor"""
	
	def __init__(self, nombre, edad, genero):
		self.nombre  = nombre
		self.edad = edad
		self.genero = genero
		print "Hola Miss "+nombre+" su edad es "+str(edad)
{% endhighlight %}

3. Clase Masculino:

{% highlight python %}
from persona import Persona

class Masculino(Persona): # Heredamos de Persona
	"""Esta clase hereda de la super clase Persona, solo definiremos su constructor"""

	def __init__(self, nombre, edad, genero):
		self.nombre = nombre
		self.edad = edad
		self.genero = genero
		print "Hola mister "+nombre+" su edad es "+str(edad)
{% endhighlight %}


4. Clase Factoria:

{% highlight python %}
from femenino import Femenino
from masculino import Masculino

class Factoria(object):
	"""Esta clase es nuestra factoria, como ya sabes Python define un constructor sin
	por default para cada clase, por eso no hace falta escribir uno"""

	def get_persona(self, nombre, genero, edad):
		"""Metodo que retorna objetos persona segun el genero"""

		#genero es el parametro usado por la factoria 
		#para elegir qué obj crear
		if (genero is 'F'): 
			return Femenino(nombre, edad, genero)
		elif (genero is 'M'):
			return Masculino(nombre, edad, genero)
{% endhighlight %}	

5. Fichero main:

{% highlight python %}
import factoria
if __name__ == '__main__':
	mi_factoria = factoria.Factoria()

	#Factoria, crea a una persona!
	persona = mi_factoria.get_persona('Guido Vann Rosum', 'M', 30)
	print persona 
	# print persona.get_nombre()
	# print persona.get_genero()
{% endhighlight %}	

Cosas por decir acá:

1. En la clase `Persona` se ha sobrescrito el _método mágico_ `__str__`, para que retorne un pequeño mensaje personalizado a nuestro gusto.

2. En este caso el parámetro usado por la factoría para decidir qué objeto crear es un _char_ que hace alusión al género.

3. En el fichero `main`, cuando escribimos _print persona_, estamos usando el método mágico `__str__` (que ya fue previamente personalizado) para mostrar información del objeto.

4. Podemos hacer uso de otros métodos definidos en `Persona` como `get_nombre()` o `get_genero()` esto gracias a que el objeto creado (objeto `Masculino`) hereda de `Persona` (una relación _es-un_). He comentado lo anterior en el fichero main, puedes descomentar si quieres.

### ¿Que tal si probamos la receta?:

Abre una terminal y ejecuta el fichero `main`, deberías ver algo como esto:

![resultado][3]

¿El platillo se ve bien no?. Te animo a que ahora crees un objeto `Femenino` y mires que pasa, también puedes agregar mas métodos, probar con otros parámetros y por qué no, introducir otras clases; recuerda que puedes comentar si tienes alguna duda. No siendo más, nos vemos en un próximo post. 

{% highlight python %}print("Hasta pronto"){% endhighlight %}

[1]:https://es.wikipedia.org/wiki/Patr%C3%B3n_de_dise%C3%B1o
[2]:../../../../../../images/2016-01-06/estructura.png
[3]:../../../../../../images/2016-01-06/respuesta.png
