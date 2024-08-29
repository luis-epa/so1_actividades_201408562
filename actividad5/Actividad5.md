# Actividad 5

### 1. Tipos de Kernel y sus Diferencias

Un kernel es el núcleo central del sistema operativo que gestiona el hardware y los recursos del sistema. Existen varios tipos de kernels, y se diferencian principalmente en su estructura y en cómo manejan la comunicación entre el software y el hardware. Los principales tipos de kernel son:

- a) Kernel Monolítico

  Descripción: En un kernel monolítico, todo el sistema operativo (gestión de memoria, controladores de dispositivos, sistema de archivos, etc.) se ejecuta en modo núcleo (kernel mode) en un solo espacio de memoria.

  - Ventajas:
    Alto rendimiento debido a la proximidad de los componentes del sistema operativo.
    Menor sobrecarga de contexto.
  - Desventajas:
    Dificultades para la modularidad y mantenimiento del código.
    Si un componente falla, puede afectar todo el sistema.

  Ejemplos: Linux, BSD.

- b) Kernel Microkernel

  Descripción: Un microkernel minimiza las funciones que se ejecutan en modo núcleo. Solo las funciones esenciales como la gestión de procesos y la comunicación entre procesos se realizan en modo núcleo; otras funciones como los controladores de dispositivos y los sistemas de archivos se ejecutan en modo usuario (user mode).

  - Ventajas:
    Mayor estabilidad y seguridad, ya que las fallas en el modo usuario no afectan al núcleo.
    Mejor modularidad y capacidad de mantenimiento.
  - Desventajas:
    Mayor sobrecarga de comunicación entre procesos y contextos.
    Potencialmente menor rendimiento debido a la necesidad de interacciones frecuentes entre el núcleo y los servicios en modo usuario.

  Ejemplos: MINIX, QNX.

- c) Kernel Híbrido

  Descripción: Un kernel híbrido combina elementos de los kernels monolíticos y microkernels. Mantiene algunos servicios esenciales en modo núcleo pero también permite que otros servicios se ejecuten en modo usuario.

  - Ventajas:
    Intenta balancear el rendimiento y la estabilidad.
    Proporciona flexibilidad para optimizar el rendimiento mientras mantiene ciertas garantías de seguridad y estabilidad.
  - Desventajas:
    Puede heredar las desventajas de ambos tipos.

  Ejemplos: Windows NT, macOS.

### 2. User vs. Kernel Modes

Los sistemas operativos modernos utilizan dos modos principales de ejecución: modo usuario (user mode) y modo núcleo (kernel mode). Estos modos se utilizan para proteger el sistema y gestionar cómo se accede al hardware.

- a) Modo Usuario

  Descripción: Es el modo en el que se ejecutan las aplicaciones y procesos no privilegiados. En este modo, los procesos no tienen acceso directo al hardware o a la memoria crítica del sistema operativo.

  - Ventajas:
    Mayor seguridad y estabilidad, ya que un error en una aplicación no puede afectar directamente al sistema operativo.
    Menor riesgo de daños graves al sistema.
  - Desventajas:
    Menor acceso a los recursos del sistema y al hardware.

  Ejemplos: Aplicaciones de usuario como navegadores web, editores de texto.

- b) Modo Núcleo

  Descripción: En el modo núcleo, el sistema operativo tiene acceso completo y sin restricciones al hardware y a toda la memoria del sistema. Es el modo en el que se ejecutan los componentes del kernel y los controladores de hardware.

  - Ventajas:
    Capacidad total para gestionar recursos y hardware.
    Mayor control y flexibilidad sobre el sistema.
  - Desventajas:
    Mayor riesgo de inestabilidad; un error en el núcleo puede afectar a todo el sistema.
    Menor seguridad si el núcleo es comprometido.

  Ejemplos: Gestión de memoria, controladores de dispositivos.

### 3. Interrupciones vs. Traps

Las interrupciones y los traps son mecanismos utilizados por los sistemas operativos para manejar eventos y excepciones.

- a) Interrupciones

  Descripción: Son señales enviadas por el hardware o por el software para indicar que un evento que requiere atención ha ocurrido. Las interrupciones pueden ser generadas por dispositivos periféricos (como teclados o discos duros) o por eventos de software.

  - Tipos:
    - Interrupciones de hardware: Provienen de dispositivos externos que requieren atención (por ejemplo, un temporizador que necesita atención).
    - Interrupciones de software: Generadas por el software para solicitar servicios del sistema operativo (por ejemplo, una llamada al sistema).
  - Proceso: Cuando ocurre una interrupción, el procesador detiene su ejecución actual, guarda el estado actual y ejecuta una rutina de manejo de interrupción para atender el evento.

  Ejemplos: Interrupciones de teclado, interrupciones de red.

- b) Traps

  Descripción: Son eventos excepcionales generados por el software que requieren atención especial del sistema operativo. A menudo se utilizan para manejar errores o situaciones específicas durante la ejecución del programa.

  - Tipos:
    - Traps de software: Eventos provocados por instrucciones de software específicas, como las llamadas al sistema o errores aritméticos (por ejemplo, división por cero).
    - Excepciones: Errores detectados durante la ejecución de una instrucción (por ejemplo, violación de segmentación).
  - Proceso: Similar a las interrupciones, cuando se produce un trap, el sistema operativo detiene la ejecución del programa actual, guarda el estado y maneja el evento (como la gestión de excepciones o la llamada al sistema).
