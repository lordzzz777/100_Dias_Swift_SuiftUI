//
//  OperatorOverloading.swift
//  KeyPoints
//
//  Created by Esteban Perez Castillejo on 6/9/24.
//

import Foundation

/// Cuando agregamos una conformidad personalizada a` Comparable`, necesitamos agregar un método llamado `<`. Esto, a su vez, permite a Swift comparar expresiones como `a < b`, que es lo que nos dio acceso a una versión de `sorted()` que no tomó parámetros.

/// Esto se llama sobrecarga del operador, y es lo que nos permite sumar dos enteros o unir dos cadenas usando el mismo operador `+`. Puede definir sus propios operadores si lo desea, pero también es fácil ampliar los operadores existentes para hacer cosas nuevas.

/// Como ejemplo, podríamos agregar algunas extensiones a `Int` que nos permitan multiplicar un `Int` y un `Double`, algo que Swift no permite por defecto, lo que puede ser molesto:

extension Int {
    static func *(lhs: Int, rhs: Double) -> Double {
        return Double(lhs) * rhs
    }
}

/// Presta especial atención a los parámetros: utiliza un Int como operando izquierdo y un Double como operando derecho, lo que significa que no funcionará si intercambias esos dos. Por lo tanto, si quieres estar completo, si quieres que cualquiera de los órdenes funcione, necesitas definir el método dos veces.

/// Sin embargo, si quieres ser realmente completo, entonces extender `Int` es la opción equivocada: deberíamos ir a un protocolo que envuelva `Int`, así como otros tipos de enteros como el `Int16` que usamos con Core Data. Swift pone todos los tipos de enteros en un solo protocolo llamado `BinaryInteger`, y si escribimos una extensión en eso, entonces Self (con una S mayúscula) se refiere a cualquier tipo específico que se esté utilizando. Entonces, si se usa en un `Int`, entonces `Self` significa `Int`, y si se usa en un `Int16`, entonces significa que en su lugar.

/// Aquí hay una extensión que agrega `*` entre cualquier tipo de entero y `double`, independientemente de si el entero está a la izquierda o a la derecha:

extension BinaryInteger {
    static func *(lhs: Self, rhs: Double) -> Double {
        return Double(lhs) * rhs
    }

    static func *(lhs: Double, rhs: Self) -> Double {
        return lhs * Double(rhs)
    }
}

/// Si te lo estabas preguntando, hay una razón por la que Swift no nos permite estos operadores: no se garantiza que sea tan preciso como podrías esperar. Como ejemplo simple, prueba esto:

let exampleInt: Int64 = 50_000_000_000_000_001
//print(exampleInt)

let result = exampleInt * 1.0
//print(String(format: "%.0f", result))


/// Eso crea un entero de 64 bits que contiene 50 cuatrillones y uno. Luego lo multiplica por el `Double` 1.0 usando nuestra extensión personalizada, lo que en teoría significa que el número que regresa debe ser idéntico al `Int`. Sin embargo, esa llamada `String(format:_:)` pide que el número se imprima sin decimales, y verás que no es lo mismo que el número entero: son 50 cuadrillones sin el 1. Ahora, podrías preguntar "qué es 1 cuando estás trabajando con 50 cuatrillones", y eso está bien, no estoy aquí para decirte lo que está bien y lo que está mal, solo para decir que si quieres una precisión absoluta debes evitar usar este tipo de métodos de ayuda.

/// En términos más generales, quiero darle una advertencia sobre la sobrecarga del operador. Cuando lo introduje en el proyecto 14, dije que la sobrecarga del operador "puede ser tanto una bendición como una maldición", y quiero hablar brevemente de por qué es así.

/// Considere un código como este:

/*
-----------------------------
let paul = User()
let swift = Language()

let result = paul + swift
-----------------------------
*/


/// ¿Qué tipo de datos es el resultado? Puedo pensar en varias posibilidades:

/// 1 .Tal vez sea otro objeto de `User`, ahora modificado para que tenga `Swift` en su variedad de idiomas conocidos.

/// 2 .Tal vez sea un objeto de programador que combina un usuario y un idioma.

/// 3 .Tal vez sea un remake extraño de la clásica película de terror The Fly.

/// El punto es que no lo sabemos, y realmente no podemos decirlo sin leer el código fuente para el operador + relevante.

/// Ahora considere este código:

/*
-----------------------------
 let paul = User()
 let swift = Language()
 paul.learn(swift)
-----------------------------
*/

/// Esto es mucho más claro, creo: ahora estamos ejecutando un método simple en un objeto, y probablemente adivinarías que estamos mutando a Paul para incluir Swift en la variedad de lenguajes de programación.

/// Cualquier buen desarrollador te dirá que la claridad es una de las características más importantes del código bien escrito: necesitamos dejar claro nuestro significado en lo que escribimos, porque se leerá docenas o cientos de veces en el futuro.

/// Por lo tanto, por supuesto, agregue la sobrecarga del operador a su arsenal de habilidades que puede implementar para resolver problemas, y de hecho entro en muchos más detalles sobre ellos en mi libro Pro Swift, pero siempre los uso con cuidado.


// MARK: Envolturas de propiedades personalizadas

/// Has visto que los envoltorios de propiedades son en realidad solo un juego de manos: toman un valor simple y lo envuelven en otro valor para que se pueda agregar alguna funcionalidad adicional. Esta podría ser la forma en que `SwiftUI` usa `@State` para almacenar valores en otro lugar, o cómo usa `@Environment` para leer valores de una fuente de datos compartida, pero el principio es el mismo: toma un valor simple y le da superpoderes de alguna manera.

/// Podemos usar envoltorios de propiedades en nuestro propio código, y hay muchas razones por las que podrías querer hacerlo. Al igual que con la sobrecarga del operador, entenderás más sobre cómo funcionan las cosas si las pruebas, pero también vale la pena usarlas cuidadosamente: si son lo primero que alcanzas, probablemente estés cometiendo un error.

/// Para demostrar las envolturas de propiedades, quiero comenzar con una estructura simple que envuelva algún tipo de valor `BinaryInteger`. Vamos a darle a esta cosa algún código personalizado cuando se trata de establecer su valor envuelto, de modo que si el nuevo valor está por debajo de 0, lo hacemos exactamente 0 para que esta estructura nunca pueda ser negativa.

/// Nuestro código tendría este aspecto:

/// Lo que los envoltorios de propiedades nos dejan hacer es usarlo para cualquier tipo de propiedad en una estructura o clase. Aún mejor, solo se necesita un paso: escribir `@propertyWrapper` antes de la estructura no negativa, así:

@propertyWrapper
struct NonNegative<Value: BinaryInteger> {
    var value: Value

    init(wrappedValue: Value) {
        if wrappedValue < 0 {
            value = 0
        } else {
            value = wrappedValue
        }
    }

    var wrappedValue: Value {
        get { value }
        set {
            if newValue < 0 {
                value = 0
            } else {
                value = newValue
            }
        }
    }
    
    
}


/// Ahora podemos crear eso con un número entero, pero si ese número entero cae por debajo de 0, entonces se sujetará a 0. Entonces, esto imprimirá 0:

var example = NonNegative(wrappedValue: 5)
//example.wrappedValue -= 10
//print(example.wrappedValue)

////  Eso es todo, ¡ahora tenemos nuestro propio envoltorio de propiedades!

/// En caso de que no hayas adivinado por su nombre, los envoltorios de propiedades solo se pueden usar en propiedades en lugar de variables o constantes simples, así que para probar el nuestro lo vamos a poner dentro de una estructura de `User` como esta:

struct User {
    @NonNegative var score = 0
}

/// Y ahora podemos crear un usuario y agregar o quitar puntos libremente, sabiendo con certeza que la puntuación nunca bajará de 0:

var user = User()
//user.score += 10
//print(user.score)

//user.score -= 20
//print(user.score)

/// Como puede ver, realmente no hay magia aquí: los envoltorios de propiedades no solo son solo azúcar sintáctica que hace que un dato se envuelva alrededor de otro, sino que también podemos hacerlos nosotros mismos si es necesario.

