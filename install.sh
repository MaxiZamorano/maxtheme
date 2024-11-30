#!/bin/bash

space='   '              # Space
reset="\e[0m"            # Color reset

# Background color
bg_blue="\e[48;5;21m"    # Blue
bg_rose="\e[48;5;197m"   # Rose
bg_pink="\e[48;5;205m"   # Pink
bg_purple="\e[48;5;93m"  # Purple
bg_indigo="\e[48;5;54m"  # Indigo
bg_sky="\e[48;5;117m"    # Sky
bg_cyan="\e[48;5;51m"    # Cyan
bg_teal="\e[48;5;37m"    # Teal
bg_green="\e[48;5;40m"   # Green
bg_orange="\e[48;5;214m" # Orange
bg_red="\e[48;5;196m"    # Red
bg_stone="\e[48;5;244m"  # Stone
bg_zinc="\e[48;5;245m"   # Zinc
bg_gray="\e[48;5;240m"   # Gray

# Text color
txt_blue="\e[38;5;21m"    # Blue
txt_rose="\e[38;5;197m"   # Rose
txt_pink="\e[38;5;205m"   # Pink
txt_purple="\e[38;5;93m"  # Purple
txt_indigo="\e[38;5;54m"  # Indigo
txt_sky="\e[38;5;117m"    # Sky
txt_cyan="\e[38;5;51m"    # Cian
txt_teal="\e[38;5;37m"    # Teal
txt_green="\e[38;5;40m"   # Green
txt_orange="\e[38;5;214m" # Orange
txt_red="\e[38;5;196m"    # Red
txt_stone="\e[38;5;244m"  # Stone
txt_zinc="\e[38;5;245m"   # Zinc
txt_gray="\e[38;5;240m"   # Gray

# Text definition for English and Spanish
# Definición de textos para inglés y español
declare -A txt
txt["en_select_language"]="Select your language"
txt["es_select_language"]="Selecciona tu idioma"
txt["en_main_menu"]="Main Menu"
txt["es_main_menu"]="Menú Principal"
txt["en_option_install"]="Install/Reinstall/Update"
txt["es_option_install"]="Instalar/Reinstalar/Actualizar"
txt["en_option_uninstall"]="Uninstall"
txt["es_option_uninstall"]="Desinstalar"
txt["en_option_exit"]="Exit"
txt["es_option_exit"]="Salir"
txt["en_invalid_option"]="Invalid option. Try again."
txt["es_invalid_option"]="Opción inválida. Intente de nuevo."
txt["en_select_option"]="Select an option"
txt["es_select_option"]="Selecciona una opción"
txt["en_color_palette"]="Color palette for"
txt["es_color_palette"]="Paleta de colores para"
txt["en_color_table"]="Check the exact color table at:"
txt["es_color_table"]="Revisa la tabla de colores exacta en:"
txt["en_select_theme"]="Select a theme"
txt["es_select_theme"]="Selecciona un tema"
txt["en_select_theme_dl"]="Select the theme style to install:"
txt["es_select_theme_dl"]="Selecciona el estilo de tema para instalar:"
txt["en_installing_theme"]="Installing MaxTheme"
txt["es_installing_theme"]="Instalando MaxTheme"
txt["en_uninstalling_theme"]="Uninstalling MaxTheme"
txt["es_uninstalling_theme"]="Desinstalando MaxTheme"
txt["en_theme_installed"]="THEME SUCCESSFULLY INSTALLED!"
txt["es_theme_installed"]="¡TEMA INSTALADO CORRECTAMENTE!"
txt["en_theme_installed_2"]="You must change the theme manually from HestiaCP settings."
txt["es_theme_installed_2"]="Debes cambiar el tema de forma manual desde los ajustes de HestiaCP."
txt["en_theme_uninstalled"]="THEME SUCCESSFULLY UNINSTALLED!"
txt["es_theme_uninstalled"]="¡TEMA DESINSTALADO CORRECTAMENTE!"
txt["en_no_uninstall"]="is not installed on your system."
txt["es_no_uninstall"]="no se encuentra instalado en tu sistema."
txt["en_all_themes_uninstalled"]="ALL MAXTHEME THEMES HAVE BEEN SUCCESSFULLY UNINSTALLED!"
txt["es_all_themes_uninstalled"]="¡TODOS LOS TEMAS MAXTHEME SE HAN DESINSTALADO CORRECTAMENTE!"
txt["en_uninstall_title"]="Do you want to completely uninstall MaxTheme or just some themes?"
txt["es_uninstall_title"]="¿Quieres desinstalar completamente MaxTheme o solo algunos temas?"
txt["en_uninstall_opt1"]="All (complete uninstall)"
txt["es_uninstall_opt1"]="Todos (desinstalación completa)"
txt["en_uninstall_opt2"]="Some (only some themes you select)"
txt["es_uninstall_opt2"]="Algunos (solo algunos temas que selecciones)"
txt["en_uninstall_confirm"]="Are you sure you want to uninstall all MaxTheme themes? (y/n):"
txt["es_uninstall_confirm"]="¿Estás seguro de desinstalar todos los temas de MaxTheme? (s/n):"
txt["en_no_theme_deleted"]="No theme was deleted."
txt["es_no_theme_deleted"]="No se eliminó ningún tema."
txt["en_select_themes_uninstalled_title"]="Select the theme style to uninstall:"
txt["es_select_themes_uninstalled_title"]="Selecciona el estilo de tema para desinstalar:"

# Function to translate texts according to the language
# Función para traducir los textos según el idioma
t() {
    local key=$1
    echo "${txt[${LANGUAGE}_${key}]}"
}

# Function to display the motd
# Función para mostrar el motd
show_menu_motd() {
  clear
  echo ""
  echo '                            __  __              _____ _                         '
  echo '                           |  \/  | __ ___  __ |_   _| |__   ___ _ __ ___   ___ '
  echo "                           | |\\/| |/ _\` \\ \\/ /   | | | '_ \\ / _ \\ '_ \` _ \\ / _ \\"
  echo '                           | |  | | (_| |>  <    | | | | | |  __/ | | | | |  __/'
  echo '                           |_|  |_|\__,_/_/\_\   |_| |_| |_|\___|_| |_| |_|\___|'                                             
  echo ""
  echo "                                           MaxTheme for HestiaCP"
  echo "                                                   v3.0"
  echo "                                           www.maxizamorano.com"
  echo "                                https://github.com/MaxiZamorano/maxtheme/"
  echo ""
  echo "____________________________________________________________________________________________________"
  echo ""
}

# Function to select the language
# Función para seleccionar el idioma
select_language() {
    clear
    show_menu_motd
    echo "${txt["en_select_language"]} / ${txt["es_select_language"]}:"
    echo ""
    echo "1) English"
    echo "2) Español"
    echo ""
    echo -e -n "${txt_green}${txt["en_select_option"]} / ${txt["es_select_option"]} [1-2]: ${reset}"
    read select_language

    case $select_language in
        1)
            LANGUAGE="en"
            ;;
        2)
            LANGUAGE="es"
            ;;
        *)
            echo "${txt["en_invalid_option"]} / ${txt["es_invalid_option"]}:"
            sleep 1
            select_language
            ;;
    esac
    main_menu
}

# Function to display the main menu
# Función para mostrar el menú principal
main_menu() {
    clear
    show_menu_motd
    echo "$(t "main_menu")"
    echo ""
    echo "1) $(t "option_install")"
    echo "2) $(t "option_uninstall")"
    echo "3) $(t "option_exit")"
    echo ""
    echo -e -n "${txt_green}$(t "select_option") [1-3]: ${reset}"
    read option_menu

    case $option_menu in
        1)
            install_reinstall_update
            ;;
        2)
            uninstall
            ;;
        3)
            echo ""
            exit
            ;;
        *)
            echo "$(t "invalid_option")"
            sleep 1
            main_menu
            ;;
    esac
}

# Function to install/reinstall or update the theme
# Función para instalar/reinstalar o actualizar el tema
install_reinstall_update() {
    clear
    show_menu_motd
    echo "$(t "select_theme_dl")"
    echo ""
    echo "1) Dark"
    echo "2) Light"
    echo ""
    echo -e -n "${txt_green}$(t "select_option") [1-2]: ${reset}"
    read type_theme

    case $type_theme in
        1)
            list_themes "dark" "install"
            ;;
        2)
            list_themes "light" "install"
            ;;
        *)
            echo "$(t "invalid_option")"
            sleep 1
            install_reinstall_update
            ;;
    esac
}

# Function to define the names and colors of the Dark and Light themes
# Función para definir los nombres y colores de los temas Dark y Light
list_themes() {
    style=$1
    action=$2

    if [ "$style" == "dark" ]; then
        theme_names=(Blue Rose Pink Purple Indigo Sky Cyan Teal Green Orange Red Stone Zinc Gray)
        theme_colors=(
            "${bg_blue}${space}${reset}"
            "${bg_rose}${space}${reset}"
            "${bg_pink}${space}${reset}"
            "${bg_purple}${space}${reset}"
            "${bg_indigo}${space}${reset}"
            "${bg_sky}${space}${reset}"
            "${bg_cyan}${space}${reset}"
            "${bg_teal}${space}${reset}"
            "${bg_green}${space}${reset}"
            "${bg_orange}${space}${reset}"
            "${bg_red}${space}${reset}"
            "${bg_stone}${space}${reset}"
            "${bg_zinc}${space}${reset}"
            "${bg_gray}${space}${reset}"
        )
    elif [ "$style" == "light" ]; then
        theme_names=(Blue Rose Pink Purple Indigo Sky Cyan Teal Green Orange Red Stone Zinc Gray)
        theme_colors=(
            "${bg_blue}${space}${reset}"
            "${bg_rose}${space}${reset}"
            "${bg_pink}${space}${reset}"
            "${bg_purple}${space}${reset}"
            "${bg_indigo}${space}${reset}"
            "${bg_sky}${space}${reset}"
            "${bg_cyan}${space}${reset}"
            "${bg_teal}${space}${reset}"
            "${bg_green}${space}${reset}"
            "${bg_orange}${space}${reset}"
            "${bg_red}${space}${reset}"
            "${bg_stone}${space}${reset}"
            "${bg_zinc}${space}${reset}"
            "${bg_gray}${space}${reset}"
        )
    fi

    clear
    show_menu_motd
    echo -e "$(t "color_palette") $(echo ${style^}):"
    echo ""

    # Show list of themes with colors
    # Muestra la lista de temas con colores
    for i in "${!theme_names[@]}"; do
        echo -e "${theme_colors[i]} $((i + 1))) ${theme_names[i]}"
    done

    echo ""
    echo -e "$(t "color_table") https://github.com/MaxiZamorano/maxtheme/"
    echo ""
    echo -e -n "${txt_green}$(t "select_theme") [1-${#theme_names[@]}]: ${reset}"
    read theme_index

    if [[ $theme_index -ge 1 && $theme_index -le ${#theme_names[@]} ]]; then
        selected_theme="${theme_names[$((theme_index - 1))]}"
        if [ "$action" == "install" ]; then
            echo ""
            echo -e "$(t "installing_theme") $(echo ${style^}) $selected_theme..."
            install_theme "$style" "$selected_theme"
        elif [ "$action" == "uninstall" ]; then
            echo ""
            echo -e "$(t "uninstalling_theme") $(echo ${style^}) $selected_theme..."
            uninstall_theme "$style" "$selected_theme"
        fi
    else
        echo "$(t "invalid_option")"
        sleep 1
        list_themes "$style" "$action"
    fi
}

# Function to install a theme
# Función para instalar un tema
install_theme() {
    style=$1
    theme_color=$2
    theme_dir="/usr/local/hestia/web/css/themes/custom"
    js_dir="/usr/local/hestia/web/js/custom_scripts"
    
    # Create the directory if it does not exist
    # Crear el directorio si no existe
    mkdir -p "$theme_dir"

    # Download the corresponding CSS file
    # Descargar el archivo CSS correspondiente
    css_file="maxtheme-${style,,}-${theme_color,,}.min.css"
    css_url="https://raw.githubusercontent.com/maxizamorano/maxtheme/main/themes/css/${style,,}/$css_file"
    curl -s -o "$theme_dir/$css_file" "$css_url"

    # Download the JS file
    # Descargar el archivo JS
    js_url="https://raw.githubusercontent.com/maxizamorano/maxtheme/main/themes/js/maxtheme.min.js"
    curl -s -o "$js_dir/maxtheme.min.js" "$js_url"
    echo ""
    echo "____________________________________________________________________________________________________"
    echo ""
    echo -e "                                    ${txt_green}$(t "theme_installed")${reset}"
    echo -e "                   ${txt_green}$(t "theme_installed_2")${reset}"
    echo "____________________________________________________________________________________________________"
    echo ""
}

# Function to uninstall the theme
# Función para desinstalar el tema
uninstall_theme() {
    style=$1
    theme_color=$2
    theme_dir="/usr/local/hestia/web/css/themes/custom"

    # Build the CSS file name
    # Construye el nombre del archivo CSS
    css_file="maxtheme-${style,,}-${theme_color,,}.min.css"
    css_path="$theme_dir/$css_file"

    # Delete the CSS file if it exists
    # Elimina el archivo CSS si existe
    if [ -f "$css_path" ]; then
        rm -f "$css_path"
        echo ""
        echo "____________________________________________________________________________________________________"
        echo ""
        echo -e "                                    ${txt_green}$(t "theme_uninstalled")${reset}"
        echo "____________________________________________________________________________________________________"
        echo ""
    else
        echo ""
        echo -e "MaxTheme $(echo ${style^}) $theme_color $(t "no_uninstall")"
        echo ""
    fi
}

# Function to uninstall all maxtheme themes
# Función para desinstalar todos los temas de maxtheme
delete_all() {
    theme_dir="/usr/local/hestia/web/css/themes/custom"
    js_dir="/usr/local/hestia/web/js/custom_scripts"

    # Delete all CSS files that start with maxtheme
    # Elimina todos los archivos CSS que comienzan con maxtheme
    find "$theme_dir" -type f -name "maxtheme-*.min.css" -exec rm -f {} \;

    # Delete the JS file
    # Elimina el archivo JS
    rm -f "$js_dir/maxtheme.min.js"
    echo ""
    echo "____________________________________________________________________________________________________"
    echo ""
    echo -e "                     ${txt_green}$(t "all_themes_uninstalled")${reset}"
    echo "____________________________________________________________________________________________________"
    echo ""
}

# Function to manage the uninstallation of themes
# Función para gestionar la desinstalación de los temas
uninstall() {
    clear
    show_menu_motd
    echo "$(t "uninstall_title")"
    echo ""
    echo "1) $(t "uninstall_opt1")"
    echo "2) $(t "uninstall_opt2")"
    echo ""
    echo -e -n "${txt_green}$(t "select_option") [1-2]:  ${reset}"
    read uninstall_option

    case $uninstall_option in
        1)
            # Confirmation before deleting all themes
            # Confirmación antes de eliminar todos los temas
            echo ""
            echo -e -n "${txt_red}$(t "uninstall_confirm") ${reset}"
            read confirm
            if [[ "$confirm" =~ ^[SsYy]$ ]]; then
                delete_all
            else
                echo ""
                echo "$(t "no_theme_deleted")"
                echo ""
                exit
            fi
            ;;
        2)
            # Selecting a theme to uninstall
            # Selección de tema para desinstalar
            clear
            show_menu_motd
            echo "$(t "select_themes_uninstalled_title")"
            echo ""
            echo "1) Dark"
            echo "2) Light"
            echo ""
            echo -e -n "${txt_green}$(t "select_option") [1-2]: ${reset}"
            read type_theme

            case $type_theme in
                1)
                    list_themes "dark" "uninstall"
                    ;;
                2)
                    list_themes "light" "uninstall"
                    ;;
                *)
                    echo "$(t "invalid_option")"
                    sleep 1
                    uninstall
                    ;;
            esac
            ;;
        *)
            echo "$(t "invalid_option")"
            sleep 1
            uninstall
            ;;
    esac
}

# Start of script
# Inicio del script
select_language