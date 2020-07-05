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
