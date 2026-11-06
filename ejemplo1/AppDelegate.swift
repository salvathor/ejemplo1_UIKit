//MARK: - AQUI SE VE EL CICLO DE VIDA
//  AppDelegate.swift
//  ejemplo1
//
//  Created by Salvador Lopez on 02/11/26.
//

import UIKit

// @main indica el PUNTO DE ENTRADA de la app: es lo primero que iOS ejecuta.
// AppDelegate recibe los eventos del ciclo de vida de la APLICACIÓN completa
// (cuando inicia, cuando se cierra, etc.).
// - UIResponder: le permite responder a eventos.
// - UIApplicationDelegate: protocolo con los métodos que iOS llama en cada etapa.
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    // Se llama cuando la app terminó de arrancar. Es buen lugar para
    // configuraciones iniciales (ej. bases de datos, librerías externas).
    // Debe devolver true para indicar que la app se lanzó correctamente.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("La app se inicio con esta configuracion ...")
        return true
    }

    // MARK: UISceneSession Lifecycle
    // Desde iOS 13 una app puede tener varias "escenas" (ventanas, por ejemplo en iPad).
    // Cada escena se maneja en SceneDelegate.

    // Se llama cuando se crea una nueva escena. Devuelve la configuración
    // ("Default Configuration", definida en Info.plist) con la que se creará.
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    // Se llama cuando el usuario descarta (cierra) una o varias escenas.
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // Se llama justo antes de que la app se cierre por completo.
    // Nota: no siempre se ejecuta (por ejemplo, si iOS cierra la app estando suspendida).
    func applicationWillTerminate(_ application: UIApplication) {
        print("Se va cerrar la app...")
    }


}
