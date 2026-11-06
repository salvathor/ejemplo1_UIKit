# ejemplo1 – UIKit

Proyecto de ejemplo para el curso de **Desarrollo de Aplicaciones iOS (Básico)**.
Muestra los conceptos fundamentales de **UIKit** con **Storyboards** y **Swift**: pantallas, navegación, paso de datos entre pantallas, alertas y tablas.

Todo el código está comentado en español para que sea fácil de seguir si estás empezando.

## Requisitos

| Herramienta | Versión |
| --- | --- |
| Xcode | Compatible con iOS 27.2 SDK |
| iOS (deployment target) | 27.2 |
| Swift | 5 |

## Cómo ejecutar

1. Clona el repositorio:
   ```bash
   git clone https://github.com/salvathor/ejemplo1_UIKit.git
   ```
2. Abre `ejemplo1.xcodeproj` en Xcode.
3. Selecciona el esquema **ejemplo1** y un simulador de iPhone.
4. Presiona **⌘R** para compilar y ejecutar.

## Estructura del proyecto

```
ejemplo1/
├── AppDelegate.swift            # Ciclo de vida de la aplicación
├── SceneDelegate.swift          # Ciclo de vida de la escena (ventana)
├── Controlador/
│   ├── ViewController.swift          # Pantalla de login
│   ├── ViewControllerRegistro.swift  # Pantalla de registro
│   ├── ViewControllerFAQs.swift      # Tabla de frutas (FAQs)
│   └── ViewControllerAyuda.swift     # Imagen de la fruta seleccionada
├── Vista/
│   └── Base.lproj/
│       ├── Main.storyboard           # Diseño de las pantallas y segues
│       └── LaunchScreen.storyboard   # Pantalla de arranque
├── Util/
│   ├── StringExt.swift               # Extensión de String (isPalindrome)
│   └── Playground/Playground.swift   # Ejemplos de fundamentos de Swift
├── Assets.xcassets                   # Imágenes y colores
└── Info.plist
```

La carpeta `Controlador` contiene la lógica de cada pantalla y `Vista` contiene los storyboards, siguiendo la idea del patrón **MVC** (Modelo–Vista–Controlador).

## Pantallas

| Pantalla | Clase | Qué muestra |
| --- | --- | --- |
| Login | `ViewController` | Campos de correo y contraseña. Si alguno está vacío muestra un `UIAlertController`; si no, muestra un mensaje en un `UILabel`. |
| Registro | `ViewControllerRegistro` | Formulario basado en `UITableViewController`. Recibe un mensaje desde el login y tiene un botón **Cancelar** para regresar. |
| FAQs | `ViewControllerFAQs` | `UITableView` con una lista de frutas y sus kilocalorías. Al tocar una fila abre la pantalla de Ayuda. |
| Ayuda | `ViewControllerAyuda` | Muestra en un `UIImageView` la imagen de la fruta seleccionada. |

## Conceptos que se practican

- **Ciclo de vida** de la app (`AppDelegate`) y de la escena (`SceneDelegate`).
- **Ciclo de vida de una vista**: `viewDidLoad` vs `viewDidAppear`.
- **`@IBOutlet` y `@IBAction`** para conectar el storyboard con el código.
- **Segues** y paso de datos con `prepare(for:sender:)`.
- **Navegación por código** con `instantiateViewController(withIdentifier:)` y `present`.
- **Cerrar pantallas**: `popViewController` (push en un `UINavigationController`) vs `dismiss` (presentación modal).
- **Alertas** con `UIAlertController` y `UIAlertAction`.
- **Tablas** con `UITableViewDelegate` y `UITableViewDataSource`, y reutilización de celdas con `dequeueReusableCell`.
- **Imágenes** desde `Assets.xcassets` con `UIImage(named:)`.
- **Extensiones** (`extension String`) y propiedades calculadas.
- **Fundamentos de Swift** en `Playground.swift`: opcionales, `if let`, `guard`, `switch`, ciclos, funciones, closures, clases vs structs, protocolos y enums.

## Autor

Salvador Lopez
