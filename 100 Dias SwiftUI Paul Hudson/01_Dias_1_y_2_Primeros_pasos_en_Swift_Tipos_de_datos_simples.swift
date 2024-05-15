import Foundation

// MARK: - Primeros pasos en Swift, Tipos de datos simples

// variable
var edad: Int = 34 // Enteros
var nombre: String = "Juan" // Cadena de texto
var temperatura: Double = 20.5 // Double (Decimal)
var esVerano: Bool = true // tipo boolean

// constante de tipo double (decimal)
let pi: Double = 3.14159





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

/* 
Tu objetivo es escribir un patio de recreo de Swift que:

1. Crea una constante que mantiene cualquier temperatura en Celsius.
2. Lo convierte en Fahrenheit multiplicándolo por 9, dividiendo por 5 y luego sumando 32.
3. Imprime el resultado para el usuario, mostrando tanto los valores Celsius como Fahrenheit.
 
*/

/// Creo una constante donde guardo un valor de tipo entero en Celsius
let celsius = 100

/// Creo una variable donde almaceno la constante y realizo las operaciones para convertir a Fahrenheit
var result = celsius * 9 / 5 + 32

/// Imprimo el valor original de la constante en grados Celsius
print("Temperatura en grados Celsius es de \(celsius)º")

/// Imprimo el valor del resultado guardado en la variable en grados Fahrenheit
print("Temperatura en grados Fahrenheit es de \(result)º")