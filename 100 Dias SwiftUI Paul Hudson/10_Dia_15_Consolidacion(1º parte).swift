import Foundation

// Creación de constantes y variables

// variables son contenedores que pueden cambiar a lo largo del codigo 
var name = "Pedro"
print(name) // imprime su nombre almacenado

name = "Francisco" // el valor de la variavle name, cambia
print(name) // imprime su nombre almacenado

// las contante son parecidas pero, el valor que se le añada no cambia 

// si intentamos cambiar el valor de names, swift, no lo permite
let names = "Juan"
print(names) // imprime su nombre almacenado



// valor de cadena de texto
let typeData1 = "Hola mundo" 

let typeData1B = """
                 Un día en
                 La vida de un
                 Ingeniero de Apple
                """
// Swift proporciona muchas propiedades y métodos útiles para las cadenas, 
// incluyendo .count para leer cuántas letras tiene:

print(typeData1B.count)// cuanta los caracteres del String

// También hay hasPrefix() y hasSuffix(), que nos permiten saber si una 
// cadena comienza o termina con letras específicas:

print(typeData1.hasPrefix("Hola"))// muestra la primera palabra
print(typeData1.hasSuffix("mundo"))// muestra el ultima palabra

// Importante: Las cadenas distinguen entre mayúsculas y minúsculas en Swift, 
// por lo que la segunda comprobación devolverá false.



// volor de enteros
let typeData2 = 100

// Operadores matematicos
 let score = typeData2 + 10 // operadore aricmetico de suma
 let score2 = typeData2 - 10 // operadore aricmetico de resta
 let score3 = typeData2 / 10 // operadore aricmetico de division
 

// También admite operadores de asignación compuesta que modifican variables en su lugar:

var contador = 10
contador += 5
// Los enteros vienen con su propia funcionalidad útil, como el método isMultiple(of:):

let número = 120
print(número.isMultiple(of: 3))
// También puedes generar enteros aleatorios en un rango específico, así:

let id = Int.random(in: 1...1000)
Decimales
// Si creas un número con un punto decimal, Swift lo considerará un Double:

let puntuación = 3.0

// Swift considera Double como un tipo de datos completamente diferente a Int, 
// y no te permitirá mezclarlos.

Booleanos
// Swift utiliza el tipo Bool para almacenar verdadero o falso:

let buenosPerros = true
let juegoTerminado = false

// Puedes cambiar un booleano de verdadero a falso llamando a su método toggle():

var estáGuardado = false
estáGuardado.toggle()




// ---------- Uniendo cadenas -----------

// Puedes crear cadenas a partir de otros datos utilizando interpolación de cadenas: 
// escribe una barra diagonal dentro de tu cadena, luego coloca el nombre de una variable
// o constante dentro de paréntesis, como esto:

let nombre = "Taylor"
let edad = 26
let mensaje = "Me llamo \(nombre) y tengo \(edad) años."
print(mensaje)

// Cuando se ejecuta ese código, imprimirá "Me llamo Taylor y tengo 26 años".



// --------- Arrays -------------

// Puedes agrupar elementos en un array de esta manera:

var colores = ["Rojo", "Verde", "Azul"]
let números = [4, 8, 15, 16]
var mediciones = [0.1, 0.5, 0.8]

// Cada uno de ellos contiene diferentes tipos de datos: uno cadenas, uno enteros 
// y uno decimales. Cuando leemos datos de arrays, obtendremos el tipo apropiado: 
// una String, un Int o un Double:

print(colores[0])
print(mediciones[2])

// Consejo: Asegúrate de que un elemento exista en el índice que estás solicitando, 
// de lo contrario tu código se bloqueará: tu aplicación simplemente dejará de funcionar.
// Si tu array es variable, puedes usar append() para agregar nuevos elementos:

colores.append("Tartán")

// El tipo de datos que agregues debe coincidir con lo que ya estaba allí.
// Los arrays tienen funcionalidad útil, como .count para leer cuántos elementos hay en un 
// array, o remove(at:) para eliminar un elemento en un índice específico:

colores.remove(at: 0)
print(colores.count)

// Puedes verificar si un array contiene un elemento en particular usando contains(), así:

print(colores.contains("Octarina"))
Diccionarios

// Los diccionarios almacenan múltiples valores según una clave que especificamos. Por ejemplo, 
// podríamos crear un diccionario para almacenar información sobre una persona:

let empleado = [
    "nombre": "Taylor",
    "trabajo": "Cantante"
]
// Para leer datos del diccionario, utiliza las mismas claves que utilizaste al crearlo:

print(empleado["nombre", default: "Desconocido"])
print(empleado["trabajo", default: "Desconocido"])

// El valor predeterminado se utilizará si la clave que hemos solicitado no existe.



// ---------- Conjuntos ----------

// Los conjuntos son similares a los arrays, excepto que no puedes agregar elementos duplicados 
// y no almacenan elementos en un orden particular.
// Esto hace un conjunto de números:

var números = Set([1, 1, 3, 5, 7])
print(números)

// Recuerda, el conjunto ignorará los valores duplicados y no recordará el orden utilizado en el array.
// Agregar elementos a un conjunto se realiza llamando a su método insert(), así:

números.insert(10)

// Los conjuntos tienen una gran ventaja sobre las matrices: el uso de contains() en un conjunto
// es efectivamente instantáneo, sin importar cuántos elementos contenga el conjunto, incluso un 
// conjunto con 10 000 000 de elementos responderá al instante.


// ---------- Enums ---------- 

// Un enum es un conjunto de valores nombrados que podemos crear y usar para hacer nuestro código 
// más eficiente y seguro. Por ejemplo, podríamos hacer un enum de días de la semana así:

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

// Eso llama al nuevo enum Weekday y proporciona cinco casos para manejar los cinco días laborales.
// Ahora podemos hacer instancias de ese enum y luego asignarle otros casos posibles:

var day = Weekday.monday
day = .friday

// Anotaciones de tipo 
// Puedes intentar forzar un tipo específico para una nueva variable o constante usando 
// anotaciones de tipo así:

var score: Double = 0

// Sin la parte : Double, Swift inferiría que es un Int, pero estamos anulando eso 
// y diciendo que es un Double.

// Aquí hay algunas anotaciones de tipo basadas en los tipos cubiertos hasta ahora:

let player: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isEnabled: Bool = true
var albums: Array<String> = ["Red", "Fearless"]
var user: Dictionary<String, String> = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

// Los arrays y diccionarios son tan comunes que tienen una sintaxis especial que es
// más fácil de escribir:

var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]

// Conocer los tipos exactos de las cosas es importante para crear colecciones vacías. 
// Por ejemplo, ambos crean arrays de cadenas vacíos:

var teams: [String] = [String]()
var clues = [String]()

// Los valores de un enum tienen el mismo tipo que el enum mismo, 
// así que podríamos escribir esto:

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = .light

