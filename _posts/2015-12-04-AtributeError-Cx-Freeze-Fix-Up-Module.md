---
layout:     post
title:      Error al crear archivos ejecutables con cx_Freeze
date:       2015-12-04 17:35:04
author:     Carlos Andrés Moreno
summary:    Presentación del blog
thumbnail:  python
categories: Blog
tags:
- Cx_Freeze
- Python
- PyQt
- Atribute
- fix_up_module
---
## Introducción
Como ya todos sabemos, Python es un lenguaje de propósito general en el cual puedes construir distintos tipos de aplicaciones en una sintaxis muy amigable, limpia y explícita. Hace poco estaba jugando de nuevo con la librería para la creación de aplicaciones gráficas, llamada PyQt (un envoltorio de Python para Qt, la tan famosa librería de C++), hice algo muy sencillo, una pequeña calculadora, que puedes ver en el [siguiente enlace][1]. No te miento, me gustó mucho como quedó esta sencilla aplicación, tanto así que decidí hacer un ejecutable, para mostrársela a mis amigos.
No era la primera vez que generaba un ejecutable para una aplicación gráfica en Python, por lo que me sentí confiado, claro que esta vez estaba usando Python 3.4, así que investigando encontré una librería llamada [cx_Freeze][2], acá fue donde me tuve que romper un poco la cabeza, pues no iba a ser tan fácil como la primera vez.

## El Problema
Supongo que ya has instalado cx_Frezee en tu máquina y que tienes Python y pip configurados, cabe agregar que tengo un Windows 7 Ultimate de 32 bits (sí, codeo en Python usando Windows...). A continuación, debes de crear un archivo en el mismo nivel donde está tu archivo principal (desde donde corres la aplicación en mi caso es `main.py`), ponle un nombre cualquiera, yo le pondré `exe.py`. A continuación te muestro mi estructura de archivos.

![estructura][3]

Abre `exe.py` y coloca lo siguiente:

{% highlight python %}
import sys
from cx_Freeze import setup, Executable

 #Si la plataforma es Windows, seteas base a "Win32GUI", pues los archivos ejecutables con cx_Freeze se construyen
 #por default para aplicaciones de consola, por lo que base SIEMPRE estará seteada en 'Console',
 #A menos de que tengamos esta condición.
if sys.platform == "win32":
    base = "Win32GUI"

ejecutables = [Executable( 
	"main.pyw", #Este es mi archivo principal, el que arranca con la ejecucion de mi app 
	base = base, #Si no te funciona, prueba con base = "Win32GUI"
	targetName = "Vibora.exe", #El nombre que quieres que tenga tu ejecutable
	)]

setup(
	name = "Vibora",#El nombre de tu aplicación
	version = "2.0",
	options = {
		"build_exe":{
			"include_files":["images/"]}#Si tu aplicación necesita imágenes, sonidos o fonts, acá lo incluyes
		},
	executables	= ejecutables
)
{% endhighlight %}

Las líneas que considero son importantes, las he comentado, de cualquier forma en la [documentación de cx_Freeze][4] puedes ver un montón de variables que puedes usar para configurar el ejecutable que generarás.

Abre tu cmd, dirígite a la raíz de tu aplicación, y ejecuta `python.exe exe.py build`, este comando te construirá una carpeta con nombre `build`, dentro de ella encontrarás una segunda carpeta, ábrela y podrás ver lo que se ha generado, tu archivo ejecutable debe de estar allí.
Muy bien, dale doble click al archivo. Algo macabro y tenebroso ha pasado, tenemos un error: `AttributeError 'module' object has no attribute '_fix_up_module'`, pero tranquilo, ya vamos a resolverlo.

##Solución

El error consiste en un bug que tiene la librería al trabajar en Windows, lo que debes de hacer es dirigirte a [este sitio][5], y descargarte un archivo con extensión `.whl` pero, ¿cúal de todos?, si tienes instalado Python 3.4 como es mi caso, debes de bajarte `cx_Freeze-4.3.4-cp34-none-win32.whl`. Si tienes instalado otra distribución, fíjate en el número que está después de `cp`, te lo muestro en una imagen:

![elección][6]

Cabe agregar que mi máquina es de 32 bits, si la tuya es de 64 bits, descarga bien el archivo de 64 bits, o bien el de 32, para ambos funcionará.

Cuando lo hayas instalado abre tu cmd y coloca `pip install nombre_archivo.whl`, donde `nombre_archivo.whl`, será el archivo que te has descargado previamente. Espera a que se ejecute, lo que hará será compilar de `.whl` a `.py` y arreglará el bug que la librería presenta. Con esto, vuelve a repetir los pasos para generar el ejecutable, ya sabes: `python.exe exe.py build` dentro del directorio de tu aplicación. ¡Y listo, error solucionado!

Espero que ahora puedas generar tus archivos ejecutables y presumir un poco con tus amigos, si tienes alguna duda en cualquiera de los pasos anteriores, siempre puedes comentar. No siendo más nos vemos en un próximo post. {% highlight python %}print("Hasta pronto"){% endhighlight %}

[1]:https://github.com/CarMoreno/Vibora
[2]:http://cx-freeze.sourceforge.net/
[3]:../../../../../images/2015-12-04/estructura.png
[4]:http://cx-freeze.readthedocs.org/en/latest/index.html 
[5]:http://www.lfd.uci.edu/~gohlke/pythonlibs/#cx_freeze
[6]:../../../../../images/2015-12-04/eleccion.png