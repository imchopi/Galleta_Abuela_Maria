# Realizado por Jairo y Adrián

# Sistema de Control Automático de Temperatura del Horno para Galletas

Este sistema tiene como objetivo automatizar el control de la temperatura del horno mientras se hornean galletas, basándose en el color de las galletas durante el proceso de cocción. La abuela María, con su vasta experiencia, ha utilizado un conjunto de reglas empíricas para determinar la temperatura adecuada del horno en función del color de las galletas.

El sistema se implementa utilizando el lenguaje de programación **CLIPS** (C Language Integrated Production System), que se utiliza comúnmente para sistemas basados en conocimiento y en la toma de decisiones basada en reglas.

## Descripción General

El sistema utiliza una **base de conocimiento** que incluye:

1. **Conjuntos difusos** sobre el índice cromático de las galletas.
2. **Conjuntos difusos** sobre la temperatura del horno.
3. **Reglas de inferencia** para determinar la temperatura del horno en función del estado de las galletas.

### Hechos de Entrada

El hecho representado es el **índice cromático** de las galletas, que en este caso se encuentra en 6 (medio hecho). Con esta información, el sistema aplicará las reglas de inferencia para calcular la temperatura óptima del horno.

### Reglas

Las reglas que guían el sistema son las siguientes:

- **Regla 1:** Si las galletas están poco crudas, entonces la temperatura debe ser media.
- **Regla 2:** Si las galletas están medio hechas, entonces la temperatura debe ser alta.
- **Regla 3:** Si las galletas están doradas, entonces la temperatura debe ser baja.

### Base de Conocimiento

La base de conocimiento está compuesta por dos partes principales:

#### Conjuntos Difusos para el Índice Cromático de las Galletas
- **Poco crudas:** Entre 4 y 6 (con valores de membresía difusa entre 0 y 1).
- **Medio hechas:** Entre 3 y 8 (con valores de membresía difusa entre 0 y 1).
- **Doraditas:** Entre 5 y 7 (con valores de membresía difusa entre 0 y 1).

#### Conjuntos Difusos para la Temperatura del Horno
- **Baja:** Temperaturas entre 150°C y 190°C.
- **Media:** Temperaturas entre 170°C y 230°C.
- **Alta:** Temperaturas entre 210°C y 250°C.

### Sistema de Reglas en CLIPS

En este sistema, las reglas se implementan de la siguiente forma:

#### Reglas de Inferencia

```sh
(defrule regla_1
  (galleta poco_cruda)
  =>
  (assert (temperatura media))
)

(defrule regla_2
  (galleta medio_hechas)
  =>
  (assert (temperatura alta))
)

(defrule regla_3
  (galleta doraditas)
  =>
  (assert (temperatura baja))
)

(deftemplate galleta
  0 10
  (
    (poco_cruda (4 1) (6 0.5) (7 0))
    (medio_hechas (3 0) (5 1) (6 1) (8 0))
    (doraditas (5 0) (7 1))
  )
)

(deftemplate temperatura
  0 250
  (
    (baja (150 0) (160 1) (180 1) (190 0))
    (media (170 0) (190 1) (210 1) (230 0))
    (alta (210 0) (220 1) (240 1) (250 0))
  )
)
```

### Hechos Iniciales
```sh
(deffacts hechos
  (galleta (6 0) (6 1) (6 0))
)

```

### Proceso de Inferencia
1. Hechos iniciales:
El sistema empieza con un hecho inicial que describe el estado cromático de las galletas, con un índice de color de 6 (lo que indica que están medio hechas).

2. Evaluación de reglas:
* El sistema evalúa las reglas para determinar cuál de ellas se aplica. Dado que el índice cromático de las galletas es 6, la Regla 2 se activa, que indica que las galletas están medio hechas.
* Según la Regla 2, si las galletas están medio hechas, entonces la temperatura debe ser alta.

3.Resultado: El sistema produce un hecho que establece que la temperatura del horno debe ser alta.

### Ejecución del Sistema
El flujo de trabajo es el siguiente:
1. Ingresar el índice cromático de las galletas (en este caso 6).
2. El sistema utiliza las reglas de inferencia para determinar la temperatura del horno.
3. El sistema devuelve el valor de la temperatura adecuada (alta en este caso).

### Uso del Sistema
Para usar el sistema en CLIPS, simplemente debes cargar la base de hechos y las reglas, y ejecutar el motor de inferencia para obtener el resultado. Aquí hay un ejemplo de cómo podrías hacerlo:
```sh
(load "bc_galleta.clp")   ; Cargar el archivo de reglas y hechos
(reset)                   ; Inicializar el sistema con los hechos
(run)                     ; Ejecutar el motor de inferencia
```
Después de ejecutar el sistema, se puede consultar la temperatura recomendada con el comando:

### Imágenes

Como podemos observar, al almacenarse la temperatura en f-4, aunque pongamos 6, el PRNTUTIL1 nos dará como resultado 0.0, debido a que no está guardado en f-6.

![image](https://github.com/user-attachments/assets/050c4d9e-437e-4c45-b008-bd7dc29521ee)

### Conclusión
Este sistema automatizado de control de temperatura es una representación simplificada de cómo las reglas empíricas de la abuela María pueden aplicarse mediante un sistema basado en conocimiento para lograr un horneado perfecto de galletas. El uso de CLIPS y lógica difusa permite que el sistema tome decisiones basadas en las observaciones del color de las galletas, ajustando la temperatura del horno de manera eficiente.
