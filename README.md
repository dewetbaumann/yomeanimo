![logo](/assets/images/logo.png "logo")

## *YoMeAnimo Challenge*

Para el desarrollo del código se trabajó con Clean Architecture y Clean Code, ademas de la implementación de una arquitectura pseudo hexagonal, en el archivo Readme.md del repositorio se dejo una detalle completo de instalación, documentación, además me agregue la libertad de agregar GitHub Actions para la CI, explicación más a fondo de todo lo escrito en el repo.

https://github.com/dewetbaumann/yomeanimo/blob/main/README.md

La forma en la cual trabaje en el repositorio fue simulando el uso de Jira, donde se trabajaría en base a FEATURES of BUGFIXES como nombre del branch, seguido del número de ticket y el título del mismo para no perder la referencia, además de eso la implementación de Pull Request al branch principal (main) para mantener las instancias de trabajo diferente.

https://github.com/dewetbaumann/yomeanimo

1- CHATEAR ENTRE PERFILES		
Una persona quiere ponerse en contacto con otra, pero solamente puede escribirle, si una vez enviado el saludo, el otro lo acepta. Y una vez que el otro lo acepte puede seguir escribiendo siempre, salvo que la otra persona lo bloquee. Tener en cuenta que los perfiles se encuentran buscando al estilo “tinder” se selecciona un país y aparecen todos los perfiles que tienen ese país como destino.
Respuesta
Una vez seleccionado el país, haría una consulta a la API o el Middleware con mi token de autorización para traer el listado de usuarios disponibles para mi, lo resolveria del lado del backend por cuestiones de seguridad, en donde una vez tenga todos los usuarios disponibles eliminaría a los que me tengan “bloqueado” y devolver el array armado. Para la comunicación lo mas efectivo seria utilizar WSS (Web socket service) un servicio de notificación como OneSignal o Push Notifications de Firebase para las alertas sumado a alguna base de datos no relacional para el almacén de los mensajes, quizás Firestore RealTime. eso sumado a alguna dependencia como Flutter local push notifications	

# *Instalación y configuración.*

## 1. Flutter & Dart.

El repositorio fue desarrollado en las siguientes versiones, por lo cual es necesario tener las mismas o superiores.

- Flutter v3.7.9
- Dart v2.19.6

## 2. Configuración del IDE.

Para evitar errores en el formateo en diferentes IDE's, los archivos tienen las siguientes características.

- Longitud máxima de cada línea es de 124 caracteres.
- El auto formateado de Dart debe estar habilitado.
- Utiliza 2 saltos de líneas para tabulación.

## 3. Emulador/Simulador.

Es necesario un emulador con las siguientes características:

- Android con una `API > 21` en preferencia usar la `API 29 o 30`.
- iOS con una `API > 10` en preferencia usar la más actual.

# *Arquitectura - Estructura de directorios*

El directorio donde se encuentra el código principal de la aplicación escrito en *Dart/Flutter* está en la carpeta `lib` dentro de la raíz del directorio y en su interior tiene las siguientes capas:

*Estructura*


┣📦 assets
┃ ┣📂 images
┣📦 lib
┃ ┣📂 core
┃ ┣📂 data
┃ ┣📂 device
┃ ┣📂 domain
┃ ┣📂 ui



<hr>

### *Capa: core*

Es donde se almacena el código que es requerido de forma global en el aplicativo, por ejemplo:

En la carpeta `./services` se encuentra los servicios que requiere el código como obtener los textos traducidos dependiendo el lenguaje, la serializacion de datos primitivos, consumir servicios de Google FireBase, etc.

*Estructura*

 ┣ 📂core

 ┃ ┣ 📂services
 ┃ ┣ 📂styles
 ┃ ┣ 📂utils


<hr>

### *Capa: data*

Capa encargada de comunicarse con las dependencias externas que necesita nuestra app para obtener los datos. Es la implementación concreta de los repositorios con llamadas *HTTP* (utilizando Dio), *serialización* (mediante clases), e inclusive la obtención de datos almacenados de forma local, no necesarios externamente, como por ejemplo un repositorio para obtener el token almacenado en el dispositivo. La capa `data` es la capa encargada de la implementación de repositorios para la comunicación interna y externa de datos, así como su procesamiento para su interacción con la capa de dominio.

Dentro tenemos la carpeta `./models` la cual hace referencia a todos los modelos obtenidos en la interacción con la API, es decir aquí tenemos toda la lógica para la serialización.

Además, también tenemos la comunicación con el exterior como por ejemplo en la carpeta `.api/` tenemos lo correspondiente a llamada a la API obteniendo la respuesta con su correspondiente serialización o des serialización en su defecto.

*Estructura*


┣ 📂data
┃ ┣ 📂datasources
┃ ┣ 📂fb_analytics
┃ ┣ 📂implementations
┃ ┣ 📂keys
┃ ┣ 📂models
┃ ┣ 📂repositories


<hr>

### *Capa: domain*

Capa que engloba toda la lógica de negocio de nuestra app, donde se encuentra el código que debe ser agnóstico de cualquier otra parte de nuestro software.

En la carpeta `./controllers` se encutran las clases que llevan el mismo nombre que la pantalla de la cual es llamada, por ejemplo RouteController, Los controllers para ser usado tiene dos formas una es acceder a los metodos inicializando con el BuildContext y la otra es acceder a los metodos estaticos que no requieren del mismo, los controllers son los encargados de proporcionar acceso a los casos de uso interactuar con los providers y ademas crear una capa mas de abstraccion entre logica y la UI.

En la carpeta `./entities` se encuentra la capa Entities en donde se definen los modelos que interactuarán en el sistema. Estos son objetos abstractos definidos para la interaccion de componentes.

En la carpeta `./repositories` se encuentra la capa intercesora que convierte los datos extraídos por la capa de datos, convirtendolos en el formato más conveniente para los casos de uso.

En la carpeta `./riverpod` se encuentran todos los providers de la aplicación como los de routes, waypoints, order, order item, etc. Encargados de controlar el estado de la aplicación en sus respectivas páginas.

En la carpeta `./use_case` se encuentra la capa que contiene las reglas que le dan sentido a la aplicación. Los casos de uso dirigen el flujo a las entidadea y dtos para ser consumido o llamados desde los controllers.

*Estructura*


 ┣ 📂domain
 ┃ ┣ 📂controllers
 ┃ ┣ 📂entities
 ┃ ┣ 📂repositories
 ┃ ┣ 📂riverpod
 ┃ ┗ 📂use_case


 <hr>

### *Capa: ui (presentación)*

Capa encargada de la representación de los datos en el dispositivo. En nuestro caso, será todo el código de Flutter correspondiente a nuestros Widgets, pages, navegación, etc, esta capa se caracteriza porque debe ser lo más separada de la lógica posible (aunque actualmente no se cumple en todos los casos).

En la carpeta `./pages` se encuentra actualmente todas las páginas de la aplicación.

En la carpeta `./widgets` se encuentra todos los componentes de cada página, separados por el nombre de la página como nombre de la carpeta, por ejemplo `./widgets/routes/some_widget.dart`

*Estructura*


 ┣ 📂ui
 ┃ ┣ 📂pages
 ┃ ┗ 📂widgets


<hr>

### *Capa: config*

Es la capa encargada de tener los archivos de configuracion del aplicativo, por ejemplo, las rutas de las pantallas, animaciones, nombre de isolates, urls etc

<hr>

> Como conlusion podemos obtner una estructura de la siguiente forma, con la conjuncion de las diferentes capas.


📂 lib
┣ 📂config
┣ 📂core
┃ ┣ 📂services
┣ 📂data
┃ ┣ 📂datasources
┃ ┣ 📂fb_analytics
┃ ┣ 📂implementations
┃ ┣ 📂keys
┃ ┣ 📂models
┃ ┣ 📂repositories
┣ 📂domain
┃ ┣ 📂controllers
┃ ┣ 📂entities
┃ ┣ 📂repositories
┃ ┣ 📂riverpod
┃ ┗ 📂use_case
┣ 📂ui
┃ ┣ 📂pages
┃ ┗ 📂widgets

<hr>