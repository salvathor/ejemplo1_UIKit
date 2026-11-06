//
//  SceneDelegate.swift
//  ejemplo1
//
//  Created by Salvador Lopez on 02/11/26.
//

import UIKit

// SceneDelegate maneja el ciclo de vida de una ESCENA (una ventana de la app):
// cuando aparece, pasa a segundo plano, vuelve al frente, etc.
// Adopta el protocolo UIWindowSceneDelegate para recibir esos eventos.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // La ventana principal donde se dibuja toda la interfaz.
    // Es opcional (?) porque al inicio todavía no existe.
    var window: UIWindow?


    // Se llama cuando la escena se conecta (se crea) por primera vez.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // guard verifica que la escena sea de tipo UIWindowScene; si no, sale del método.
        // El "_" significa que no necesitamos guardar el valor, solo comprobarlo.
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    // La escena se desconectó (el sistema la liberó de memoria).
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    // La escena está activa: el usuario puede interactuar con ella.
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    // La escena va a dejar de estar activa (ej. llega una llamada o se abre el Centro de Control).
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    // La escena va a pasar de segundo plano (background) al frente (foreground).
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print("La vista esta al frente ...")
    }

    // La escena pasó a segundo plano (ej. el usuario regresó a la pantalla de inicio).
    // Buen momento para guardar datos.
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print("La vista esta en background ...")
    }


}
