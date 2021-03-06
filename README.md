# Integración Travis CI
[![Build Status](https://travis-ci.org/di3cruz/integracion_continua_back.svg?branch=master)](https://travis-ci.org/di3cruz/integracion_continua_back)

# Integración Continua Backend

Este proyecto hace parte del [proyecto Integracion_continua](https://github.com/users/di3cruz/projects/2) realizado para la materia Integración Continua del Politécnico Grancolombiano.

El presente repositorio contiene un proyecto realizado en Ruby on Rails, que sirve como API para el proyecto descrito.

Se implementaron los siguientes módulos:

## Módulo de registro

Se implementó un API que responde de la siguiente manera:

| Ruta | Método | Parámetros | Efecto |
-------|--------|------------|--------|
https://integracioncontinuaback.herokuapp.com/usuarios | POST | {"usuario":{"nombre":"James Bond","correo_electronico":"jbond@mi6.org","password":"vesper","password_confirmation":"vesper"}} | Con los parámetros adecuados crea un nuevo usuario. |
https://integracioncontinuaback.herokuapp.com/autenticar | POST | {"correo_electronico":"jbond@mi6.org","password":"vesper"} | Con credenciales válidas devuelve un JSON Web Token usado para autenticar al usuario. |

## Implementación recurso Gasto

Se implementó el API para el recurso gasto de la siguiente manera:

`Para que el API responda correctamente se debe enviar el encabezado 'Authorization' con el valor del token de autorización.`

| Ruta | Método | Parámetros | Efecto |
|------|--------|------------|--------|
https://integracioncontinuaback.herokuapp.com/gastos | GET | - | Devuelve todos los gastos almacenados en la base de datos. |
https://integracioncontinuaback.herokuapp.com/gastos/1 | GET | :id | Devuelve el gasto con el id especificado en la ruta. Para este caso devolvería el gasto con id = 1. |
https://integracioncontinuaback.herokuapp.com/gastos | POST | {"gasto":{"nombre":"Compra de TV","fecha":"2020-06-16","monto": "1500000"} | Crea un nuevo gasto con los parámetros especificados. |
https://integracioncontinuaback.herokuapp.com/gastos/1 | PATCH/PUT | {"gasto":{"nombre":"Compra de TV LED"} | Actualiza el recurso con id 1 con los parámetros especificados. |
https://integracioncontinuaback.herokuapp.com/gastos/1 | DELETE | - | Elimina el gasto con id 1. |

### Pruebas unitarias implementadas

Se implementaron pruebas unitarias para:

#### Modelos

Modelo de Gasto:

- Creación de un nuevo gasto con datos válidos.
- Creación de un nuevo gasto con datos no válidos.

#### Requests

Sobre la ruta /autenticar:

- Devolución del token de autenticación cuando el usuario existe en la base de datos.
- Devolución de statuts `unauthorized`cuando el usuario no existe en la base de datos.

Sobre el controlador de gastos:

- Pruebas sobre la acción index, show, create, update, delete.

Sobre el controlador de usuarios:

- Sobre la acción create con datos válidos y no válidos.

#### Rutas

Sobre cada una de las rutas de gastos.

Los tests pueden encontrarse en el [presente enlace](https://github.com/di3cruz/integracion_continua_back/tree/master/spec).

## Actualización Proyecto

Con el fin de lograr el correcto funcionamiento de las pruebas de la aplicación utilizando el framework de pruebas para Ruby on Rails llamado RSpec, y las herramientas de integración continua Docker, Jenkins, y Travis CI, se realizó lo siguiente:

Se configuraron dos bases de datos PostgreSQL, utilizando el Platform as a Service (PaaS) Heroku, para los ambientes de pruebas y desarrollo, lo que permitió que las herramientas de Docker, Jenkins y TravisCI funcionaran correctamente sin depender de la configuración de una base de datos local para ambos ambientes. El API en producción se conservó en la URL: https://integracioncontinuaback.herokuapp.com

Las bases de datos configuradas fueron:

### Ambiente de Desarrollo

Las credenciales para acceder dicha base de datos son las siguientes:

- host: ec2-34-192-173-173.compute-1.amazonaws.com
- database: d4a66sm07nhnc
- user: odiefvgzgmrjrt
- port: 5432
- password: 29a1ca7ed1f793cdb5b3767627cf43c82f9c97cdc06c832829692f53447467b5

### Ambiente de Pruebas

Las credenciales para acceder dicha base de datos se muestran a continuación:

- host: ec2-34-197-141-7.compute-1.amazonaws.com
- database: df9kll7pq1gdln
- user: hnqpoxlldhycuk
- port: 5432
- password: 5a8f5a094dccc2dfeae043449f394037064f0ebe2c36ee743c5f97a2ed871d4c

Luego de realizar la configuración descrita se pudo validar que las 23 pruebas escritas por el equipo se ejecutan correctamente, y además todas pasan en este punto del desarrollo.

## Herramientas utilizadas

### Docker

Docker es un proyecto de código abierto que sirve para automatizar el despliegue de aplicaciones dentro de contenedores de software. Puede ser ejecutado en diferentes máquinas siempre y cuando cuenten con Docker instalado, sin importar el sistema operativo que tenga dicha máquina.

Docker beneficia tanto a desarrolladores como a testers ya que en el caso de desarolladores permite que estos puedan estar concentrados en el desarrollo de código sin preocuparse porque este pueda funcionar en la máquina en que se vaya a correr. En cuanto a las personas de pruebas facilita el entorno de prueba ya que es sencillo el hecho de crear y eliminar un contenedor facilitando también la ejecución de varios contenedores al tiempo en una misma máquina.

Fuentes: 

- https://aws.amazon.com/es/docker/
- https://platzi.com/contributions/guia-del-curso-de-docker/

### Jenkins

Jenkis inició su desarrollo en el año de 2004 bajo el nombre de Hudson en Sun Microsystems. Es el principal servidor de automatización open source en JAVA. Proporciona complementos que protegen tanto la creación como implementación y automatización de diferentes proyectos, cuenta con una fácil distribución de trabajo en diferentes máquinas facilitando de esta forma las compilaciones, implementaciones en distintas plataformas y pruebas, lo cual permite descubrir fallos de una forma rápida.

Mediante la integración continua Jenkis refuerza la automatización extensible del proceso de desarrollo de software ya que puede utilizarse como un servidor CI o por el contrario puede tener entregas continuas de cualquier proyecto. 

Fuente: https://www.jenkins.io/

# Travis CI

Sistema de integración continua que puede ser gratuito o pago dependiendo del proyecto. Se integra con Github y de forma automática realiza la ejecución del pipeline que está definido para el pull request. Testea gran varied de aplicaciones realizadas en diferentes tecnologías como lo son: Ruby, Objetive-C, Java, Node, entre otras.

Travis permite a los desarrolladores testear de forma completa las diferentes aplicaciones y posterior a esto realizar el deploy sin presentar inconveniente alguno.

Una de las ventajas de usar Travis es que se encuentra compuesto por múltiples tiempos de ejecución o data stores permitiendo así realizar pruebas de las aplicaciones en diferentes configuraciones sin necesidad de tenerlas instaladas localmente.

Fuente: https://www.federico-toledo.com/travis-ci-para-integracion-continua/
