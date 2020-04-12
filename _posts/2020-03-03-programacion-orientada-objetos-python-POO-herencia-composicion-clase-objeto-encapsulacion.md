---
layout: post
title: Python con Súper poderes - Programación Orientada a Objetos 
date: 2020-03-03 10:49:19
author: Carlos Andrés Moreno
summary: En este articulo se explican los conceptos de Programación Orientada a objetos y hacemos ejemplos de los conceptos vistos usando Python.
categories: python
thumbnail: python
tags:
  - POO
  - Python
---

# Introducción

Hace mucho tiempo quería escribir sobre programación orientada a objetos con Python, pero últimamente no he contado con el tiempo suficiente para volver a escribir como quisiera, y personalmente prefiero escribir de forma pausada, calmada y con tiempo, esto permite crear post de calidad y no solo escribir por escribir. Ahora mismo por fin he tenido algo de tiempo y me he decidido construir el presente post.

Será un artículo bastante extenso, pues la idea es abarcar todos los conceptos de programación orientada a objetos y realizar ejemplos en Python para aterrizar en código lo aprendido. Antes de empezar menciono que estoy usando la versión 3.7 de Python en Windows 10 de 64 bits.

# Conceptos de Programación Orientada a objetos

Sí, hay montones de lugares donde puedes encontrar información sobre los diferentes conceptos de programación orientada a objetos, intentaré ser lo mas conciso y claro al explicar cada uno de ellos.

## Clase

Una clase es un conjunto de propiedades y comportamientos que definen a cierta entidad en particular. Por ejemplo, piensa en un Carro. Todos los carros tienen 4 llantas, una marca, un color, modelo y un número de placa (propiedades); así mismo todos los carros pueden acelerar, frenar y voltear a la izquierda o a la derecha (comportamientos). Entonces, podríamos pensar en Carro como una clase.

En Python podemos definir una nueva clase usando la palabra reservada `class` seguido del nombre de la clase, he creado un fichero con nombre `POO_Python.py`. Miremos:

{% highlight python %}
class Carro:
    
    def __init__(self, marca, color, placa, modelo):
        # Propiedades
        self.numero_llantas = 4
        self.marca = marca
        self.color = color
        self.placa = placa
        self.modelo = modelo

{% endhighlight %}

El código anterior crea una clase llamada Carro, el cual tiene los atributos `numero_llantas`, `marca`, `color`, `placa` y `modelo`. El atributo `numero_llantas` es una constante, siempre será 4.

Ahora vamos con los comportamientos, que en términos generales son las funciones o métodos de la clase.

{% highlight python %}
    ...
    ...
    def acelerar(self):
        print(f"Soy {self.marca}, estoy acelerando!!")
    
    def frenar(self):
        print(f"Soy {self.marca}, estoy frenando!!")
    
    def voltear(self, direccion):
        print(f"Soy {self.marca}, estoy volteando a la {direccion}")
    
    def __str__(self):
        """Este método nos servirá para ver una representación en cadena del objeto"""
        return self.marca
{% endhighlight %}

Definimos 3 métodos propios: _acelerar()_, _frenar()_ y _voltear()_ y el método _\_\_str\_\_()_ que te dejo de tarea para que investigues más acerca de él ([mira acá](https://www.tutorialesprogramacionya.com/pythonya/detalleconcepto.php?punto=49&codigo=49&inicio=45)). Como ves, los métodos que creamos simplemente mostrarán por pantalla un mensaje indicando la acción que el carro está realizando.

## Objeto

Un objeto es la instancia de una clase. En la clase definimos los atributos y comportamientos en común que todos los **objetos** que pertenezcan a esa clase, van a tener. Entonces, si tenemos un carro de _color rojo_, _modelo 2020_, _marca Mazda 6_ y con _placa RED126_ claramente estamos haciendo referencia a un objeto de la clase Carro definida anteriormente. En Python definimos un nuevo objeto de clase, de esta forma:

{% highlight python %}

...
...

# Objetos carro, se instancia un nivel de sangría atrás, fuera de la clase.
obj_mazda = Carro('Mazda 6', 'Rojo', 'RED126', '2020')
obj_renault = Carro('Renault Logan', 'Negro', 'FRE009', '2021')
obj_audi = Carro('Audi Q3', 'Blanco', 'DPK312', '2016')
{% endhighlight %}

Una vez hemos creado los objetos, hagamos algunas pruebas:

{% highlight python %}

...
...

# Objetos carro, se instancia un nivel de sangría atrás, fuera de la clase.
obj_mazda = Carro('Mazda 6', 'Rojo', 'RED126', '2020')
obj_renault = Carro('Renault Logan', 'Negro', 'FRE009', '2021')
obj_audi = Carro('Audi Q3', 'Blanco', 'DPK312', '2016')

# Miramos por consola cada objeto
print(obj_mazda)
print(obj_renault)
print(obj_audi)

# El Mazda 6, va a voltear a la izquierda
obj_mazda.voltear('izquierda')

# El Audi Q3, va a voltear a la derecha
obj_audi.voltear('derecha')

# El Renault Logan va a acelerar
obj_renault.acelerar()

{% endhighlight %}

Si ejecutamos el programa anterior, tendremos la siguiente salida:

![ejecutando_ejemplo_clases_poo_python](https://i.imgur.com/T7Dl2QA.png)

Ahora que ya tienes una idea de cómo crear clases y objetos en Python, vamos con otro concepto muy importante en el paradigma de programación orientado a objetos: La Herencia. Pero antes, [aquí](https://gist.github.com/CarMoreno/a9658c551bb8d15f4579b25bc90e4cd0#file-poo_python-py) tienes el código completo de la primera parte de este artículo.

## Herencia

Imagina que puedas crear una clase general (también conocida como clase padre) en la cual definas atributos y comportamientos en común, para luego poder re-utilizarlos en otras clases (clases hijas). Bien, a esto se le conoce como Herencia, una relación entre dos o más clases, una característica muy potente de la programación orientada a objetos.

Sigamos con el ejemplo de la clase Carro, ¿no crees que _color_, _marca_ y _modelo_ son atributos que una motocicleta, un barco, un avión o una bicicleta también tienen?, de hecho _acelerar_, _frenar_ y _voltear_ son acciones que cualquier **Vehículo** puede realizar (bueno, un avión no puede frenar en el aire pero sí en el aterrizaje). Así, podemos crear una clase padre llamada Vehículo y tener en ella los atributos y métodos comunes de cualquier vehículo.

{% highlight python %}
class Vehiculo:
    
    def __init__(self, marca, color, placa, modelo):
        self.marca = marca
        self.color = color
        self.placa = placa
        self.modelo = modelo
    
    def acelerar(self):
        print(f"Soy {self.marca}, estoy acelerando!!")
    
    def frenar(self):
        print(f"Soy {self.marca}, estoy frenando!!")
    
    def voltear(self, direccion):
        print(f"Soy {self.marca}, estoy volteando a la {direccion}")
    
    def __str__(self):
        """Este método nos servirá para ver una representación en cadena del objeto"""
        return self.marca

{% endhighlight %}

La clase Vehículo es nuestra clase padre, vamos a re-escribir la clase Carro que teníamos anteriormente para que herede de Vehículo.

{% highlight python %}
class Carro (Vehiculo):
    numero_llantas = 4

    def tocar_claxon(self):
        print(f"Soy {self.marca}, y estoy tocando el claxon!!")
{% endhighlight %}

Cuando escribimos el nombre de la clase, entre paréntesis debemos pasarle el nombre de la clase padre, de la cual vamos a heredar. Fíjate que el atributo `numero_llantas` inicializado en 4 es propio de la clase Carro, no debemos colocar este atributo en la clase padre ya que no todos los **Vehiculos** tienen 4 llantas, también definimos un método llamado _tocar\_claxon()_ muy propio de la clase Carro, una de las ventajas de tener ordenada de esta forma las clases, es que las líneas de código se ven reducidas significativamente.

Entonces en la clase padre colocamos los atributos y métodos comunes y en las clases hijas atributos y métodos particulares. Gracias a la clase Vehiculo podemos crear otras dos clases hijas y heredar: Motocicleta y Avion.

{% highlight python %}
class Motocicleta (Vehiculo): 
    numero_llantas = 2

    def encender_con_patada(self):
        print(f"Soy {self.marca} y estoy encendiendo con patada!!")

class Avion (Vehiculo):
    numero_llantas = 32
    
    def sacar_llantas(self):
        print(f"Soy {self.marca} y estoy sacando las llantas!!")
    
    def aterrizar(self):
        print(f"Soy {self.marca} y estoy aterrizando!!")
{% endhighlight %}

Una vez creadas las clases, instanciemos algunos objetos y hagamos pruebas:

{% highlight python %}

# Creamos Objetos Carro
obj_mazda = Carro('Mazda 6', 'Rojo', 'RED126', '2020')
obj_renault = Carro('Renault Logan', 'Negro', 'FRE009', '2021')
obj_audi = Carro('Audi Q3', 'Blanco', 'DPK312', '2016')

# Creamos Objetos Motocicleta
obj_honda = Motocicleta('Honda CB 500', 'Negro', 'XDR321', '2018')
obj_yamaha = Motocicleta('Yamaha R10', 'Azul', 'GTR576', '2016')
obj_suzuky = Motocicleta('Suzuky VStrom 650', 'Gris', 'RET841', '2020')

# Creamos Objeto Avion
obj_jet = Avion('Jet Privado', 'Blanco', 'G-DER4', '2014')


# El Mazda 6, va a voltear a la izquierda
obj_mazda.voltear('izquierda')

# El Audi Q3, va a voltear a la derecha
obj_audi.voltear('derecha')

# El Renault Logan va a acelerar
obj_renault.acelerar()

# ---------------------------------------------------------------

# La Honda va a encender con patada.
obj_honda.encender_con_patada()

# La Honda, va a voltear a la izquierda
obj_honda.voltear('izquierda')

# La Yamaha, va a voltear a la derecha
obj_yamaha.voltear('derecha')

# La Suzuky va a frenar
obj_suzuky.frenar()

# ----------------------------------------------

# El Jet acelera
obj_jet.acelerar()

# El Jet voltea a la derecha
obj_jet.voltear('derecha')

# El Jet saca las llantas
obj_jet.sacar_llantas()

# Y aterriza.
obj_jet.aterrizar()

{% endhighlight %}

Abriendo la terminal y ejecutando este código, tenemos los siguientes resultados.

![ejecutando-herencia-poo-python](https://i.imgur.com/E759KpU.png)

Vemos entonces que todos los métodos de la clase padre Vehiculo, pueden ser usados por los hijos, pero si intentamos hacer algo como:

{% highlight python %} obj_mazda.sacar_llantas() {% endhighlight %}

Obtendremos un error el cual nos indica que la clase Carro no tiene un método _'sacar_llantas'_

![ejecutando-herencia-poo-python-error](https://i.imgur.com/o2nPk4Z.png)

Lo cual es correcto, ya que este método se encuentra en la clase Avion.

La Herencia es un tipo de relación que existe entre las clases, pero no es la única. Existe otra relación conocida como Composición, antes de continuar, puedes acceder al código que llevamos hasta este punto del articulo haciendo clic [aquí](https://gist.github.com/CarMoreno/a9658c551bb8d15f4579b25bc90e4cd0#file-herencia-py).

## Composición

Si has montado en un carro alguna vez te has podido dar cuenta que dentro existen otros objetos mas complejos, **tiene una** palanca de cambios, **tiene** cinturones de seguridad, **tiene unos** asientos, entre otros objetos. Cada objeto por si mismo puede ser representado por una clase, para nuestro ejemplo miremos la clase PalancaCambio.

{% highlight python %}
class PalancaCambio:
    
    # Suponemos que el carro arranca en Neutro (cambio 0 para nosotros)
    cambio_actual = 0 

    def __init__(self, numero_cambios = 4, color='Negro', peso='50gr'):
        self.numero_cambios = numero_cambios
        self.color = color
        self.peso = peso

    def subir_cambio(self):
        self.cambio_actual = self.cambio_actual + 1
        if (self.cambio_actual == self.numero_cambios):
            print("No puedo subir mas cambios")
        print(f"Palanca de cambio sube el cambio a {self.cambio_actual}")
    
    def bajar_cambio(self):
        self.cambio_actual = self.cambio_actual - 1
        if (self.cambio_actual == 0):
            print("No puedo bajar mas cambios")
        print(f"Palanca de cambio baja el cambio a {self.cambio_actual}")

    def __str__(self):
        return f"Palanca de Cambio de {self.numero_cambios} velocidades"

{% endhighlight %}

La clase PalancaCambio tiene 3 atributos: `numero_cambios` el cual es 4 por defecto, `color`, el cual es 'Negro' por defecto y `peso` que es '50gr' por defecto. Ahora, **por motivos del ejemplo supongamos que todos los vehículos deben contar con una palanca de cambios** (un bote por ejemplo, es un ejemplo de un vehículo sin palanca de cambios). Teniendo esto en cuenta, decimos que todo vehículo **tiene una** palanca de cambios.

La composición trata de una relación semántica entre una clase que _"Tiene"_ y una clase que _"Hace Parte"_. En nuestro caso la clase Vehiculo _"Tiene"_ un objeto PalancaCambio y a su vez, el objeto PalancaCambio "Hace Parte" de Vehiculo y semánticamente tiene sentido. Miremos entonces como quedaría la clase Vehiculo.

{% highlight python %}
class Vehiculo:
    
    def __init__(self, marca, color, placa, modelo):
        self.marca = marca
        self.color = color
        self.placa = placa
        self.modelo = modelo
        # Todo Vehículo tiene una Palanca de Cambios
        # y a su vez, toda Palanca de Cambios hace parte de un Vehículo
        self.palanca_cambio = PalancaCambio() 
    
    def acelerar(self):
        print(f"Soy {self.marca}, estoy acelerando!!")
    
    def frenar(self):
        print(f"Soy {self.marca}, estoy frenando!!")
    
    def voltear(self, direccion):
        print(f"Soy {self.marca}, estoy volteando a la {direccion}")
    
    def __str__(self):
        """Este método nos servirá para ver una representación en cadena del objeto"""
        return self.marca

{% endhighlight %}

La anterior sería la única modificación que haríamos a la clase Vehiculo, ahora podemos hacer pruebas para verificar la funcionalidad de la palanca de cambios.

{% highlight python %}
# Creamos el objeto carro, Mazda 6.
obj_mazda = Carro('Mazda 6', 'Rojo', 'RED126', '2020')

print(obj_mazda)

# Establecemos a 8 el numero de cambios para este carro
# y el peso de la palanca de cambios en 25gr
obj_mazda.palanca_cambio.numero_cambios = 8
obj_mazda.palanca_cambio.peso = '25gr'
print(obj_mazda.palanca_cambio)

# Subimos un cambio
obj_mazda.palanca_cambio.subir_cambio()

# ---------------------------------------------------------------

# Creamos el objeto Motocicleta, Honda CB 500
obj_honda = Motocicleta('Honda CB 500', 'Negro', 'XDR321', '2018')
print(obj_honda)

# Establecemos a 6 el numero de cambios para esta moto
obj_honda.palanca_cambio.numero_cambios = 6
print(obj_honda.palanca_cambio)

# Subimos un cambio
obj_honda.palanca_cambio.subir_cambio()
{% endhighlight %}

Si ejecutamos de nuevo el código, con los cambios realizados, tenemos los siguientes resultados:

![ejecucion-composicion-poo-python](https://i.imgur.com/jZL2Yrx.png)

Podemos observar entonces que, gracias al objeto `palanca_cambio` que se encuentra en la clase Vehiculo, todas las clases hijas pueden acceder a su palanca de cambios y establecer las particularidades de este objeto. Prueba hacer lo mismo con el objeto `obj_jet`. 

Si quieres profundizar más sobre las relaciones entre clases, en el siguiente [link](https://vcalpena.wordpress.com/6-relaciones-entre-clases-herencia/) puedes acceder a un artículo que te explica más al respecto. El código hasta este punto del post puedes verlo [aquí](https://gist.github.com/CarMoreno/a9658c551bb8d15f4579b25bc90e4cd0#file-composicion-py)

## Encapsulación

Este último concepto del paradigma de programación orientada a objetos, nos dice que una clase no debería poder modificar directamente los atributos de otra clase, sino que deberían haber métodos de acceso con los cuales podamos cambiar y obtener estos atributos (los famosos _getters_ y _setters_). Si prestaste atención al ejemplo del apartado anterior te haz podido dar cuenta que los objetos de las clases hijas han accedido directamente a un atributo de la clase padre y han modificado su valor, violando así el principio de encapsulación. Específicamente las siguientes líneas:

{% highlight python %}
...
obj_mazda.palanca_cambio.numero_cambios = 8
obj_mazda.palanca_cambio.peso = '25gr'
...
obj_honda.palanca_cambio.numero_cambios = 6
...
{% endhighlight %}

Debemos entender entonces que los atributos de una clase pueden presentar tres niveles de privacidad:

**1. Públicos:** Todos los atributos que hemos escrito hasta ahora son públicos, simplemente creando un objeto de dicha clase y usando la sintaxis del punto, podemos acceder y modificar desde otra clase cualquier atributo.

**2. Protegidos:** Establece que un atributo solo puede ser accedido y modificado por la clase en sí misma y sus clases hijas (si es que tiene), este concepto va entonces muy de la mano con la Herencia. Para definir un atributo como protegido, debes declararlo con un "guion bajo", todos los atributos de la clase Vehículo, deberían ser protegidos.

{% highlight python %}
class Vehiculo:
    
    def __init__(self, marca, color, placa, modelo):
        self._marca = marca
        self._color = color
        self._placa = placa
        self._modelo = modelo
    
    def _acelerar(self):
        print(f"Soy {self.marca}, estoy acelerando!!")
    
    def _frenar(self):
        print(f"Soy {self.marca}, estoy frenando!!")
    
    def _voltear(self, direccion):
        print(f"Soy {self.marca}, estoy volteando a la {direccion}")
{% endhighlight %}

**3. Privados:** Establece que un atributo puede ser accedido **únicamente** desde la clase donde fue definido. Es este sentido, los atributos propios de las clases hijas y los atributos de la clase PalancaCambios deberían ser privados y tener los correspondientes _getters_ y _setters_ para acceder a estos. Para que un atributo sea privado en Python, debemos anteponer _"dobles guiones bajo"_

Realizando las correspondientes modificaciones a la clase PalancaCambios, tendríamos lo siguiente:
{% highlight python %}
class PalancaCambio:
    
    # Suponemos que el carro arranca en Neutro (cambio 0 para nosotros)
    __cambio_actual = 0 

    def __init__(self, numero_cambios = 4, color='Negro', peso='50gr'):
        # Los atributos son ahora privados
        self.__numero_cambios = numero_cambios
        self.__color = color
        self.__peso = peso
    
    # Getters y Setters
    def get_numero_cambios(self):
        return self.__numero_cambios
    
    def set_numero_cambios(self, numero_cambios):
        self.__numero_cambios = numero_cambios

    def get_color(self):
        return self.__color
    
    def set_color(self, color):
        self.__color = color

    def get_peso(self):
        return self.__peso
    
    def set_peso(self, peso):
        self.__peso = peso
    # Fin Getters y Setters
    
    def subir_cambio(self):
        self.__cambio_actual = self.__cambio_actual + 1
        if (self.__cambio_actual == self.__numero_cambios):
            print("No puedo subir mas cambios")
        print(f"Palanca de cambio sube el cambio a {self.__cambio_actual}")
    
    def bajar_cambio(self):
        self.__cambio_actual = self.__cambio_actual - 1
        if (self.__cambio_actual == 0):
            print("No puedo bajar mas cambios")
        print(f"Palanca de cambio baja el cambio a {self.__cambio_actual}")

    def __str__(self):
        return f"Palanca de Cambio de {self.__numero_cambios} velocidades"
{% endhighlight %}

Definimos entonces tres _getters_ y tres _setters_, uno por cada atributo privado, de esta manera nos aseguramos de acceder a estos atributos por medio de estos métodos, que actuan como una especie de interfaz.

Y las clases hijas quedarían así:

{% highlight python %}
class Carro (Vehiculo):

    # Atributo privado
    __numero_llantas = 4

    def set_numero_llantas(self, numero_llantas):
        self.__numero_llantas = numero_llantas

    def get_numero_llantas(self):
        return self.__numero_llantas
        
    def tocar_claxon(self):
        print(f"Soy {self._marca}, y estoy tocando el claxon!!")

class Motocicleta (Vehiculo):

    # Atributo privado
    __numero_llantas = 2

    def set_numero_llantas(self, numero_llantas):
        self.__numero_llantas = numero_llantas

    def get_numero_llantas(self):
        return self.__numero_llantas

    def encender_con_patada(self):
        print(f"Soy {self._marca} y estoy encendiendo con patada!!")

class Avion (Vehiculo):

    # Atributo privado
    __numero_llantas = 32
    
    def set_numero_llantas(self, numero_llantas):
        self.__numero_llantas = numero_llantas

    def get_numero_llantas(self):
        return self.__numero_llantas

    def sacar_llantas(self):
        print(f"Soy {self._marca} y estoy sacando las llantas!!")

    
    def aterrizar(self):
        print(f"Soy {self._marca} y estoy aterrizando!!")
{% endhighlight %}

Por último, las pruebas de estas modificaciones, las realizamos de la siguiente forma:

{% highlight python %}
# Creamos el objeto carro, Mazda 6.
obj_mazda = Carro('Mazda 6', 'Rojo', 'RED126', '2020')

print(obj_mazda)

# Establecemos a 8 el numero de cambios para este carro
# y el peso de la palanca de cambios en 25gr.

# Usamos el metodo set_numero_cambios
obj_mazda._palanca_cambio.set_numero_cambios(8) 
# Usamos el metodo set_peso
obj_mazda._palanca_cambio.set_peso('25gr') 
print(obj_mazda._palanca_cambio)

# Subimos un cambio
obj_mazda._palanca_cambio.subir_cambio()

# ---------------------------------------------------------------

# Creamos el objeto Motocicleta, Honda CB 500
obj_honda = Motocicleta('Honda CB 500', 'Negro', 'XDR321', '2018')
print(obj_honda)

# Usamos el metodo set_numero_cambios
obj_honda._palanca_cambio.set_numero_cambios(6)
print(obj_honda._palanca_cambio)

# Subimos un cambio
obj_honda._palanca_cambio.subir_cambio()
{% endhighlight %}

Ahora puedes ver que no accedemos al atributo `__numero_cambios` directamente, sino que lo modificamos haciendo uso del metodo _set\_numero\_cambios()_, de igual manera con el atributo peso de la clase PalancaCambio.

Hay que recalcar algo muy importante y es que Python no fue pensado para realizar encapsulacion de atributos, de hecho existen desarrolladores que afirman que programar de esta manera en Python va en contra de la filosofía del lenguaje. De cualquier manera, eres libre de adoptar la encapsulación en tus clases o no. La forma en la cual elaboramos los ejemplos es un buen punto de partida para adoptar este principio en tus programas. El código del último ejemplo con los _getters_ y _setters_ lo puedes encontrar [aquí](https://gist.github.com/CarMoreno/a9658c551bb8d15f4579b25bc90e4cd0#file-composicion_encapsulacion-py).

# Conclusiones
En este post tratamos de cubrir la mayoría de conceptos de programación orientado a objetos que son aplicables a Python, hablando desde qué es una Clase hasta la Encapsulación, ofreciendo ejemplos a medida que avanzabamos en el proceso. Espero que luego de haber terminado de leer, hayas comprendido cómo aplicar este paradigma de programación en tus nuevos programas escritos en Python.

Si tienes algo que agregar, puedes dejar tu comentario más abajo. Gracias por llegar hasta aquí.

{% highlight python %}print("Hasta pronto"){% endhighlight %}