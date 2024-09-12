# Actividad No. 6

1. ¿Incluyendo el proceso inicial, cuantos procesos son creados por el siguiente programa? Razone su respuesta.

```
#include <stdio.h>
#include <unistd.h>

int main() {
    /* fork a child  process */
    fork();

    /* fork another child process */
    fork();

    /* and another fork */
    fork();

    return 0;
}
```

- Al inicio exise solo un proceso.
- En el primer fork se crea un proceso más, entonces, hay 2 procesos.
- En el segundo fork se crea un proceso más por cada proceso existente, 2 + 2 = 4 procesos.
- En el tercer fork se crean nuevamente un proceso por cada proceso existente, por lo que quedan 4 + 4 = 8 procesos.

Al finalizar el tercer fork existen 8 procesos.

2. Utilizando un sistema Linux, escriba un programa en C que cree un proceso hijo (fork)
   que finalmente se convierta en un proceso zombie. Este proceso zombie debe
   permanecer en el sistema durante al menos 60 segundos.
   Los estados del proceso se pueden obtener del comando: ps -l.

```
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>

int main() {
    pid_t pid;

    // Crear un proceso hijo
    pid = fork();

    if (pid < 0) {
        // Se produjo un error al crear el proceso
        perror("fork");
        exit(EXIT_FAILURE);
    }

    if (pid == 0) {
        // Imprimir el código del proceso hijo
        printf("Proceso hijo (PID: %d) en ejecución...\n", getpid());
        // Terminar el proceso hijo
        exit(EXIT_SUCCESS);
    } else {
        // Imprimir el código del proceso padre
        printf("Proceso padre (PID: %d) esperando para que el hijo se convierta en zombie...\n", getpid());

        // Esperar 60 segundos
        sleep(60);

        // Mostrar el estado de los procesos
        printf("Después de 60 segundos:\n");
        system("ps -l");

        // Limpiar procesos huérfanos
        wait(NULL);

        printf("Proceso padre (PID: %d) terminado.\n", getpid());
    }

    return 0;
}

```

3. Usando el siguiente código como referencia, completar el programa para que sea ejecutable y responder las siguientes preguntas:

- ¿Cuántos procesos únicos son creados?
- ¿Cuántos hilos únicos son creados?

```
pid_t pid;

pid = fork();
if (pid == 0) { /* child process */
    fork();
    thread_create(...);
}
fork();
```

```
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <sys/types.h>
#include <sys/wait.h>

void* thread_function(void* arg) {
    printf("Hilo creado (PID: %d, TID: %lu)\n", getpid(), pthread_self());
    return NULL;
}

int main() {
    pid_t pid;
    pthread_t thread;

    pid = fork();

    if (pid < 0) {
        perror("fork");
        exit(EXIT_FAILURE);
    }

    if (pid == 0) { /* Proceso hijo */
        fork();

        // Crear un hilo en el proceso hijo
        if (pthread_create(&thread, NULL, thread_function, NULL) != 0) {
            perror("pthread_create");
            exit(EXIT_FAILURE);
        }

        // Esperar a que el hilo termine
        pthread_join(thread, NULL);
    }

    fork();

    while (wait(NULL) > 0);

    return 0;
}

```

- En total, se crean 4 procesos.
- Se crear un hilo.
