//
//  ViewController.swift
//  ejemplo1
//
//  Created by Salvador Lopez on 02/11/26.
//

// UIKit es el framework de Apple con todos los elementos visuales de iOS.
import UIKit

// ViewController controla la pantalla de inicio de sesión (login).
// Hereda de UIViewController, la clase base de cualquier pantalla en UIKit.
class ViewController: UIViewController {

    // @IBOutlet conecta un elemento visual del storyboard con una variable en código.
    // "weak" evita que el controlador "retenga" la vista de más (manejo de memoria).
    // El "!" indica que es un opcional desenvuelto implícitamente: confiamos en que
    // el storyboard lo conectará antes de usarlo (si no, la app fallaría).
    @IBOutlet weak var passwordTextField: UITextField!   // Campo para la contraseña
    @IBOutlet weak var correoTextField: UITextField!     // Campo para el correo
    @IBOutlet weak var mensajeLabel: UILabel!            // Etiqueta para mostrar mensajes


    // @IBAction se ejecuta cuando el usuario toca el botón de "Login" en el storyboard.
    @IBAction func loginBtn(_ sender: Any) {
        // UIAlertController crea una alerta (ventana emergente).
        // preferredStyle: .alert la muestra centrada; .actionSheet la mostraría abajo.
        let ac = UIAlertController(title: "Alerta", message: "Debes ingresar correo electronico y contraseña", preferredStyle: .alert)

        // UIAlertAction es un botón dentro de la alerta.
        // El closure { acepto in ... } es el código que se ejecuta al tocarlo.
        // style: .default es un botón normal.
        let aa_aceptar = UIAlertAction(title: "Aceptar", style: .default) { acepto in
            print("ENTENDIDO")
        }

        // style: .cancel marca el botón como "cancelar" (iOS lo muestra en negritas
        // y lo coloca en una posición especial).
        let aa_cancelar = UIAlertAction(title: "Cancelar", style: .cancel) { cancelar in
            print("CANCELAR")
        }

        // Agregamos los botones a la alerta.
        ac.addAction(aa_aceptar)
        ac.addAction(aa_cancelar)

        // "||" significa "o": si el correo O la contraseña están vacíos...
        if correoTextField.text == "" || passwordTextField.text == "" {
            // ...mostramos la alerta. "present" muestra otra vista encima de la actual.
            self.present(ac, animated: true)
        }else{
            // Si ambos campos tienen texto, mostramos un mensaje en la etiqueta.
            mensajeLabel.text = "El suario no ha sido encontrado."
        }

    }

    // viewDidLoad se ejecuta una sola vez, cuando la pantalla se carga en memoria.
    override func viewDidLoad() {
        // Llamamos a la implementación de la clase padre (UIViewController).
        super.viewDidLoad()
    }

    // MARK: - Navigation

    // prepare(for:sender:) se ejecuta justo ANTES de que un segue (una transición
    // definida en el storyboard) nos lleve a otra pantalla. Aquí podemos
    // pasarle datos a la pantalla destino.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Cada segue puede tener un identificador; así sabemos cuál se está ejecutando.
        if segue.identifier == "segue_registro" {
            // segue.destination es la pantalla a la que vamos.
            // "as?" intenta convertirla al tipo ViewControllerRegistro; si no lo es,
            // el resultado es nil (por eso vcd es opcional).
            let vcd = segue.destination as? ViewControllerRegistro
            // "?." (encadenamiento opcional): solo asigna el mensaje si vcd no es nil.
            vcd?.mensaje = "El usuario se quiere registrar"
        }

    }

}
