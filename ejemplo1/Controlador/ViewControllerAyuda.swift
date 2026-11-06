//
//  ViewControllerAyuda.swift
//  ejemplo1
//
//  Created by Salvador Lopez on 05/11/26.
//

import UIKit

// Pantalla de "Ayuda": muestra la imagen de la fruta que el usuario eligió
// en la tabla de ViewControllerFAQs.
class ViewControllerAyuda: UIViewController {

    // Conexión con el UIImageView del storyboard (el contenedor de la imagen).
    @IBOutlet weak var frutasImgView: UIImageView!

    // Nombre de la fruta seleccionada. Tiene un valor por defecto ("otro_img"),
    // pero ViewControllerFAQs lo reemplaza antes de mostrar esta pantalla.
    var itemSelected = "otro_img"


    // Se ejecuta una vez cuando la vista se carga en memoria.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // viewDidAppear se ejecuta CADA vez que la pantalla termina de aparecer
    // (a diferencia de viewDidLoad, que solo corre una vez).
    override func viewDidAppear(_ animated: Bool) {
        // UIImage(named:) busca una imagen en Assets.xcassets por su nombre.
        // Con interpolación "\(...)_img" formamos el nombre, por ejemplo:
        // "manzana" -> "manzana_img". Si la imagen no existe, devuelve nil
        // y el UIImageView se queda vacío.
        self.frutasImgView.image = UIImage(named: "\(itemSelected)_img")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
