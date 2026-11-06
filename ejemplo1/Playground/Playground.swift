// "import" trae a nuestro código las herramientas de un módulo (librería).
// Playgrounds nos permite usar la macro #Playground para ver resultados al instante.
import Playgrounds

// MARK: - Tipos (protocolos, clases y enums)
// Los protocolos no se pueden declarar dentro de un bloque como #Playground { },
// por eso estos tipos viven aquí arriba, a nivel de archivo, y se usan más abajo.

// PROTOCOLOS
// Un protocolo es como un "contrato": define qué propiedades y métodos
// debe tener cualquier tipo que lo adopte, pero no cómo se implementan.
protocol Describible {
    // { get set } indica que la propiedad debe poder leerse y modificarse.
    var modelo: Int { get set }
    func describir() -> String
}

// ENUMS
// Un enum (enumeración) define un grupo cerrado de opciones posibles.
// Una variable de tipo Costo solo puede tener uno de estos valores.
enum Costo {
    case desconocido
    case bajo
    case medio
    case alto
}

// Clase base (padre). Las clases que hereden de ella tendrán estas propiedades.
class Transporte {
    var tiempo: String = ""
    var costo: Costo = Costo.desconocido
}

// CLASES
// Una clase es un "molde" para crear objetos con propiedades (datos)
// y métodos (funciones).
// ": Transporte, Describible" significa que auto_clase HEREDA de la clase
// Transporte (recibe sus propiedades) y CUMPLE el protocolo Describible.
class auto_clase: Transporte, Describible {
    // Propiedades: los datos que tendrá cada auto.
    var marca: String
    var color: String
    var ocupantes: Int
    var modelo: Int

    // Método inicial
    // "init" es el inicializador: se ejecuta al crear un objeto nuevo
    // y debe dar un valor a todas las propiedades que no tengan uno.
    init(color: String, ocupantes: Int) {
        // "self" se refiere al objeto actual. Se usa para distinguir
        // la propiedad (self.color) del parámetro (color).
        self.marca = "Toyota"
        self.color = color
        self.ocupantes = ocupantes
        self.modelo = 2026
    }

    // Este método es obligatorio porque lo exige el protocolo Describible.
    func describir() -> String {
        return "Auto creado: \(self.marca), \(color), con capacidad de \(ocupantes) ocupantes."
    }

    // Método propio de la clase: imprime la descripción en lugar de devolverla.
    func descripcion() {
        print("Auto creado: \(self.marca), \(color), con capacidad de \(ocupantes) ocupantes.")
    }
}

// NUEVO: STRUCTS
// Un struct se parece a una clase, pero es un tipo por VALOR:
// al asignarlo a otra variable se crea una COPIA independiente.
// Además, Swift le genera automáticamente un init con todas sus propiedades.
struct AutoStruct {
    var marca: String
    var color: String
}

// MARK: - Ejemplos

// Todo lo que esté dentro de #Playground { ... } se ejecuta y muestra sus
// resultados en el canvas de Xcode, ideal para experimentar y aprender.
#Playground {
    // MARK: Opcionales
    // Un "opcional" (se escribe con ? después del tipo, ej. Int?) es una variable
    // que puede tener un valor... o no tener nada (nil).

    // "var" declara una variable (su valor puede cambiar).
    // ": String" indica el tipo de dato: texto.
    var possibleNumber: String = "2"
    // Int(texto) intenta convertir un texto en número entero.
    // Como la conversión puede fallar (ej. "hola" no es número),
    // el resultado es un Int? (opcional): un número o nil.
    var convertedNumber: Int? = Int(possibleNumber)
    // type(of:) te dice de qué tipo es una variable. Descoméntalo para probar.
    // type(of: possibleNumber)
    // type(of: convertedNumber)

    // MARK: Optional Binding
    // "if let" revisa si el opcional tiene valor. Si lo tiene, lo "desenvuelve"
    // y lo guarda en una constante normal (n) que solo existe dentro de las llaves.
    if let n = convertedNumber {
        // Aquí n ya es un Int normal (no opcional), así que podemos operar con él.
        print(n * 10)
    }
    /* else {
        // El bloque "else" se ejecutaría si convertedNumber fuera nil.
        print("convertedNumber: \(convertedNumber), no es un numero valido")
    } */

    // NUEVO: Operador ?? (nil-coalescing)
    // Da un valor por defecto cuando el opcional es nil.
    // Es una forma corta de desenvolver sin usar "if let".
    let textoInvalido = "hola"
    let numeroSeguro: Int = Int(textoInvalido) ?? 0   // "hola" no es número -> 0
    print("Número seguro: \(numeroSeguro)")

    // NUEVO: let vs var
    // "let" crea una constante: una vez asignada, NO puede cambiar.
    // Usa "let" siempre que puedas y "var" solo cuando el valor deba cambiar.
    let pi = 3.1416
    // pi = 3          // ❌ Error: no se puede modificar una constante.
    possibleNumber = "5"   // ✅ Se puede, porque es "var".
    print(pi, possibleNumber)

    // MARK: Ciclado
    // "while let" repite el bloque mientras el opcional tenga valor.
    // ¡Cuidado! Si el valor nunca cambia a nil, el ciclo sería infinito.
    // while let opt = convertedNumber {
    //     print(opt + 1)
    // }

    // MARK: Funciones
    // "func" define una función: un bloque de código reutilizable.
    // Cada parámetro tiene una etiqueta externa (la que se usa al llamar)
    // y un nombre interno (el que se usa dentro de la función):
    //   _ arg1  -> el guion bajo significa "sin etiqueta" al llamarla.
    //   b arg2  -> al llamarla se escribe "b:", pero dentro se usa "arg2".
    // "-> Int" indica que la función devuelve un número entero.
    func suma(_ arg1: Int, b arg2: Int) -> Int {
        // "return" devuelve el resultado a quien llamó la función.
        return arg1 + arg2
    }

    // Llamamos la función: el primer argumento va sin etiqueta y el segundo con "b:".
    print(suma(2, b: 2))

    // MARK: For in
    // [Int] es un arreglo (lista) de enteros.
    var arr: [Int] = [1, 2, 3, 4]
    // "for el in arr" recorre el arreglo; en cada vuelta "el" toma el siguiente elemento.
    for el in arr {
        // "switch" compara un valor contra varios casos posibles.
        switch el {
        // 1...3 es un rango cerrado: incluye 1, 2 y 3.
        case 1...3:
            print(el * 2)
            // En Swift el "break" no es obligatorio: un case no "cae" al siguiente.
            break
        // "default" atrapa cualquier valor que no coincidió con los casos anteriores.
        default:
            print(el * 20)
            break
        }
    }

    // Arreglo de textos ([String]).
    var arrStr: [String] = ["UNO", "DOS", "TRES"]
    for el in arrStr {
        // switch también funciona con textos.
        switch el {
        case "UNO":
            print("uno")
        default:
            print("otro")
        }
    }

    // NUEVO: For in con rangos
    // También puedes repetir algo un número fijo de veces usando un rango.
    for i in 1...3 {
        print("Vuelta número \(i)")
    }

    // MARK: Switch Ex1
    // Ejemplo típico de videojuego: según la acción, se muestra un mensaje distinto.
    var action = "sleeping"

    switch action {
    case "jump":
        print("character is jumping")
    case "walk":
        print("character is walking")
    case "run":
        print("character is running")
    // Como "sleeping" no coincide con ningún caso, se ejecuta default.
    default:
        print("character is waiting for you")
    }

    // MARK: Switch Ex2
    // "let" declara una constante (su valor NO puede cambiar).
    // Character es un solo carácter (una letra, número o símbolo).
    let character: Character = "b"

    switch character {
    // Un case puede tener varios valores separados por comas.
    case "a", "e", "i", "o", "u":
        print("El caracter es una vocal")
    case "b", "c", "d", "f", "g":
        print("El caracter pertenece a una consonante")
    default:
        print("El caracter no pertenece ni a una vocal ni a una consonante")
    }

    // MARK: Switch Ex3
    // arc4random_uniform(50) genera un número aleatorio entre 0 y 49.
    // 1..<10 es un rango semiabierto: incluye 1 pero NO incluye 10.
    // let n = arc4random_uniform(50)
    //
    // switch n {
    // case 0:
    //     print("CERO")
    // case 1..<10:
    //     print("MENOR DE 10")
    // case 10..<20:
    //     print("MENOR DE 20")
    // default:
    //     print("OTRO")
    // }

    // MARK: Guard
    // "guard" es como un "if" al revés: verifica que algo se cumpla y,
    // si NO se cumple, obliga a salir de la función (con return) en el else.
    // Es útil para validar datos al inicio y evitar muchos "if" anidados.
    // [String: String] es un diccionario: guarda pares clave -> valor, ambos de texto.
    func greet(person: [String: String]) {
        // Buscar una clave en un diccionario devuelve un opcional,
        // porque la clave podría no existir.
        guard let name = person["name"] else {
            // Si no hay "name", salimos de la función sin hacer nada más.
            return
        }

        // A partir de aquí "name" está disponible y ya no es opcional.
        print("Hello \(name)")

        guard let location = person["location"] else {
            print("I hope the weather is nice")
            return
        }

        // \( ) dentro de un texto inserta el valor de una variable (interpolación).
        print("I hope the weather is nice in \(location)")
    }

    // Llamamos la función pasando un diccionario con nombre y ubicación.
    greet(person: ["name": "Salvador", "location": "Mexico"])

    // MARK: Closures
    // Un closure es una función sin nombre que se puede guardar en una
    // variable o pasar como parámetro. Aquí comparamos ambas formas.

    // Forma 1: función normal.
    func saludar2(nombre: String) -> String {
        return "Hola \(nombre)"
    }

    // Forma 2: closure guardado en una constante.
    // (String) -> String es su tipo: recibe un String y devuelve un String.
    // La palabra "in" separa los parámetros del cuerpo del closure.
    let saludar: (String) -> String = { (nombre: String) -> String in
        return "Hola, \(nombre)"
    }

    // Las funciones usan etiqueta (nombre:); los closures se llaman sin etiqueta.
    print(saludar2(nombre: "Jose"))
    print(saludar("Jose"))

    let numeros = [1, 2, 3, 4]
    // "map" aplica un closure a cada elemento y crea un nuevo arreglo.
    // $0 es una forma corta de referirse al primer parámetro del closure.
    // Resultado: [2, 4, 6, 8]
    let dobles = numeros.map { $0 * 2 }

    // NUEVO: filter
    // "filter" se queda solo con los elementos que cumplen la condición.
    // Resultado: [2, 4]
    let pares = numeros.filter { $0 % 2 == 0 }
    print(dobles, pares)

    // MARK: Clases - Ej. copia por referencia
    // Creamos objetos (instancias) de la clase llamando a su init.
    var auto1 = auto_clase(color: "Gris", ocupantes: 5)
    auto1.modelo = 2026
    var auto2 = auto_clase(color: "Amarillo", ocupantes: 2)
    /* var auto1 = auto_clase()
       auto1.marca = "nissan"
       auto1.color = "Amarillo"
       auto1.ocupantes = 8 */

    // Un arreglo también puede guardar objetos.
    var autos = [auto1, auto2]

    for a in autos {
        a.descripcion()
    }

    // IMPORTANTE: las clases son tipos por REFERENCIA.
    // auto3 no es una copia: auto1 y auto3 apuntan al MISMO objeto.
    // Por eso, al cambiar el color de auto3, también cambia el de auto1.
    var auto3 = auto1
    auto3.color = "Negro"
    // "costo" y "tiempo" vienen heredados de la clase Transporte.
    auto3.costo = Costo.bajo
    auto3.tiempo = "3 horas"

    // append agrega un elemento al final del arreglo.
    autos.append(auto3)
    for a in autos {
        a.descripcion()
    }

    // NUEVO: Struct - Ej. copia por valor
    // Comparado con la clase: aquí autoB SÍ es una copia independiente,
    // así que cambiar autoB no afecta a autoA.
    let autoA = AutoStruct(marca: "Nissan", color: "Rojo")
    var autoB = autoA
    autoB.color = "Azul"
    print("autoA: \(autoA.color), autoB: \(autoB.color)")   // autoA: Rojo, autoB: Azul

    // NUEVO: Switch con enums
    // Con un enum, switch puede cubrir TODOS los casos posibles,
    // así que no hace falta "default". Si agregas un caso nuevo al enum,
    // Swift te avisará de que falta manejarlo aquí.
    // ".bajo" es la forma corta de escribir "Costo.bajo".
    switch auto3.costo {
    case .desconocido:
        print("Costo desconocido")
    case .bajo:
        print("Viaje barato")
    case .medio:
        print("Viaje de precio medio")
    case .alto:
        print("Viaje caro")
    }
}
