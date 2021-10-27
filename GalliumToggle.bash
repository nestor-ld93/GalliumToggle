#!/bin/bash
#==================================================================================
#   +==========================================================================+  #
#   |                         GalliumToggle v1.0.1                             |  #
#   +==========================================================================+  #
#   | -Ultima actualizacion: 17/10/2021                                        |  #
#   +--------------------------------------------------------------------------+  #
#   | -Copyright (C) 2020 NestorBase11 (nestor-ld93)                           |  #
#   +--------------------------------------------------------------------------+  #
#==================================================================================

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

#=========================================================================

modo="auto" #"auto" o "manual"
variable_toggle="GALLIUM_HUD_TOGGLE_SIGNAL=10" #SIGUSR1
comando_PID="ps -eo pid"
PID=($($comando_PID))
N=${#PID[@]}

i=122
Nf=0
while [ $i -lt ${N-1} ]; do
    comando1="grep -i ${variable_toggle} /proc/${PID[i]}/environ"
    salida_comando=$(${comando1} 2>&1)
    
    if [[ $salida_comando == */proc/${PID[i]}/environ*matches ]]; then
        #comando2="ps -p ${PID[i]} -o comm="
        proceso=($(ps -p ${PID[i]} -o comm=))
        
        if [[ $proceso != *wine* && $proceso != *services.exe* && \
              $proceso != *plugplay.exe* && $proceso != *explorer.exe* ]]; then
            proceso_f[$Nf]=${proceso[0]}
            PID_f[$Nf]=${PID[i]}
            
            if [[ $modo == "auto" ]]; then
                echo "($i) - HUD detectado en: $1 - ${PID[i]}"
                kill -n 10 ${PID[$i]}
            fi
            ((Nf++))
        fi
    fi
    ((i++))
done
#clear

if [[ $modo == "auto" ]]; then
    printf "=====================================================\n"
    echo "-> HUD activado/desactivado en [$Nf] procesos:"
    printf "    N   PID - Proceso\n"
    i=0
    while [ $i -lt $Nf ]; do
        printf "   [$i] ${PID_f[$i]} - ${proceso_f[$i]}\n"
        ((i++))
    done
    printf "=====================================================\n"
fi

if [[ $modo == "manual" ]]; then
    printf "=====================================================\n"
    echo "-> HUD detectado en [$Nf] procesos:"
    printf "    N   PID - Proceso\n"
    i=0
    while [ $i -lt $Nf ]; do
        printf "   [$i] ${PID_f[$i]} - ${proceso_f[$i]}\n"
        ((i++))
    done
    printf "=====================================================\n"
    
    echo "-> Activar/Desactivar HUD en el proceso:"
    read entrada
    if [[ $entrada -ge 0 && $entrada -lt $Nf ]]; then
        printf "[$entrada] ${PID_f[$entrada]} - ${proceso_f[$entrada]}\n"
        kill -n 10 ${PID_f[$entrada]}
    else
        echo "¡Entrada errónea!"
        exit
    fi
fi
