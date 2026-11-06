// Foundation trae tipos básicos como String, Locale, fechas, etc.
import Foundation

// "extension" agrega nuevas funcionalidades a un tipo que ya existe,
// sin modificar su código original. Aquí le agregamos algo nuevo a String.
extension String {
    // Propiedad calculada (computed property): no guarda un valor, lo calcula
    // cada vez que se consulta. Ejemplo de uso: "Anita lava la tina".isPalindrome
    // Un palíndromo se lee igual de izquierda a derecha que al revés.
    var isPalindrome: Bool {
        // "self" es el propio texto sobre el que se llama la propiedad.
        let text = self
            // folding "normaliza" el texto: quita acentos (diacriticInsensitive)
            // y convierte mayúsculas/minúsculas a una misma forma (caseInsensitive).
            // Así "Á" y "a" se consideran iguales.
            .folding(options: [.diacriticInsensitive, .caseInsensitive],
                     locale: Locale(identifier: "es_MX"))
            // filter se queda solo con letras y números (elimina espacios y signos).
            .filter { $0.isLetter || $0.isNumber }

        // Es palíndromo si el texto no está vacío ("!" = negación) Y ("&&")
        // es igual a su versión invertida.
        return !text.isEmpty && text == String(text.reversed())
    }
}
