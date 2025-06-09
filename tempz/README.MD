
# Tempz

Herramienta de temporizador hecho en python para gestionar el tiempo de estudio


Para crear un cronómetro en Python que pueda pausarse y reanudarse, no necesitas librerías externas, ya que Python incluye herramientas suficientes en su biblioteca estándar. Sin embargo, aquí hay una recomendación de librerías y conceptos útiles:

### Librerías a utilizar
1. **`time`**:
   - La función `time.time()` devuelve el tiempo actual en segundos desde la época (epoch).
   - Es útil para calcular diferencias de tiempo entre eventos, como iniciar y pausar un cronómetro.

2. **`threading`** (opcional):
   - Si deseas que el cronómetro funcione en paralelo con otras tareas del programa, puedes usar hilos (`threads`).
   - Esto es útil si planeas crear una interfaz gráfica (GUI) o realizar tareas adicionales mientras el cronómetro está en marcha.

3. **`signal`** (opcional):
   - Si deseas implementar una interrupción o manejar señales (como un atajo de teclado para pausar/reanudar), podrías usar la librería `signal`.

4. **`keyboard`** (opcional, requiere instalación externa):
   - Si quieres capturar eventos del teclado para pausar/reanudar el cronómetro sin una interfaz gráfica, puedes usar esta librería. Ejemplo: detectar la barra espaciadora para pausar/reanudar.

---

### Recomendaciones y conceptos clave

1. **Uso de un estado para manejar la pausa y reanudación**:
   - Mantén una variable de estado (como `running = True` o `paused = False`) para controlar si el cronómetro está activo o pausado.

2. **Cálculo del tiempo acumulado**:
   - Guarda el momento en que el cronómetro inicia (`start_time`) y suma las diferencias solo cuando esté corriendo.
   - Cuando se pausa, calcula el tiempo transcurrido y almacénalo en una variable acumuladora (`elapsed_time`).

3. **Bucles para actualizar en tiempo real**:
   - Usa un bucle para actualizar el tiempo transcurrido si planeas imprimirlo en la consola o mostrarlo en una GUI.

4. **Interfaz gráfica (opcional)**:
   - Si quieres una interfaz, puedes usar librerías como `tkinter` o `PyQt` para crear botones (Iniciar, Pausar, Reanudar).

5. **Multihilos para separación de tareas**:
   - Si planeas realizar tareas simultáneas (como una GUI o manejo de eventos), usa la librería `threading` para mantener el cronómetro en un hilo separado.

---

### Ejemplo de flujo lógico para el cronómetro

1. **Inicio**:
   - Pulsa un botón o una tecla para iniciar el cronómetro.
   - Guarda el tiempo actual (`start_time`) con `time.time()`.

2. **Pausa**:
   - Pulsa una tecla o botón para pausar.
   - Calcula el tiempo transcurrido y acumúlalo en `elapsed_time`. Cambia el estado a "pausado".

3. **Reanudar**:
   - Cambia el estado a "en marcha" y guarda un nuevo `start_time` para continuar sumando el tiempo.

4. **Finalización**:
   - Detén el cronómetro y muestra el tiempo total acumulado.

---

### Resumen

- **Librerías básicas**: `time` (obligatoria), `threading` (si necesitas hilos), `keyboard` (si manejas eventos de teclado).
- **Opcionales para GUI**: `tkinter`, `PyQt`, o `Kivy`.
- Usa una variable de estado (`paused`) para gestionar las transiciones entre pausado y corriendo.
- Calcula el tiempo acumulado usando la diferencia entre `time.time()` y `start_time`.

