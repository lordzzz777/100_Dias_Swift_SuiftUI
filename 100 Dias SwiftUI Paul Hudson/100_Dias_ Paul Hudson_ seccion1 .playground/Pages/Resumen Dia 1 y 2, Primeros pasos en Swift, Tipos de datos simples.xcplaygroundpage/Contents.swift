import Foundation

/// ## -------------------- 100 días Paul Hudson --------------------

// MARK: - Primeros pasos en Swift, Tipos de datos simples

/// SwiftUI es un potente marco para crear aplicaciones interactivas para iOS, macOS, tvOS e incluso watchOS. Sin embargo, no puedes crear software sin un lenguaje de programación, por lo que detrás de SwiftUI se encuentra Swift: un lenguaje de programación potente, flexible y moderno que utilizarás para todas tus aplicaciones SwiftUI.

/// Como dijo Mark Twain una vez: "El secreto para salir adelante es empezar". Bueno, estás empezando ahora, así que vamos a sumergirnos y aprender sobre variables, constantes y tipos de datos simples en Swift.


/// En Swift, una variable es un contenedor que puede almacenar datos que pueden cambiar durante la ejecución de un programa. Se declaran con la palabra clave var y pueden contener diferentes tipos de datos, como enteros, flotantes, cadenas, etc. Por ejemplo:

var edad: Int = 34

/// Una constante, por otro lado, es similar a una variable pero su valor no puede cambiar una vez que se asigna. Se declaran con la palabra clave let. Son útiles cuando tienes valores que no deben cambiar a lo largo del tiempo. Por ejemplo:

let pi: Double = 3.14159

/// Los tipos de datos simples en Swift incluyen enteros (Int), flotantes (Float o Double), cadenas (String), booleanos (Bool), entre otros. Cada tipo de dato tiene un rango de valores y operaciones específicas que se pueden realizar con ellos. Por ejemplo:

var nombre: String = "Juan"
var temperatura: Double = 20.5
var esVerano: Bool = true

/// Comprender cómo trabajar con variables, constantes y tipos de datos simples es fundamental para la programación en Swift, ya que te permite almacenar y manipular datos de manera efectiva dentro de tus aplicaciones.


// MARK: - Tipos de datos simples, Resumen Dias 1 y 2

/// Swift nos permite crear constantes usando let, y variables usando var.
/// Si no tienes la intención de cambiar un valor, asegúrate de usar let para que Swift pueda ayudarte a evitar errores.
/// Las cadenas de Swift contienen texto, desde cadenas cortas hasta novelas completas. Funcionan muy bien con emojis y cualquier idioma del mundo, y tienen funcionalidades útiles como count y uppercased().
/// Creas cadenas usando comillas dobles al principio y al final, pero si quieres que tu cadena abarque varias líneas, necesitas usar tres comillas dobles al principio y al final.
/// Swift llama a sus números enteros números enteros y pueden ser positivos o negativos. También tienen funcionalidades útiles, como isMultiple(of:).
/// En Swift, los números decimales se llaman Double, abreviatura de número de punto flotante de doble precisión. Eso significa que pueden contener números muy grandes si es necesario, pero tampoco son 100% precisos; no deberías usarlos cuando se requiere una precisión del 100%, como al tratar con dinero.
/// Hay muchos operadores aritméticos integrados, como +, -, *, y /, junto con los operadores de asignación compuesta especiales, como +=, que modifican las variables directamente.
/// Puedes representar un estado simple de verdadero o falso usando un booleano, que se puede invertir usando el operador ! o llamando a toggle().
/// La interpolación de cadenas nos permite colocar constantes y variables en nuestras cadenas de manera simplificada y eficiente.
/// ¡Es mucho, ¿verdad? Y está bien, estarás usando todo de esa lista una y otra vez mientras construyes aplicaciones, hasta que eventualmente lo entenderás todo sin necesidad de consultar aquí.

// Algunos ejemplos:

// Creación de una variable usando 'var'
var score = 100

// Utilización de cadenas en Swift
let message = "¡Hola, mundo!"

// Utilización de la función 'uppercased()' en una cadena
let uppercaseMessage = message.uppercased()


var playerName = "Javier"
var playerScore = 150
// Utilización de la interpolación de cadenas para incluir variables
let finalMessage = "El jugador \(playerName) ha obtenido \(playerScore) puntos."

// Creación de una variable booleana y uso del operador '!'
var isLoggedIn = false
isLoggedIn = !isLoggedIn // Cambio de estado utilizando el operador '!'

// Uso de la función 'toggle()' en una variable booleana
var isOn = true
isOn.toggle() // Invertir el estado utilizando 'toggle()'



// MARK: - Reto 1

/// Tu objetivo es escribir un patio de recreo de Swift que:

/// 1 .Crea una constante que mantiene cualquier temperatura en Celsius.

/// 2. Lo convierte en Fahrenheit multiplicándolo por 9, dividiendo por 5 y luego sumando 32.

/// 3. Imprime el resultado para el usuario, mostrando tanto los valores Celsius como Fahrenheit.


/// Creo una constante donde guardo un valor de tipo entero en Celsius
let celsius = 100

/// Creo una variable donde almaceno la constante y realizo las operaciones para convertir a Fahrenheit
var result = celsius * 9 / 5 + 32

/// Imprimo el valor original de la constante en grados Celsius
print("Temperatura en grados Celsius es de \(celsius)º")

/// Imprimo el valor del resultado guardado en la variable en grados Fahrenheit
print("Temperatura en grados Fahrenheit es de \(result)º")
