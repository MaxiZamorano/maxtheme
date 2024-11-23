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

show_menu() {
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

# Función para seleccionar el idioma
select_language() {
    clear
    show_menu
    echo "Select your language / Selecciona tu idioma"
    echo ""
    echo "1) English"
    echo "2) Español"
    echo ""
    echo -e -n "${txt_green}Select an option / Selecciona una opción [1-2]: ${reset}"
    read select_language

    case $select_language in
        1)
            echo "Proximamente..."
            exit
            ;;
        2)
            main_menu
            ;;
        *)
            echo "Opción inválida. Intente de nuevo."
            sleep 1
            select_language
            ;;
    esac
}

# Función para mostrar el menú principal
main_menu() {
    clear
    show_menu
    echo "Menú principal"
    echo ""
    echo "1) Instalar/Reinstalar/Actualizar"
    echo "2) Desinstalar"
    echo "3) Salir"
    echo ""
    echo -e -n "${txt_green}Selecciona una opción [1-3]: ${reset}"
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
            echo "Opción inválida. Intente de nuevo."
            sleep 1
            main_menu
            ;;
    esac
}

# Función para instalar/reinstalar o actualizar un tema
install_reinstall_update() {
    clear
    show_menu
    echo "Selecciona el estilo de tema para instalar:"
    echo ""
    echo "1) Dark"
    echo "2) Light"
    echo ""
    echo -e -n "${txt_green}Selecciona una opción [1-2]: ${reset}"
    read type_theme

    case $type_theme in
        1)
            list_themes "dark" "install"
            ;;
        2)
            list_themes "light" "install"
            ;;
        *)
            echo "Opción inválida. Intente de nuevo."
            sleep 1
            install_reinstall_update
            ;;
    esac
}

list_themes() {
    style=$1
    action=$2

    # Definie los nombres y colores de los temas Dark y Light
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
    else
        echo "Estilo de tema desconocido: $style"
        return
    fi

    clear
    show_menu
    echo -e "Variación de colores para $(echo ${style^}):"
    echo ""

    # Muestra la lista de temas con colores
    for i in "${!theme_names[@]}"; do
        echo -e "${theme_colors[i]} $((i + 1))) ${theme_names[i]}"
    done

    echo ""
    echo -e "Revisa la tabla de colores exacta en: https://github.com/MaxiZamorano/maxtheme/"
    echo ""
    echo -e -n "${txt_green}Selecciona un tema [1-${#theme_names[@]}]: ${reset}"
    read theme_index

    if [[ $theme_index -ge 1 && $theme_index -le ${#theme_names[@]} ]]; then
        selected_theme="${theme_names[$((theme_index - 1))]}"
        if [ "$action" == "install" ]; then
            echo ""
            echo -e "Instalando MaxTheme $(echo ${style^}) $selected_theme..."
            install_theme "$style" "$selected_theme"
        elif [ "$action" == "uninstall" ]; then
            echo ""
            echo -e "Desinstalando MaxTheme $(echo ${style^}) $selected_theme..."
            uninstall_theme "$style" "$selected_theme"
        else
            echo "Acción desconocida: $action"
        fi
    else
        echo "Opción inválida. Intente de nuevo."
        sleep 1
        list_themes "$style" "$action"
    fi
}

# Función para instalar un tema
install_theme() {
    style=$1
    theme_color=$2
    theme_dir="/usr/local/hestia/web/css/themes/custom"
    js_dir="/usr/local/hestia/web/js/custom_scripts"

    # Crear el directorio si no existe
    mkdir -p "$theme_dir"

    # Descargar el archivo CSS correspondiente
    css_file="maxtheme-${style,,}-${theme_color,,}.min.css"
    css_url="https://raw.githubusercontent.com/maxizamorano/maxtheme/main/themes/css/${style,,}/$css_file"
    curl -s -o "$theme_dir/$css_file" "$css_url"

    # Descargar el archivo JS
    js_url="https://raw.githubusercontent.com/maxizamorano/maxtheme/main/themes/js/maxtheme.min.js"
    curl -s -o "$js_dir/maxtheme.min.js" "$js_url"
    echo ""
    echo "____________________________________________________________________________________________________"
    echo ""
    echo -e "                                    ${txt_green}¡TEMA INSTALADO CORRECTAMENTE!${reset}"
    echo -e "               ${txt_green}Debes cambiar el tema de forma manual desde los ajustes de HestiaCP.${reset}"
    echo "____________________________________________________________________________________________________"
    echo ""
}


# Función para desinstalar un tema
uninstall_theme() {
    style=$1
    theme_color=$2
    theme_dir="/usr/local/hestia/web/css/themes/custom"

    # Construye el nombre del archivo CSS
    css_file="maxtheme-${style,,}-${theme_color,,}.min.css"
    css_path="$theme_dir/$css_file"

    # Elimina el archivo CSS si existe
    if [ -f "$css_path" ]; then
        rm -f "$css_path"
        echo ""
        echo "____________________________________________________________________________________________________"
        echo ""
        echo -e "                                    ${txt_green}¡TEMA DESINSTALADO CORRECTAMENTE!${reset}"
        echo "____________________________________________________________________________________________________"
        echo ""
    else
        echo ""
        echo -e "MaxTheme $(echo ${style^}) $theme_color no se encuentra instalado en tu sistema."
        echo ""
    fi
}

# Función para desinstalar todos los temas de maxtheme
delete_all() {
    theme_dir="/usr/local/hestia/web/css/themes/custom"
    js_dir="/usr/local/hestia/web/js/custom_scripts"

    # Elimina todos los archivos CSS que comiencen con maxtheme
    find "$theme_dir" -type f -name "maxtheme-*.min.css" -exec rm -f {} \;

    # Elimina el archivo JS
    rm -f "$js_dir/maxtheme.min.js"
    echo ""
    echo "____________________________________________________________________________________________________"
    echo ""
    echo -e "                     ${txt_green}¡TODOS LOS TEMAS MAXTHEME SE HAN DESINSTALADO CORRECTAMENTE!${reset}"
    echo "____________________________________________________________________________________________________"
    echo ""
}

# Función para manejar la desinstalación del tema
uninstall() {
    clear
    show_menu
    echo "¿Quieres desinstalar completamente MaxTheme o solo algunos temas?"
    echo ""
    echo "1) Todos (desinstalación completa)"
    echo "2) Algunos (solo algunos temas que selecciones)"
    echo ""
    echo -e -n "${txt_green}Selecciona una opción [1-2]:  ${reset}"
    read uninstall_option

    case $uninstall_option in
        1)
            # Confirmación antes de eliminar todos los temas
            echo ""
            echo -e -n "${txt_red}¿Estás seguro de desinstalar todos los temas de MaxTheme? (s/n): ${reset}"
            read confirm
            if [[ "$confirm" =~ ^[SsYy]$ ]]; then
                delete_all
            else
                echo ""
                echo "No se eliminó ningún tema."
                echo ""
                exit
            fi
            ;;
        2)
            # Selección de tema para desinstalar
            clear
            show_menu
            echo "Selecciona el estilo de tema para desinstalar:"
            echo ""
            echo "1) Dark"
            echo "2) Light"
            echo ""
            echo -e -n "${txt_green}Selecciona una opción [1-2]: ${reset}"
            read type_theme

            case $type_theme in
                1)
                    list_themes "dark" "uninstall"
                    ;;
                2)
                    list_themes "light" "uninstall"
                    ;;
                *)
                    echo "Opción inválida. Intente de nuevo."
                    sleep 1
                    uninstall
                    ;;
            esac
            ;;
        *)
            echo "Opción inválida. Intente de nuevo."
            sleep 1
            uninstall
            ;;
    esac
}

# Inicio del script
select_language