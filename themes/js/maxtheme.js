/*
 * Theme Name: MaxTheme for HestiaCP
 * Version: 3.0
 * License: GPLv3
 * Author: Maxi Zamorano
 * Author URL: https://www.maxizamorano.com/
 * Email: contacto@maxizamorano.com
 * GitHub Repository: https://github.com/MaxiZamorano/maxtheme
 * Description: Elegant theme for HestiaCP with Tailwind UI style.
*/

document.addEventListener('DOMContentLoaded', function () {
    // Check if there is a CSS file that matches MaxTheme
    // Verifica si existe un archivo CSS que coincida con MaxTheme
    const allLinks = document.querySelectorAll('link[rel="stylesheet"]');
    const cssLight = Array.from(allLinks).find(link => /maxtheme-light-.*\.min\.css/.test(link.href));
    const cssDark = Array.from(allLinks).find(link => /maxtheme-dark-.*\.min\.css/.test(link.href));

    if (!cssLight && !cssDark) {
        return;
    }

    // 1.- Invert the labels and inputs
    // 1.- Invierte los labels e inputs
    setTimeout(function () {
        const containers = document.querySelectorAll('.u-mb10, .u-mb20');
        containers.forEach(container => {
            const label = container.querySelector('.form-label');
            const input = container.querySelector('.form-control');
            if (label && input && container.contains(label) && container.contains(input)) {
                try {
                    container.insertBefore(input, label);
                } catch (error) {
                    console.error('Error reordenando labels e inputs:', error);
                }
            }
        });
    }, 100);

    // 2.- Add the floating-text class
    // 2.- Añade la clase floating-text
    document.querySelectorAll('.form-control').forEach(input => {
        if (input.value.trim() !== '') {
            input.classList.add('floating-text');
        }
        input.addEventListener('input', function () {
            if (this.value.trim() !== '') {
                this.classList.add('floating-text');
            } else {
                this.classList.remove('floating-text');
            }
        });
    });

    // 3.- Add a margin when selecting the "Do not allow user to log in to Control Panel" checkbox so that it does not interfere with the language selector
    // 3.- Añade un margen al seleccionar el checkbox de "No permitir al usuario acceder al Panel de Control" para que no interfiera con el selector de lenguaje
    const formCheckContainer = document.querySelector('.form-check');
    if (formCheckContainer) {
        const loginDisabledCheckbox = document.querySelector('#v_login_disabled');
        if (loginDisabledCheckbox) {
            const formCheckContainer = loginDisabledCheckbox.closest('.form-check');
            loginDisabledCheckbox.addEventListener('change', function () {
                formCheckContainer.style.marginBottom = this.checked ? '20px' : '';
            });
        }
    }

    // 4.- Invert the icons and menu text
    // 4.- Invierte los íconos y texto del menú
    const menuLabels = document.querySelectorAll('.main-menu-item-label');
    menuLabels.forEach(label => {
        const icon = label.querySelector('i');
        const textNode = label.childNodes[0];
        if (icon && textNode.nodeType === Node.TEXT_NODE) {
            label.removeChild(textNode);
            label.insertBefore(textNode, icon.nextSibling);
        }
    });

    // 5.- Move the "Forgot password" link so that it is below the password input
    // 5.- Mueve el enlace de "Contraseña Olvidada" para que quede debajo del input de contraseña
    const loginContainer = document.querySelector('.login');
    if (loginContainer) {
        const passwordDiv = loginContainer.querySelector('.u-mb20');
        const forgotPasswordLink = loginContainer.querySelector('.login-form-link');
        if (passwordDiv && forgotPasswordLink) {
            const linkContainer = document.createElement('div');
            linkContainer.className = 'forgot-password-container';
            linkContainer.appendChild(forgotPasswordLink);
            passwordDiv.insertAdjacentElement('afterend', linkContainer);
        }
    }

    // 6.- Remove the "width" and "height" attributes from the login logo
    // 6.- Elimina los atributos "width" y "height" en el logo del login
    const imgElement = document.querySelector('.login img');
    if (imgElement) {
        imgElement.removeAttribute('width');
        imgElement.removeAttribute('height');
    }

    // 7.- Add icons to the login labels.
    // 7.- Agrega íconos a los labels del login.
    const usernameLabel = document.querySelector('label[for="username"]');
    const passwordLabel = document.querySelector('label[for="password"]');
    const emailLabel = document.querySelector('label[for="email"]');
    if (usernameLabel) {
        const usernameIcon = document.createElement('i');
        usernameIcon.className = 'fa-solid fa-user';
        usernameIcon.style.marginRight = '5px';
        usernameLabel.insertBefore(usernameIcon, usernameLabel.firstChild);
    }
    if (passwordLabel) {
        const passwordIcon = document.createElement('i');
        passwordIcon.className = 'fa-solid fa-lock';
        passwordIcon.style.marginRight = '5px';
        passwordLabel.insertBefore(passwordIcon, passwordLabel.firstChild);
    }
    if (emailLabel) {
        const emailIcon = document.createElement('i');
        emailIcon.className = 'fa-solid fa-envelope';
        emailIcon.style.marginRight = '5px';
        emailLabel.insertBefore(emailIcon, emailLabel.firstChild);
    }

    // 8.- Secure password generator (this is added because when inverting the labels and inputs the HestiaCP js does not work to generate passwords, this code performs the same function)
    // 8.- Generador de contraseñas seguras (se agrega esto porque al invertir los labels e inputs no funciona el js de HestiaCP para generar contraseñas, este codigo cumple la misma funcion)
    function generatePassword() {
        const length = 16;
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@_#-$%^+&*()';
        let password = '';
        for (let i = 0; i < length; i++) {
            const randomIndex = Math.floor(Math.random() * chars.length);
            password += chars[randomIndex];
        }
        return password;
    }
    document.querySelectorAll('.js-generate-password').forEach(button => {
        button.addEventListener('click', () => {
            const input = button.closest('.u-mb10').querySelector('.js-password-input');
            if (input) {
                input.value = generatePassword();
                input.dispatchEvent(new Event('input'));
            }
        });
    });
});
