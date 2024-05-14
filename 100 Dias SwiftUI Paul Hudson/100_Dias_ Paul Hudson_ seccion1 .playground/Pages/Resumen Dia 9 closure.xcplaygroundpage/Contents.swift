import Foundation


// MARK: - Dia 9, Closures

/// ¿Que es un cierre ?

/// Un cierre en Swift es una pieza de código autocontenido que puede ser pasada y utilizada en tu código. Funciona como una función anónima o bloque de código que puedes almacenar y pasar alrededor de tu código como si fuera un objeto.

/// Para comprender mejor los cierres en Swift, aquí hay algunos conceptos clave que pueden ayudarte:


/// 1. - Sintaxis de cierre: Un cierre en Swift tiene una sintaxis compacta y flexible. Puede ser escrito utilizando llaves {}, parámetros y un cuerpo de código. Por ejemplo:

/*
{ (parámetros) -> TipoDeRetorno in
    // Cuerpo del cierre
}
*/


/// 2. - Captura de valores: Los cierres en Swift pueden capturar y almacenar referencias a variables y constantes del contexto circundante en el que fueron creados. Esto significa que los cierres pueden acceder y modificar valores fuera de su alcance. Por ejemplo:

var valorExterno = 10
let miCierre = {
    valorExterno += 1
    print(valorExterno)
}

miCierre() // Output: 11

/// Trailing Closures: Swift permite escribir cierres como bloques finales fuera de los paréntesis cuando es el último argumento de una función. Esto mejora la legibilidad del código. Por ejemplo:

func someFunction(closure: () -> Void) {
    // Código de la función
}

// Llamada a la función con trailing closure
someFunction() {
    // Código del cierre
}



/// 3. - Uso de cierres: Los cierres en Swift pueden ser pasados como argumentos a funciones y métodos, y también pueden ser devueltos desde funciones. Esto los hace útiles para realizar tareas como ordenamiento de colecciones, manejo de eventos, y mucho más. Por ejemplo:

func operar(_ a: Int, _ b: Int, operacion: (Int, Int) -> Int) -> Int {
    return operacion(a, b)
}

let suma = operar(5, 3) { $0 + $1 } // Utilizando un cierre con sintaxis de parámetros abreviada
print(suma) // Output: 8


/// Los cierres son una característica poderosa de Swift que te permite escribir código más flexible y conciso. Comprender cómo funcionan y cómo usarlos puede mejorar significativamente tu habilidad para escribir código limpio y eficiente en Swift.


/// *** RESUMEN :

/// Hemos cubierto mucho sobre los cierres en los capítulos anteriores, así que hagamos un resumen:

/// Puedes copiar funciones en Swift, y funcionan igual que el original excepto que pierden sus nombres de parámetros externos.

/// Todas las funciones tienen tipos, al igual que otros tipos de datos. Esto incluye los parámetros que reciben junto con su tipo de retorno, que podría ser Void, también conocido como "nada".

/// Puedes crear cierres directamente asignándolos a una constante o variable.

/// Los cierres que aceptan parámetros o devuelven un valor deben declarar esto dentro de sus llaves, seguido de la palabra clave in.

/// Las funciones pueden aceptar otras funciones como parámetros. Deben declarar de antemano exactamente qué datos deben usar esas funciones, y Swift se asegurará de que se sigan las reglas.

/// En esta situación, en lugar de pasar una función dedicada, también puedes pasar un cierre, puedes crear uno directamente. Swift permite que ambos enfoques funcionen.

/// Al pasar un cierre como parámetro de una función, no necesitas escribir explícitamente los tipos dentro de tu cierre si Swift puede deducirlo automáticamente. Lo mismo es cierto para el valor de retorno, si Swift puede deducirlo, no necesitas especificarlo.

/// Si uno o más de los parámetros finales de una función son funciones, puedes usar la sintaxis de cierre final.

/// También puedes usar nombres de parámetros abreviados como $0 y $1, pero recomendaría hacerlo solo bajo ciertas condiciones.

/// Puedes crear tus propias funciones que acepten funciones como parámetros, aunque en la práctica es mucho más importante saber cómo usarlas que cómo crearlas.

/// De todas las partes del lenguaje Swift, diría que los cierres son lo más difícil de aprender. No solo la sintaxis es un poco difícil al principio para los ojos, sino que el concepto mismo de pasar una función a una función lleva un poco de tiempo asimilar.

/// Entonces, si has leído estos capítulos y sientes que tu cabeza está a punto de explotar, eso es genial: ¡significa que estás a medio camino de entender los cierres!

// Ejemplos de código:

// Creación de un cierre directamente
let miCierre1 = { (numero: Int) -> Int in
    return numero * 2
}

// Uso del cierre
let resultado2 = miCierre1(5) // Output: 10



// MARK: - Reto 5



/// Con los cierres en tu haber, es hora de probar un pequeño desafío de codificación usándolos.

/// Ya has conocido a sorted(), filter(), map(), así que me gustaría que los juntaras en una cadena: llama a uno, luego al otro, luego al otro espalda con espalda sin usar variables temporales.

/// Su opinión es la siguiente:

/// Let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

/// Tu trabajo es:

/// 1. Filtra cualquier número que sea par

/// 2. Ordenar la matriz en orden ascendente

/// 3. Asignarlos a cadenas en el formato "7 es un número de la suerte"

/// 4. Imprima la matriz resultante, un elemento por línea




let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Filtrar números pares, ordenar en orden ascendente y asignar a cadenas
let resultado3 = luckyNumbers
    .filter { $0 % 2 == 0 }
    .sorted()
    .map { "\($0) es un número de la suerte" }

// Imprimir la matriz resultante
for numero in resultado3 {
    print(numero)
}
