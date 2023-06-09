#!/bin/bash

# Colores
blanco='\033[1;37m'
verde='\033[0;32m'
amarillo='\033[1;33m'
azul='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
gris='\033[1;30m'
negro='\033[30m'
rojo='\033[31m'
reset='\033[0m'

# Función para mostrar el menú
show_menu() {
  clear
  echo ""
  echo '                          ___  ___             _____ _'
  echo '                          |  \/  |            |_   _| |'
  echo '                          | .  . | __ ___  __   | | | |__   ___ _ __ ___   ___ '
  echo '                          | |\/| |/ _  \ \/ /   | | |  _ \ / _ \  _   _ \ / _ \'
  echo '                          | |  | | (_| |>  <    | | | | | |  __/ | | | | |  __/'
  echo '                          \_|  |_/\__,_/_/\_\   \_/ |_| |_|\___|_| |_| |_|\___|'
  echo '                                             ___           _  '
  echo '                                            |   \ __ _ _ _| |__'
  echo '                                            | |) / _  |  _| / /'
  echo '                                            |___/\__,_|_| |_\_\'
  
  echo ""
  echo "                                       Max Theme Dark para HestiaCP"
  echo "                                                   v2.1"
  echo "                                           www.maxizamorano.com"
  echo "                                      https://github.com/MaxiZamorano"
  echo ""
  echo  "${gris}____________________________________________________________________________________________________${reset}"
  echo ""
  echo  "${blanco}1) Instalar/Reinstalar${reset}"
  echo  "${blanco}2) Desinstalar${reset}"
  echo  "${blanco}3) Salir${reset}"
  echo  "${gris}____________________________________________________________________________________________________${reset}"
  echo ""


}

#función para instalar o reinstalar el tema
instalar(){

        url="https://raw.githubusercontent.com/maxizamorano/maxtheme/main/themes/max-theme-dark/max-theme-dark.css"
        dir_archivo="/usr/local/hestia/web/css/themes/custom/max-theme-dark.css"

        url_2="https://raw.githubusercontent.com/maxizamorano/maxtheme/main/themes/max-theme-dark/max-theme-dark-login.css"
        dir_archivo_2="/usr/local/hestia/web/css/themes/max-theme-dark-login.css"

        # Verifica si la carpeta "/usr/local/hestia/web/css/themes/custom" existe, si no la crea
        if [ ! -d "/usr/local/hestia/web/css/themes/custom" ]; then
                mkdir -p "/usr/local/hestia/web/css/themes/custom"
        fi

        # Descarga el archivo y sobrescribe si ya existe
        curl -s -o "$dir_archivo" -k "$url"
        curl -s -o "$dir_archivo_2" -k "$url_2"

        # Verifica si el archivo .copy-dark.min.css_dark ya existe
        if [ -f /usr/local/hestia/web/css/themes/.copy-dark.min.css_dark ]; then
              rm -rf /usr/local/hestia/web/css/themes/dark.min.css
              cp /usr/local/hestia/web/css/themes/max-theme-dark-login.css /usr/local/hestia/web/css/themes/dark.min.css
              rm -rf /usr/local/hestia/web/css/themes/max-theme-dark-login.css
        else
              cp /usr/local/hestia/web/css/themes/dark.min.css /usr/local/hestia/web/css/themes/.copy-dark.min.css_dark
              rm -rf /usr/local/hestia/web/css/themes/dark.min.css
              cp /usr/local/hestia/web/css/themes/max-theme-dark-login.css /usr/local/hestia/web/css/themes/dark.min.css
              rm -rf /usr/local/hestia/web/css/themes/max-theme-dark-login.css
        fi

        archivo="/usr/local/hestia/web/css/themes/custom/max-theme-dark.css"
        linea="5"
        css_inicio='    background-image: url("'
        css_final='");'

        archivo_2="/usr/local/hestia/web/css/themes/dark.min.css"
        linea_2="594"
        css_inicio_2='    background-image: url("'
        css_final_2='");'

        linea_3="603"
        css_inicio_3='    background-image: url("'
        css_final_3='");'
        css_color_fondo='    background: #10161f;'

        # Pregunta la URL del logo para el dashboard
        echo  "${gris}____________________________________________________________________________________________________${reset}"
        echo ""
        echo "${amarillo}LOGO PARA LA BARRA SUPERIOR DEL DASHBOARD ${reset}"
        echo ""
        echo "${cyan}Se recomienda que tu logo esté en formato ${amarillo}PNG, SVG o Webp${reset}"
        echo "${cyan}Utiliza un formato de URL correcto y en https, por ejemplo: ${amarillo}https://example.com/img/tu-logo.png${reset}"
        echo  "${gris}____________________________________________________________________________________________________${reset}"
        echo ""
        echo -n "${verde}Pega o escribe la URL de tu logo: ${reset}"
        read url_logo

        url=$(echo $url_logo | sed 's/\//\\\//g')

        sed -i "${linea}s/.*/$css_inicio${url}$css_final/" $archivo

        # Pregunta la URL del logo para el login
        echo  "${gris}____________________________________________________________________________________________________${reset}"
        echo ""
        echo "${amarillo}LOGO PARA LA PANTALLA DE LOGIN O INICIO DE SESIÓN ${reset}"
        echo ""
        echo "${cyan}Se recomienda que tu logo esté en formato ${amarillo}PNG, SVG o Webp${reset}"
        echo "${cyan}Utiliza un formato de URL correcto y en https, por ejemplo: ${amarillo}https://example.com/img/tu-logo.png${reset}"
        echo  "${gris}____________________________________________________________________________________________________${reset}"
        echo ""
        echo -n "${verde}Pega o escribe la URL de tu logo: ${reset}"
        read url_logo_login

        url_2=$(echo $url_logo_login | sed 's/\//\\\//g')

        sed -i "${linea_2}s/.*/$css_inicio_2${url_2}$css_final_2/" $archivo_2

        # Pregunta la URL del Fondo
        while true; do
        echo  "${gris}____________________________________________________________________________________________________${reset}"
        echo ""
        echo -n "${verde}¿Quieres agregar una imagen de fondo en el inicio de sesión? [S/N]:${reset} "
        read respuesta

        case "$respuesta" in
          [Ss]* )
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""
            echo "${amarillo}IMAGEN DE FONDO PARA LA PANTALLA DE LOGIN O INICIO DE SESIÓN ${reset}"
            echo ""
            echo "${cyan}Se recomienda que la imagen tenga una resolución de ${amarillo}1920x1080px ${cyan}y esté en formato ${amarillo}PNG, JPG o Webp${reset}"
            echo "${cyan}Utiliza un formato de URL correcto y en https, por ejemplo: ${amarillo}https://example.com/img/tu-fondo.png${reset}"
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""
            echo -n "${verde}Pega o escribe la URL de la imagen de fondo: ${reset}"
            read url_img_fondo

            url_3=$(echo $url_img_fondo | sed 's/\//\\\//g')
            sed -i "${linea_3}s/.*/$css_inicio_3${url_3}$css_final_3/" $archivo_2

            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""
            echo "${verde}                                       ¡TEMA INSTALADO CORRECTAMENTE! ${reset}"
            echo "${cyan}      NOTA: ${amarillo}si no se cambia el tema automáticamente, debes cambiarlo desde el panel de control. ${reset}"
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""

            exit
            ;;
          [Nn]* )
            sed -i "${linea_3}s/.*/$css_color_fondo/" $archivo_2

            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""
            echo "${verde}                                       ¡TEMA INSTALADO CORRECTAMENTE! ${reset}"
            echo "${cyan}      NOTA: ${amarillo}si no se cambia el tema automáticamente, debes cambiarlo desde el panel de control. ${reset}"
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""

            exit
            ;;
          * )
            echo ""
            echo "${rojo}La respuesta es inválida, debes responder con "S/N o s/n".${reset}"
            ;;
        esac
        done
       
}


#función para desinstalar el tema
desinstalar(){
       # Pregunta si quiere desinstalar el tema
        while true; do
        echo  "${gris}____________________________________________________________________________________________________${reset}"
        echo ""
        echo "${cyan}NOTA:${reset} Si lo desinstalas restauraremos los archivos originales y se activará el tema por defecto de HestiaCP."
        echo ""
        echo -n "${verde}¿Quieres desinstalar el tema Max Theme Dark? [S/N]:${reset} "
        read respuesta

        case "$respuesta" in
          [Ss]* )

          # Verifica si está instalado el tema actualmente
          if [ -f /usr/local/hestia/web/css/themes/.copy-dark.min.css_dark ]; then
            # Elimina los archivos y restaura el original
            rm -rf /usr/local/hestia/web/css/themes/dark.min.css
            cp /usr/local/hestia/web/css/themes/.copy-dark.min.css_dark /usr/local/hestia/web/css/themes/dark.min.css
            rm /usr/local/hestia/web/css/themes/.copy-dark.min.css_dark
            rm -rf /usr/local/hestia/web/css/themes/custom/max-theme-dark.css

            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""
            echo "${verde}                                     ¡TEMA DESINSTALADO CORRECTAMENTE! ${reset}"
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""

            exit
          else
            echo ""
            echo "${rojo}¡No tienes el tema instalado! Solo podemos desinstalarlo si el tema fue instalado anteriormente.${reset}" 
            echo ""
            exit
          fi
            

            ;;
          [Nn]* )
            # No desinstala el tema
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""
            echo "${verde}                                      ¡GENIAL! CONTINÚAS CON TU TEMA ${reset}"
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""

            exit
            ;;
          * )
            echo ""
            echo "${rojo}La respuesta es inválida, debes responder con "S/N o s/n".${reset}"
            ;;
        esac
        done

}


# Loop o bucle para respuesta del usuario
while true; do
  # Mostrar el menú
  show_menu

  # Leer la opción seleccionada por el usuario
  echo -n "${verde}Selecciona una opción [1-3]: ${reset}"
  read opcion

  # Evaluar la opción seleccionada
  case $opcion in
    1)
      instalar
      ;;
    2)
      desinstalar
      ;;
    3)
      exit
      ;;
    *)
      echo "${rojo}Opción inválida. Intente de nuevo.${reset}"
      sleep 3
      ;;
  esac
done
