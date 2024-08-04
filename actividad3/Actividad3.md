## Parte 1: Gestión de usuarios

### 1. <b>Creación de usuarios</b>: Crea tres usuarios llamados 'usuario1', 'usuario2' y 'usuario3'.

```
$ sudo useradd -m usuario1
```

```
$ sudo useradd -m usuario2
```

```
$ sudo useradd -m usuario3
```

### <b>2. Asignación de contraseñas</b>: Establece una nueva contraseña para cada usuario.

```
$ sudo passwd usuario1
```

```
Nueva contraseña:
Vuelva a escribir la nueva contraseña:
passwd: contraseña actualizada correctamente
```

```
$ sudo passwd usuario2
```

```
Nueva contraseña:
Vuelva a escribir la nueva contraseña:
passwd: contraseña actualizada correctamente
```

```
$ sudo passwd usuario3
```

```
Nueva contraseña:
Vuelva a escribir la nueva contraseña:
passwd: contraseña actualizada correctamente
```

### <b>3. Información de usuarios</b>: Muestra la información de 'usuario1' usando el comando 'id'.

```
$ sudo id usuario1
```

```
uid=1002(usuario1) gid=1002(usuario1) grupos=1002(usuario1)
```

### <b>4. Eliminación de usuarios</b>: Elimina 'usuario3', pero conserva su directorio principal.

```
$ sudo userdel usuario3
```

## Parte 2: Gestión de grupos

### <b>1. Creación de grupos</b>: Crea dos grupos llamados 'grupo1' y 'grupo2'.

```
$ sudo groupadd grupo1
```

```
$ sudo groupadd grupo2
```

### <b>2. Agregar usuarios a grupos</b>: Agregar 'usuario1' a 'grupo1' y 'usuario2' a 'grupo2'.

```
$ sudo usermod -aG grupo1 usuario1
```

```
$ sudo usermod -aG grupo2 usuario2
```

### <b>3. Verificar membresía</b>: Verifica que los usuarios han sido agregados a los grupos utilizando el comando 'groups'.

```
$ sudo groups usuario1
```

```
usuario1 : usuario1 grupo1
```

```
$ sudo groups usuario2
```

```
usuario1 : usuario2 grupo2
```

### <b>4. Eliminar gupo</b>: Elimina 'grupo2'.

```
$ sudo groupdel grupo2
```

## Parte 3: Gestión de permisos

### 1. <b>Creación de archivos y directorios</b>

Como 'usuario1', cree un archivo llamado 'archivo1.txt' en su directorio principal y escribe algo en él. Crear un directorio llamado 'directorio1' y dentro de ese directorio un archivo llamado 'archivo2.txt'.

```
$ su - usuario1
```

```
$ echo "SO1" > archivo1.txt
```

```
$ mkdir directorio1 && cd directorio1
```

```
$ touch archivo2.txt
```

### 2. <b>Verificar permisos</b>

Verifica los permisos del archivo y directorio usando el comando 'ls -l' y 'ls -d' respectivamente.

```
$ cd && ls -l archivo1.txt
```

```
-rw-r--r-- 1 usuario1 usuario1 4 ago  4 10:54 archivo1.txt
```

```
$ ls -ld directorio
```

```
drwxr-xr-x 2 usuario1 usuario1 4096 ago  4 10:55 directorio1
```

### 3. <b>Modificar permisos usando 'chmod' con modo numérico</b>

Cambia los permisos del 'archivo1.txt' para que solo 'usuario1' pueda leer y escribir (permisos 'rw-'), el grupo pueda leer (permisos 'r--') y nadie más pueda hacer nada.

```
$ chmod 640 archivo1.txt && ls -l archivo1.txt
```

```
-rw-r----- 1 usuario1 usuario1 4 ago  4 10:54 archivo1.txt
```

### 4. <b>Modificar permisos usando 'chmod' con modo simbólico</b>

Agrega permisos de ejecución al propietario del archivo2.txt

```
$ cd && cd directorio1
```

```
$ chmod u+x archivo2.txt && ls -l archivo2.txt
```

```
-rwxr--r-- 1 usuario1 usuario1 0 ago  4 11:20 archivo2.txt
```

### 5. <b>Cambiar el grupo propietario</b>

Cambia el grupo propietario de 'archivo2.txt' a 'grupo1'.

```
$ sudo chgrp grupo1 /home/usuario1/directorio1/archivo2.txt && ls -l /home/usuario1/directorio1/archivo2.txt
```

```
-rwxr--r-- 1 usuario1 grupo1 0 ago  4 11:20 /home/usuario1/directorio1/archivo2.txt
```

### 6. <b>Configurar permisos de directorio</b>

Cambia los permisos del 'directorio1' para que solo el propietario pueda entrar (permisos 'rwx'), el grupo pueda listar contenidos pero no entrar (permisos 'r--'), y otros no puedan hacer nada.

```
$ sudo chmod 740 /home/usuario1/directorio1
```

### 7. <b>Comprobación de acceso</b>

Intenta acceder al 'archivo1.txt' y 'directorio1/archivo2.txt' como 'usuario2'. Nota como el permiso de directorio afecta el acceso a los archivos dentro de él.

```
$ su - usuario2
```

```
$ cat /home/usuario1/archivo1.txt
```

```
 cat: /home/usuario1/archivo1.txt: Permiso denegado
```

```
$ ls -l /home/usuario1/archivo1.txt
```

```
-rw-r----- 1 usuario1 usuario1 4 ago  4 10:54 /home/usuario1/archivo1.txt
```

```
$ cd /home/usuario1/directorio1
```

```
-sh: 7: cd: can't cd to /home/usuario1/directorio1
```

```
 $ ls -ld /home/usuario1/directorio1
```

```
drwxr----- 2 usuario1 usuario1 4096 ago  4 11:20 /home/usuario1/directorio1
```

### 8. <b>Verificación final</b>

Verifica los permisos y propietarios de los archivos y directorios de los archivos y directorios nuevamente con 'ls -l' y 'ls -ld'.

```
$ ls -l /home/usuario1/archivo1.txt
```

```
-rw-r----- 1 usuario1 usuario1 4 ago  4 10:54 /home/usuario1/archivo1.txt
```

```
$ ls -ld /home/usuario1/directorio1/
```

```
drwxr----- 2 usuario1 usuario1 4096 ago  4 11:20 /home/usuario1/directorio1/
```

```
$ su - usuario1
```

```
$ ls -l directorio1/archivo2.txt
```

```
-rwxr--r-- 1 usuario1 grupo1 0 ago  4 11:20 directorio1/archivo2.txt
```

### Reflexión

```
¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo.
```

Porque permite el contro de acceso a los archivos y recursos del sistema. Por seguridad, los usuarios deben tener los privilegios mínimos que les permitan realizar únicamente las tareas y configuraciones necesarias para realizar su trabajo.
