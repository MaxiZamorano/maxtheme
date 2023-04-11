#!/bin/bash

# Colores para el menú
blanco='\033[1;37m'
verde='\033[0;32m'
amarillo='\033[1;33m'
azul='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
reset='\033[0m'

# Función para mostrar el menú
show_menu() {
  clear
  echo  "${blanco}=====================================${reset}"
  echo  "${verde}            MENÚ PRINCIPAL${reset}"
  echo  "${blanco}=====================================${reset}"
  echo  "${azul}1) Instalar${reset}"
  echo  "${amarillo}2) Actualizar${reset}"
  echo  "${magenta}3) Desinstalar${reset}"
  echo  "${cyan}4) Salir${reset}"
  echo  "${blanco}=====================================${reset}"
}

instalar(){

        url="https://raw.githubusercontent.com/maxizamorano/max-theme-light/main/max-theme-light.css"
        output_file="/root/custom/max-theme-light.css"

        # Verifica si la carpeta "/root/custom" existe, si no la crea
        if [ ! -d "/root/custom" ]; then
                mkdir -p "/root/custom"
        fi

        # Descarga el archivo y sobrescribe si ya existe
        curl -s -o "$output_file" -k "$url"

        archivo="/root/custom/max-theme-light.css"
        linea="5"
        css_inicio='    background-image: url("'
        css_final='");'


        echo "${blanco}=====================================${reset}"
        echo "${cyan}Se recomienda que tu logo esté en formato ${amarillo}PNG, SVG o Webp${reset}"
        echo "${cyan}Utiliza un formato de URL correcto y en https, por ejmplo: ${amarillo}https://example.com/img/mi-logo.png${reset}"
        echo "${blanco}=====================================${reset}"
        echo -n "${verde}Pega o escribe la URL de tu logo: ${reset}"
        read texto

        url=$(echo $texto | sed 's/\//\\\//g')

        sed -i "${linea}s/.*/$css_inicio${url}$css_final/" $archivo


        echo  "${blanco}=====================================${reset}"
        echo  "${cyan}   ¡TEMA INSTALADO CORRECTAMENTE!${reset}"
        echo  "${blanco}=====================================${reset}"

        exit;
}


# Loop principal del script
while true; do
  # Mostrar el menú
  show_menu

  # Leer la opción seleccionada por el usuario
  echo -n "${verde}Seleccione una opción [1-4]: ${reset}"
  read opcion

  # Evaluar la opción seleccionada
  case $opcion in
    1)
      instalar
      ;;
    2)
      echo "Ha seleccionado la Opción 2"
      ;;
    3)
      echo "Ha seleccionado la Opción 3"
      ;;
    4)
      exit
      ;;
    *)
      echo "${cyan}Opción inválida. Intente de nuevo.${reset}"
      sleep 3
      ;;
  esac
  read -n 1 -s -r -p "Presione cualquier tecla para continuar..."
done
