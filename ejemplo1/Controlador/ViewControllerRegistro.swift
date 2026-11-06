//
//  ViewControllerRegistro.swift
//  ejemplo1
//
//  Created by Salvador Lopez on 04/11/26.
//

// UIKit es el framework de Apple con todos los elementos visuales de iOS
// (botones, etiquetas, tablas, pantallas, etc.).
import UIKit

// Esta clase controla la pantalla de "Registro".
// Hereda de UITableViewController, que es un controlador especial que ya trae
// una tabla (UITableView) ocupando toda la pantalla. En el storyboard se usa
// para acomodar los campos del formulario en celdas.
class ViewControllerRegistro: UITableViewController {

    // @IBAction conecta un evento del storyboard (tocar el botón "Cancelar")
    // con este método. "sender" es el objeto que disparó el evento (el botón).
    @IBAction func CancelarBtb(_ sender: Any) {
        // Hay dos formas de mostrar una pantalla en iOS, y cada una se cierra distinto:
        //
        // 1. PUSH (dentro de un UINavigationController): la pantalla se "apila"
        //    encima de la anterior y aparece el botón "< Atrás". Se cierra con
        //    popViewController, que la saca de la pila.
        // 2. MODAL (present): la pantalla aparece "flotando" desde abajo.
        //    Se cierra con dismiss.
        //
        // En el storyboard esta pantalla se abre con un segue tipo "Show" dentro
        // de un navigation controller (push), pero revisamos ambos casos para que
        // el botón funcione sin importar cómo se haya abierto.

        // "navigationController" es opcional (?): solo existe si esta pantalla vive
        // dentro de un navigation controller. Además verificamos que no sea la
        // primera pantalla de la pila (si lo fuera, no habría a dónde regresar).
        if let nav = navigationController, nav.viewControllers.first != self {
            // Regresa a la pantalla anterior con animación.
            nav.popViewController(animated: true)
        } else {
            // dismiss cierra una pantalla presentada de forma modal.
            // El closure (bloque entre llaves) se ejecuta cuando termina la animación.
            dismiss(animated: true) {
                print("Registro cancelado")
            }
        }
    }

    // Propiedad que recibe un texto desde la pantalla anterior.
    // ViewController la llena en su método prepare(for:sender:) antes de navegar.
    var mensaje = ""

    // viewDidLoad se ejecuta UNA sola vez, cuando la vista se carga en memoria.
    // Es el lugar ideal para la configuración inicial de la pantalla.
    override func viewDidLoad() {
        // "super" llama a la versión original del método en la clase padre.
        // Siempre se debe llamar para que UIKit haga su trabajo interno.
        super.viewDidLoad()

        // Imprime en la consola de Xcode el mensaje recibido.
        print(mensaje)
        // Do any additional setup after loading the view.
    }

}
