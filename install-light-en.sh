#!/bin/bash

# Colors
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

# Function to display the menu
show_menu() {
  clear
  echo ""
  echo '                          ___  ___             _____ _'
  echo '                          |  \/  |            |_   _| |'
  echo '                          | .  . | __ ___  __   | | | |__   ___ _ __ ___   ___ '
  echo '                          | |\/| |/ _  \ \/ /   | | |  _ \ / _ \  _   _ \ / _ \'
  echo '                          | |  | | (_| |>  <    | | | | | |  __/ | | | | |  __/'
  echo '                          \_|  |_/\__,_/_/\_\   \_/ |_| |_|\___|_| |_| |_|\___|'  
  echo "                                             _    _      _   _"   
  echo "                                            | |  (_)__ _| |_| |_" 
  echo "                                            | |__| / _' | ' \  _|"
  echo "                                            |____|_\__, |_||_\__|"
  echo "                                                   |___/"         
  
  echo ""
  echo "                                       Max Theme Light para HestiaCP"
  echo "                                                   v2.1"
  echo "                                           www.maxizamorano.com"
  echo "                                      https://github.com/MaxiZamorano"
  echo ""
  echo  "${gris}____________________________________________________________________________________________________${reset}"
  echo ""
  echo  "${blanco}1) Install/Reinstall${reset}"
  echo  "${blanco}2) Uninstall${reset}"
  echo  "${blanco}3) Exit${reset}"
  echo  "${gris}____________________________________________________________________________________________________${reset}"
  echo ""


}

#function to install or reinstall the theme
instalar(){

        url="https://raw.githubusercontent.com/maxizamorano/maxtheme/main/themes/max-theme-light/max-theme-light.css"
        dir_archivo="/usr/local/hestia/web/css/themes/custom/max-theme-light.css"

        url_2="https://raw.githubusercontent.com/maxizamorano/maxtheme/main/themes/max-theme-light/max-theme-light-login.css"
        dir_archivo_2="/usr/local/hestia/web/css/themes/max-theme-light-login.css"

        # Check if the folder "/usr/local/hestia/web/css/themes/custom" exists, if not create it
        if [ ! -d "/usr/local/hestia/web/css/themes/custom" ]; then
                mkdir -p "/usr/local/hestia/web/css/themes/custom"
        fi

        # Downloads the file and overwrites it if it already exists
        curl -s -o "$dir_archivo" -k "$url"
        curl -s -o "$dir_archivo_2" -k "$url_2"

        # Check if the .copy-dark.min.css_dark file already exists
        if [ -f /usr/local/hestia/web/css/themes/.copy-dark.min.css_light ]; then
              rm -rf /usr/local/hestia/web/css/themes/dark.min.css
              cp /usr/local/hestia/web/css/themes/max-theme-light-login.css /usr/local/hestia/web/css/themes/dark.min.css
              rm -rf /usr/local/hestia/web/css/themes/max-theme-light-login.css
        else
              cp /usr/local/hestia/web/css/themes/dark.min.css /usr/local/hestia/web/css/themes/.copy-dark.min.css_light
              rm -rf /usr/local/hestia/web/css/themes/dark.min.css
              cp /usr/local/hestia/web/css/themes/max-theme-light-login.css /usr/local/hestia/web/css/themes/dark.min.css
              rm -rf /usr/local/hestia/web/css/themes/max-theme-light-login.css
        fi

        archivo="/usr/local/hestia/web/css/themes/custom/max-theme-light.css"
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
        css_color_fondo='    background: #f6f6f6;'

        # Asks the URL of the logo for the dashboard
        echo  "${gris}____________________________________________________________________________________________________${reset}"
        echo ""
        echo "${amarillo}LOGO FOR THE TOP BAR OF THE DASHBOARD ${reset}"
        echo ""
        echo "${cyan}We recommend that your logo be in a ${amarillo}PNG, SVG or Webp ${cyan}format.${reset}"
        echo "${cyan}Use a correct URL format and in https, for example: ${amarillo}https://example.com/img/your-logo.png${reset}"
        echo  "${gris}____________________________________________________________________________________________________${reset}"
        echo ""
        echo -n "${verde}Paste or type the URL of your logo: ${reset}"
        read url_logo

        url=$(echo $url_logo | sed 's/\//\\\//g')

        sed -i "${linea}s/.*/$css_inicio${url}$css_final/" $archivo

        # Asks the URL of the logo for the login
        echo  "${gris}____________________________________________________________________________________________________${reset}"
        echo ""
        echo "${amarillo}LOGO FOR THE LOGIN SCREEN ${reset}"
        echo ""
        echo "${cyan}We recommend that your logo be in a ${amarillo}PNG, SVG or Webp ${cyan}format.${reset}"
        echo "${cyan}Use a correct URL format and in https, for example: ${amarillo}https://example.com/img/your-logo.png${reset}"
        echo  "${gris}____________________________________________________________________________________________________${reset}"
        echo ""
        echo -n "${verde}Paste or type the URL of your logo: ${reset}"
        read url_logo_login

        url_2=$(echo $url_logo_login | sed 's/\//\\\//g')

        sed -i "${linea_2}s/.*/$css_inicio_2${url_2}$css_final_2/" $archivo_2

        # Ask the background URL
        while true; do
        echo  "${gris}____________________________________________________________________________________________________${reset}"
        echo ""
        echo -n "${verde}Do you want to add a background image at login? [Y/N]:${reset} "
        read respuesta

        case "$respuesta" in
          [Yy]* )
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""
            echo "${amarillo}BACKGROUND IMAGE FOR THE LOGIN SCREEN ${reset}"
            echo ""
            echo "${cyan}We recommend that the image have a resolution of ${amarillo}1920x1080px ${cyan}and be in ${amarillo}PNG, JPG or Webp ${cyan}format${reset}"
            echo "${cyan}Use a correct URL format and in https, for example: ${amarillo}https://example.com/img/your-background.png${reset}"
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""
            echo -n "${verde}Paste or type the URL of the background image: ${reset}"
            read url_img_fondo

            url_3=$(echo $url_img_fondo | sed 's/\//\\\//g')
            sed -i "${linea_3}s/.*/$css_inicio_3${url_3}$css_final_3/" $archivo_2

            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""
            echo "${verde}                                       THEME INSTALLED SUCCESSFULLY! ${reset}"
            echo "${cyan}      NOTE: ${amarillo}If the theme is not changed automatically, you must change it from the control panel. ${reset}"
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""

            exit
            ;;
          [Nn]* )
            sed -i "${linea_3}s/.*/$css_color_fondo/" $archivo_2

            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""
            echo "${verde}                                       THEME INSTALLED SUCCESSFULLY! ${reset}"
            echo "${cyan}      NOTE: ${amarillo}If the theme is not changed automatically, you must change it from the control panel. ${reset}"
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""

            exit
            ;;
          * )
            echo ""
            echo "${rojo}The answer is invalid, you must answer with "Y/N or y/n".${reset}"
            ;;
        esac
        done
       
}


#function to uninstall the theme
desinstalar(){
       # It asks if you want to uninstall the theme
        while true; do
        echo  "${gris}____________________________________________________________________________________________________${reset}"
        echo ""
        echo "${cyan}NOTE:${reset} If you uninstall it we will restore the original files and the default HestiaCP theme will be activated."
        echo ""
        echo -n "${verde}Do you want to uninstall Max Theme Dark theme? [Y/N]:${reset} "
        read respuesta

        case "$respuesta" in
          [Yy]* )

          # Check if the theme is currently installed
          if [ -f /usr/local/hestia/web/css/themes/.copy-dark.min.css_light ]; then
            # Delete the files and restore the original
            rm -rf /usr/local/hestia/web/css/themes/dark.min.css
            cp /usr/local/hestia/web/css/themes/.copy-dark.min.css_light /usr/local/hestia/web/css/themes/dark.min.css
            rm /usr/local/hestia/web/css/themes/.copy-dark.min.css_light
            rm -rf /usr/local/hestia/web/css/themes/custom/max-theme-light.css

            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""
            echo "${verde}                                     THEME UNINSTALLED SUCCESSFULLY! ${reset}"
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""

            exit
          else
            echo ""
            echo "${rojo}You don't have the theme installed! We can only uninstall it if the theme was previously installed.${reset}" 
            echo ""
            exit
          fi
            

            ;;
          [Nn]* )
            # Doesn't uninstall the theme
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""
            echo "${verde}                                      GREAT! CONTINUE WITH YOUR THEME ${reset}"
            echo  "${gris}____________________________________________________________________________________________________${reset}"
            echo ""

            exit
            ;;
          * )
            echo ""
            echo "${rojo}The answer is invalid, you must answer with "Y/N or y/n".${reset}"
            ;;
        esac
        done

}


# Loop for user response
while true; do
  # show menu
  show_menu

  # Read the option selected by the user
  echo -n "${verde}Select an option [1-3]: ${reset}"
  read opcion

  # Evaluate the selected option
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
      echo "${rojo}Invalid option. Try again.${reset}"
      sleep 3
      ;;
  esac
done
