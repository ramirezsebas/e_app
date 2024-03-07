# Proyecto

Prueba tecnica para el puesto de desarrollador de Flutter para EClub. Tener en cuenta que el build require el keystore y key.properties.

## Configuración

Antes de generar la APK, asegúrese de tener instaladas las siguientes herramientas y configuraciones:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado en su sistema.
- [FVM](https://fvm.app/documentation/getting-started/installation) instalado en su sistema. (Opcional)
- [Android Studio](https://developer.android.com/studio) instalado en su sistema.
- [Git](https://git-scm.com/) instalado en su sistema para clonar este repositorio.
- Conexión a internet para descargar dependencias y recursos necesarios.

## Generación de APK

Siga estos pasos para generar la APK:

1. **Clonar el repositorio:**

    ```bash
    git clone https://github.com/ramirezsebas/e_app
    ```

3. **Instalar la version de Flutter**

- Ejecutar en caso de haber instalado fvm

    ```bash
    fvm use
    ```

2. **Abrir el proyecto en Visual Studio Code:**
    - Abra Visual Studio Code con el proyecto.
    - Ejecutar el debug del editor o ejecutar

    ```bash
    flutter run --flavor development --target lib/main_development.dart
    ```

    o si tenes make:
    ```bash
    make run-dev
    ```

3. **Configuración del proyecto:**
    - Asegúrese de que todas las dependencias de Flutter se descarguen correctamente.
    - Si hay alguna configuración adicional específica del proyecto, asegúrese de configurarla según sea necesario.

4. **Generación de la APK:**
    - Debe crear el archivo key.properties (Podes usar make build-config)
    - Agregar en android/app/ el keystore_name.keystore (Enviado por correo)
    - En la terminal, navegue hasta el directorio del proyecto y ejecute el siguiente comando:

    ```bash
    flutter build appbundle --flavor development --target lib/main_development.dart
    ```

    - o en caso de tener make, usar uno de los casos:

    ```bash
    make build-dev
    make build-stage
    make build-prod
    ```

5. **Localización de la APK generada:**
    - Una vez completado el proceso de generación, encontrará la APK generada en la carpeta `build/app/outputs/flutter-apk/` dentro del proyecto.

## Contacto

Si tiene algún problema o necesita ayuda, no dude en contactarme a través de correo electrónico a <ramirezmatias946@gmail.com>.

### Observación

- Se uso libreria piechart, por lo tanto no se navega mediante el pie chart sino del listado de movimientos
