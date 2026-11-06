//
//  ViewControllerFAQs.swift
//  ejemplo1
//
//  Created by Salvador Lopez on 05/11/26.
//

import UIKit

// Pantalla de FAQs que muestra una lista (tabla) de frutas.
// Además de heredar de UIViewController, ADOPTA dos protocolos:
// - UITableViewDelegate: para responder a acciones del usuario (ej. tocar una fila).
// - UITableViewDataSource: para darle a la tabla los datos que debe mostrar.
class ViewControllerFAQs: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Conexión con la tabla del storyboard.
    @IBOutlet weak var tablaFaqs: UITableView!

    // Arreglos con los datos de la tabla. La posición (índice) de cada fruta
    // corresponde a la posición de sus kilocalorías: frutas[0] -> kcal[0], etc.
    var frutas = ["manzana","sandia","mango","naranja","toronja"]
    var kcal = [4,5,6,5,3]



    override func viewDidLoad() {
        super.viewDidLoad()
        // Le decimos a la tabla que ESTA clase (self) será su delegado y su fuente
        // de datos. Sin estas dos líneas, la tabla no llamaría a los métodos de abajo.
        self.tablaFaqs.delegate = self
        self.tablaFaqs.dataSource = self

        // Código de ejemplo (comentado) para incrustar otra pantalla como "hija"
        // dentro de esta, usando un UINavigationController.
        //let main = UIStoryboard(name: "Main", bundle: nil)
        //let vcd = main.instantiateViewController(withIdentifier: "vc_ayuda")

    //let nav = UINavigationController(rootViewController: vcd)

               //addChild(nav)                          // 1. registrar como hijo
               //view.addSubview(nav.view)              // 2. agregar su vista
               //nav.view.frame = view.bounds           // o usar Auto Layout
               //nav.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
               //nav.didMove(toParent: self)            // 3. terminar la relación

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: METODOS DE LA TABLA (DELEGATE)

    // Se ejecuta cuando el usuario toca una fila de la tabla.
    // indexPath indica qué fila se tocó (sección y número de fila).
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("El usuario a seleccionado la fruta: \(frutas[indexPath.item])")
        // Obtenemos una referencia al storyboard llamado "Main" (Main.storyboard).
        let main = UIStoryboard(name: "Main", bundle: nil)
        // Creamos la pantalla de Ayuda a partir de su "Storyboard ID" ("vc_ayuda").
        // "if let ... as?" verifica que realmente sea un ViewControllerAyuda.
        if let vcd = main.instantiateViewController(withIdentifier: "vc_ayuda") as? ViewControllerAyuda {
            // Alternativa: empujarla en la navegación (push) en lugar de modal.
            //self.navigationController?.pushViewController(vcd, animated: true)

            // Le pasamos la fruta seleccionada a la siguiente pantalla.
            vcd.itemSelected = frutas[indexPath.item]
            // Mostramos la pantalla de forma modal. El closure se ejecuta
            // cuando termina la animación de aparición.
            self.present(vcd, animated: true){
                print("ok")
            }
        }

    }

    // MARK: METODOS DE LA TABLA (DATA SOURCE)

    // Texto del encabezado de cada sección.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Frutas"
    }

    // Cuántas secciones (grupos) tiene la tabla.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Cuántas filas tiene cada sección.
    // Nota: está fijo en 5; usar frutas.count se ajustaría solo si cambia el arreglo.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    // Construye la celda que se mostrará en cada fila.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueReusableCell REUTILIZA celdas que salieron de la pantalla en lugar
        // de crear nuevas, lo que ahorra memoria. "cell_faqs" es el identificador
        // de la celda prototipo definida en el storyboard.
        let cell = self.tablaFaqs.dequeueReusableCell(withIdentifier: "cell_faqs")

        // textLabel es el texto principal y detailTextLabel el texto secundario.
        cell?.textLabel?.text = frutas[indexPath.item]
        cell?.detailTextLabel?.text = "Kilo calorias \(kcal[indexPath.item])"

        // "!" fuerza a desenvolver el opcional: si la celda fuera nil, la app fallaría.
        return cell!
    }

}
