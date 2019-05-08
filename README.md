Umanage
=======

Este es un API que ofrece servicios para la gestión académica de una institución universitaria, lo que corresponde a  generar los periodos académicos, programas académicos que incluyen añadir asignaturas, asignación de docentes y programación de horarios.

Este proyecto esta generado con:

| Nombre|  Version |
| -------- | -------- |
| 🐘 PHP | 7.2 |
| 💎Eloquent |  5.7|
| 📦 Composer |Latest |
|🐬 MySQL| 8.0.14 |
|📡Apache| 2.4.35 |

## Instalación

Para emular este proyecto en tu equipo, necesitas de algunas herramientas y seguir los siguientes pasos:

### Descargar el proyecto y sus dependencias

1) Instalar [Laragon](https://laragon.org/), este es un entorno local de desarrollo que puedes usar como servidor web local.
2) Busca esta dirección `C:\laragon\www` y descarga este repositorio (Recuerda tu necesitas tener [Git](https://git-scm.com/) en tu computador), escribe el siguiente comando en tu terminal(CMD):

```shell
git clone https://github.com/alelles16/umanage-back.git
```

3) Salta al directo correspondiente con el comando `cd umanage` e instala las dependencias haciendo `php composer.phar install` en la terminal. en este orden de ideas, necesitaras tener [composer](https://getcomposer.org/) en tu proyecto. 
Esto instalará todas las dependencias y los plugins de terceros que nosotros usaremos para este proyecto, como eloquent y el modulo de routing.

### Importa la base de datos

⚠ Por defecto laragon tiene MYSQL 5.7, pero nosotros necesitamos la version 8.0. Para instalar MySQL version 8.0 deberás seguir los siguientes pasos:

1. Descargar MySQL version 8.0 desde [aquí](http://www.mirrorservice.org/sites/ftp.mysql.com/Downloads/MySQL-8.0/mysql-8.0.14-winx64.zip).
2. Ir al directorio `C:\laragon\bin\mysql`.
3. Pegar y extraer el archivo justo como lo descargaste.
4. Ir a `Laragon > Right Click > MySQL > Version` y selecciona `mysql-8.0.14-winx64`.

Ahora, tienes que crear una nueva base de datos para el proyecto, puedes hacer esto abriendo `Laragon > Right click > MySql > Create a new database`. Después de esto, importa el archivo .sql para tener una copia de la base de datos estándar. Puedes hacer esto usando HeidySQL en Laragon.

### Configurando la base de datos

Para cambiar la base de datos y otras configuraciones solamente se requiere editar el archivo `.env` que se encuentra en la raíz del proyecto y añadir las configuraciones correspondientes a la conexión de tu base de datos.

🚨 Este archivo(`.env`) contiene información sensible correspondiente a la conexión con la base de datos tales como contraseñas, usuario y host.

✅ Licencia MIT.
