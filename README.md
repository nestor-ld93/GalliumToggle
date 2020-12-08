# GalliumToggle
Script en Bash que actúa como interruptor para mostrar/ocultar el HUD de Gallium Hud siempre y cuando se emplee la variable `GALLIUM_HUD_TOGGLE_SIGNAL=10` al momento de lanzar las aplicaciones.

Las funciones que realiza **GalliumToggle** son las siguientes:

- Mostrar/ocultar Gallium Hud en todas las aplicaciones en ejecución.
- Mostrar/ocultar Gallium Hud en las aplicaciones deseadas.

## DEPENDENCIAS
- Bash

## REQUISITOS MÍNIMOS
- Drivers Open-Source (Mesa) para GPUs AMD & Nvidia.

## ¿CÓMO DESCARGAR?
- Desde el botón [Code] o ejecute en un terminal:
`git clone https://github.com/nestor-ld93/GalliumToggle`

## ¿CÓMO EJECUTAR? (Para todas las aplicaciones)
1. Ingresar a la carpeta clonada: `cd GalliumToggle`
1. Ingresar al archivo `GalliumToggle.bash` modificar el argumento de la variable `modo` a `"auto"`. (Por defecto, se encuentra en `"auto"`)
1. Establecer permisos de ejecución: `chmod +x GalliumToggle.bash`
1. Ejecutar (no ingresar como superusuario): `./GalliumToggle.bash`

## ¿CÓMO EJECUTAR? (Para las aplicaciones deseadas)
1. Ingresar a la carpeta clonada: `cd GalliumToggle`
1. Ingresar al archivo `GalliumToggle.bash` modificar el argumento de la variable `modo` a `"manual"`
1. Establecer permisos de ejecución: `chmod +x GalliumToggle.bash`
1. Ejecutar (no ingresar como superusuario): `./GalliumToggle.bash`
1. Seleccionar la aplicación en el terminal cuando se solicite.

## ¿CÓMO EJECUTAR? (Aplicaciones lanzadas como superusuario)
1. Ingresar a la carpeta clonada: `cd GalliumToggle`
1. Ingresar al archivo `GalliumToggle.bash` y anteponer al argumento de la variable `comando1` la palabra `sudo `, el resultado es: `sudo grep -i ${variable_toggle} /proc/${PID[i]}/environ`
1. Establecer permisos de ejecución: `chmod +x GalliumToggle.bash`
1. Ejecutar (no ingresar como superusuario): `./GalliumToggle.bash`
1. Ingresar la contraseña del sistema en el terminal cuando se solicite.

## ENLACES DE INTERÉS
- [NotebookGPU](https://notebookgpu.blogspot.com/2018/08/monitorizar-graficos-hibridos-en-linux.html)
