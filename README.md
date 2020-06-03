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
