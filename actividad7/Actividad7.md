# Actividad 7

## Completely Fair Scheduler (CFS)

El Completely Fair Scheduler (CFS) es el planificador de procesos utilizado en el núcleo de Linux, diseñado para proporcionar un uso justo de la CPU a todos los procesos en ejecución. A continuación, se describen sus características principales y su funcionamiento:

### Características principales

- Justicia y Equidad: CFS se basa en el principio de que cada proceso debe recibir una parte justa del tiempo de CPU. Utiliza un algoritmo que asegura que cada proceso tenga acceso a la CPU de manera proporcional a su prioridad.

- Uso de un Árbol Rojo-Negro: CFS implementa un árbol rojo-negro, que es una estructura de datos auto-balanceada, para mantener la lista de procesos listos para ejecutarse. Esto permite realizar operaciones de inserción, eliminación y búsqueda de manera eficiente.

- Tiempo de Ejecución Virtual: CFS asigna a cada proceso un valor de "tiempo de ejecución virtual". Este tiempo representa la cantidad de tiempo que el proceso ha estado utilizando la CPU, ajustado por su prioridad. Los procesos con menor tiempo de ejecución virtual son elegidos para ejecutarse primero.

- Prioridades: Aunque CFS intenta ser justo, también permite establecer prioridades para los procesos. Los procesos con mayor prioridad obtienen más tiempo de CPU en comparación con aquellos de menor prioridad.

- Temporalización: CFS no utiliza un "quantum" fijo para el tiempo de CPU. En cambio, ajusta dinámicamente el tiempo de ejecución basado en el comportamiento de los procesos, lo que permite una mayor adaptabilidad.

### Funcionamiento del CFS

- Adición de Procesos: Cuando un proceso se añade a la cola de listos, CFS calcula su tiempo de ejecución virtual y lo inserta en el árbol rojo-negro.

- Selección del Proceso a Ejecutar: Al momento de programar, CFS selecciona el proceso con el menor tiempo de ejecución virtual. Esto asegura que el proceso que ha utilizado menos tiempo de CPU sea el que se ejecute a continuación.

- Re-ordenamiento de Procesos: Si un proceso es interrumpido (por ejemplo, porque se agota su tiempo de CPU o porque se bloquea), su tiempo de ejecución virtual se actualiza y se re-inserta en el árbol, manteniendo la estructura balanceada.

- Manejo de Prioridades: CFS considera la prioridad de los procesos. Los procesos de mayor prioridad tendrán un tiempo de ejecución virtual que se ajusta a favor de su ejecución, permitiendo un balance entre justicia y eficiencia.

- Despertar de Procesos: Cuando un proceso que estaba dormido se despierta (por ejemplo, al completar una operación de entrada/salida), su tiempo de ejecución se actualiza y se reincorpora al árbol rojo-negro.
