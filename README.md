
# **Aprendizaje de Docker**

En este archivo explicare lo que aprendí de docker y lo voy a dividir en estos apartados:

- ¿Que es Docker?
- Teoría 
    - Contenedores
    - Imagenes
- Reflexiones 
    - Ventajas
    - Desafios
    - Uso Practico
- Ejemplo
- Anexos 

## ¿Que es Docker?

Docker desktop es una máquina virtual,  que corre Linux, y se usa para crear contenedores con base a imagenes, usada principalmente por lo ligero y más conveniente de otra máquina virtual

## Teoría 

En este apartado explicare la teoría, como los conceptos de contenedores e imágenes.

### Contenedores

Los contenedores son un conjunto de imagenes y datos almacenados y empaquetados para que sea facil compartir y trabajar con el mismo contenedor al mismo tiempo sin necesidad de tener la misma versión de los programas. 

Evita los errores y que el proceso se vea detenido por devolverse a una fase anterior.

Los contenedores son independientes uno del otro, lo que permite que distintos contenedores corran distintas versiones de una misma imagen

### Imágenes

Las imágenes son conjunto de codigo, y todo lo que es necesario para que funcione dentro de un contenedor.

Estás imágenes principalmente son usadas para evitar problemas con versiones, ya que puedes descargar múltiples versiones de una sola imagen, y aún así, no te presentará error.

Por ejemplo, con MariaDB  puedes crear un contenedor que contenga la última versión de la imagen, generalmente representada con un latest, y otro contenedor con una versión más antigua, y aún así no presentará problema

Tambien, si ya tienes la última versión de una imagen (o cualquier otra versión), no tendrás que descargar lo mismo otra vez, si ya está dentro de dicha imagen.

## Reflexiones

Antes de comenzar, quiero decir que este tema es bastante interesante, básicamente evitas los problemas a largo plazo, sin que cueste tiempo ni mucho esfuerzo, con esto procederé a decir lo que pienso:

### Ventajas 

Las ventajas son bastantes, como explicaba antes, la ventaja principal es que evita problemas con versiones y el retroceso de proyectos.

Una ventaja en el aprendizaje, es que realmente entenderlo es bastante fácil, y es un buen complemento para entender bases de datos y como empezar con un proyecto

### Desafíos

Un gran desafío es la experiencia necesaria para desarrollarnos en base de datos, ya que de por si apenas vamos entendiendo y nos faltan cosas por ver, y pues me falta experiencia y práctica, pero por lo que entendí de los vídeos, podré desarrollar proyectos de manera profesional 

### Uso Practico 

En el uso práctico, docker es perfecto para proyectos profesionales y de portafolio, ya que no te arriesgas a mucho peso y a problemas con la versión del empresario, y de paso, conoces los programas para que no te sientas perdido en la industria 

## Ejemplo 

A continuación voy a mostrar un ejemplo basico de una creación de un contenedor con una imagen como MariaDB

~~~
- docker pull mariadb
- docker images  
- docker create -d -p 3306:3306 --name -e Mariadb-container MARIADB_ROOT_PASSWORD:1234 mariadb
- docker start Mariadb-container
- docker ps
~~~

## Anexos

- Dockerhub, dónde puedes buscar todas las imágenes y es el repositorio de contenedores:  [Dockerhub][hub]
[hub]: https://hub.docker.com/
