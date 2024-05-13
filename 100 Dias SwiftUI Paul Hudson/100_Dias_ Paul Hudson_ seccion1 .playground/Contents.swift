import Foundation

/// ## -------------------- 100 días Paul Hudson --------------------

// MARK: - Primeros pasos en Swift, Tipos de datos simples, parte 1

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

// Utilización de la interpolación de cadenas para incluir variables
let playerName = "Javier"
let playerScore = 150
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



// MARK: Tipos de datos complejos Dias 3 y 4

/// Hemos superado los tipos de datos simples ahora, y comenzamos a buscar formas de agruparlos e incluso crear los nuestros propios usando enums. Entonces, recapitulemos:

/// Los Arrays nos permiten almacenar muchas valores en un solo lugar, y luego leerlos usando índices enteros. Los Arrays siempre deben ser especializados para que contengan un tipo específico, y tienen funcionalidades útiles como count, append(), y contains().

/// Los Diccionarios también nos permiten almacenar muchas valores en un solo lugar, pero nos permiten leerlos usando claves que especificamos. Deben ser especializados para tener un tipo específico para la clave y otro para el valor, y tienen funcionalidades similares a los Arrays, como contains() y count.

/// Los Conjuntos son una tercera forma de almacenar muchas valores en un solo lugar, pero no podemos elegir el orden en que almacenan esos elementos. Los Conjuntos son realmente eficientes para encontrar si contienen un elemento específico.

/// Los Enums nos permiten crear nuestros propios tipos simples en Swift para que podamos especificar un rango de valores aceptables, como una lista de acciones que el usuario puede realizar, los tipos de archivos que podemos escribir, o los tipos de notificaciones para enviar al usuario.

/// Swift siempre debe conocer el tipo de datos dentro de una constante o variable, y utiliza principalmente la inferencia de tipos para descubrirlo basado en los datos que asignamos. Sin embargo, también es posible usar anotación de tipo para forzar un tipo particular.

/// De entre Arrays, Diccionarios, y Conjuntos, es seguro decir que usarás Arrays con mucha más frecuencia. Después vienen los Diccionarios, y los Conjuntos quedan en un distante tercer lugar. Eso no significa que los Conjuntos no sean útiles, ¡pero sabrás cuándo los necesitas!

// Ejemplo:

// Arrays
var numeros: [Int] = [1, 2, 3, 4, 5]
print(numeros[2]) // Output: 3

// Diccionarios
var diccionario: [String: Int] = ["uno": 1, "dos": 2, "tres": 3]
print(diccionario["dos"] ?? 0) // Output: 2

// Conjuntos
var conjunto: Set<String> = ["manzana", "banana", "pera"]
print(conjunto.contains("manzana")) // Output: true

// Enums
enum DiaSemana {
    case lunes, martes, miercoles, jueves, viernes, sabado, domingo
}
let dia = DiaSemana.martes
print(dia) // Output: martes



// MARK: - Reto 2

/// Esta vez, el desafío es crear una matriz de cadenas, luego escribir algún código que imprima el número de elementos en la matriz y también el número de elementos únicos en la matriz.

/// 1. - Crear una matriz de cadenas.

/// 2. - Utilizar la función count para obtener el número total de elementos en la matriz.

/// 3. - Convertir la matriz en un conjunto (Set) para eliminar elementos duplicados.

/// 4. - Utilizar la función count nuevamente en el conjunto para obtener el número de elementos únicos.

// Crear una matriz de cadenas
let array: [String] = ["a", "b", "c", "a", "d", "e", "b"]

// Obtener el número de elementos en la matriz
let totalElements = array.count
print("Número total de elementos en la matriz: \(totalElements)")

// Convertir la matriz en un conjunto para obtener elementos únicos
let uniqueElements = Set(array)

// Obtener el número de elementos únicos en la matriz
let uniqueCount = uniqueElements.count
print("Número de elementos únicos en la matriz: \(uniqueCount)")



// MARK: - Día 5 Condicionales

/// if es una declaración condicional que se usa para ejecutar un bloque de código si se cumple una condición específica.
/// La sintaxis básica es: if condición { código a ejecutar }.

/// También puedes usar else para proporcionar un bloque de código alternativo que se ejecutará si la condición no se cumple.
/// Para evaluar múltiples condiciones, puedes usar else if.

/// if puede anidarse dentro de otros if o else para condiciones más complejas.

/// Ejemplo:

let edadPerson = 25

if edadPerson >= 18 {
    print("Eres mayor de edad")
} else {
    print("Eres menor de edad")
}


/// switch es una estructura de control que se usa para evaluar una variable o expresión y ejecutar un bloque de código dependiendo del valor de esa variable o expresión.

/// Puedes manejar múltiples casos usando case, y el bloque de código correspondiente se ejecutará cuando se encuentre un caso que coincida.

/// Puedes usar default para proporcionar un bloque de código que se ejecutará si ningún caso coincide.
/// switch es más expresivo que if-else en ciertos casos y puede ser más fácil de leer cuando hay múltiples condiciones a manejar.


/// Ejemplo:

let diaSemana = "viernes"

switch diaSemana {
case "lunes":
    print("Es el primer día de la semana")
case "viernes":
    print("¡Por fin es viernes!")
default:
    print("Es un día de la semana")
}


// MARK: - Día 6 Bucles

/// Usamos declaraciones if para verificar si una condición es verdadera. Puedes pasar cualquier condición que desees, pero en última instancia debe reducirse a un booleano.

/// Si lo deseas, puedes agregar un bloque else, y/o múltiples bloques else if para verificar otras condiciones. Swift ejecuta estos en orden.

/// Puedes combinar condiciones usando ||, lo que significa que toda la condición es verdadera si cualquiera de las subcondiciones es verdadera, o &&, lo que significa que toda la condición es verdadera si ambas subcondiciones son verdaderas.

/// Si estás repitiendo los mismos tipos de comprobación muchas veces, puedes usar una declaración switch en su lugar. Estas siempre deben ser exhaustivas, lo que podría significar agregar un caso predeterminado.

/// Si uno de tus casos de switch utiliza fallthrough, significa que Swift ejecutará el siguiente caso después. Esto no se usa comúnmente.
/// El operador ternario condicional nos permite verificar WTF: What, True, False. Aunque puede ser un poco difícil de leer al principio, verás que se usa mucho en SwiftUI.

/// Los bucles for nos permiten recorrer arrays, sets, diccionarios y rangos. Puedes asignar elementos a una variable de bucle y usarla dentro del bucle, o puedes usar guión bajo, _, para ignorar la variable de bucle.
/// Los bucles while nos permiten crear bucles personalizados que continuarán ejecutándose hasta que una condición se vuelva falsa.

/// Podemos saltar algunos o todos los elementos del bucle usando continue o break respectivamente.

/// Eso es otro gran bloque de nuevo material, pero con condiciones y bucles ahora sabes lo suficiente como para construir software realmente útil. ¡Inténtalo!


// Declaraciones "if", "else" y "else if":
let numero = 10

if numero < 5 {
    print("El número es menor que 5.")
} else if numero > 10 {
    print("El número es mayor que 10.")
} else {
    print("El número está entre 5 y 10, inclusive.")
}

// Combinación de condiciones con "||" y "&&":
let temperaturas = 25

if temperaturas < 0 || temperaturas > 30 {
    print("La temperatura está fuera del rango normal.")
}

if temperaturas >= 20 && temperaturas <= 30 {
    print("La temperatura es agradable para estar afuera.")
}


// Declaración switch:
let dia_Semana = "lunes"

switch dia_Semana {
case "lunes", "martes", "miércoles", "jueves", "viernes":
    print("Es un día laboral.")
case "sábado", "domingo":
    print("Es fin de semana.")
default:
    print("No es un día válido.")
}


// Operador ternario condicional:
let suEdad = 20
let mensaje = suEdad >= 18 ? "Eres mayor de edad" : "Eres menor de edad"
print(mensaje)

// Bucle for para recorrer un rango de números:
for i in 1...5 {
    print("Número \(i)")
}

// Bucle while para contar hasta cierto número:
var contador = 0
while contador < 5 {
    print("Contador: \(contador)")
    contador += 1
}


// MARK: - Reto 3
/// El problema se llama fizz buzz, y ha sido utilizado en entrevistas de trabajo, pruebas de ingreso a la universidad y más por tanto tiempo como puedo recordar. Tu objetivo es iterar desde 1 hasta 100, y para cada número:

/// Si es un múltiplo de 3, imprime "Fizz"
/// Si es un múltiplo de 5, imprime "Buzz"
/// Si es un múltiplo de 3 y 5, imprime "FizzBuzz"
/// De lo contrario, simplemente imprime el número.
/// Entonces, aquí tienes algunos valores de ejemplo que deberías obtener cuando se ejecute tu código:

/// 1 debería imprimir "1"
/// 2 debería imprimir "2"
/// 3 debería imprimir "Fizz"
/// 4 debería imprimir "4"
/// 5 debería imprimir "Buzz"
/// 6 debería imprimir "Fizz"
/// 7 debería imprimir "7"
/// ...
/// 15 debería imprimir "FizzBuzz"
/// ...
/// 100 debería imprimir "Buzz"
/// Antes de empezar: Este problema parece extremadamente simple, pero muchos, muchos desarrolladores luchan por resolverlo. Lo he visto personalmente, así que no te estreses por ello; intentar resolver el problema ya te enseña algo sobre él.

/// Ya sabes todo lo que necesitas para resolver ese problema, pero si deseas algunas pistas, añadiré algunas a continuación.

for numero in 1...100 {
    if numero % 3 == 0 && numero % 5 == 0 {
        print("FizzBuzz")
    } else if numero % 3 == 0 {
        print("Fizz")
    } else if numero % 5 == 0 {
        print("Buzz")
    } else {
        print(numero)
    }
}


// MARK: - Funciones Dias 7 y 8

/// Hemos cubierto mucho sobre las funciones en los capítulos anteriores, así que recapitulemos:

/// Las funciones nos permiten reutilizar el código fácilmente tallando trozos de código y dándole un nombre.

/// Todas las funciones comienzan con la palabra func, seguida del nombre de la función. El cuerpo de la función está contenido dentro de las llaves de apertura y cierre.

/// Podemos agregar parámetros para que nuestras funciones sean más flexibles: enumerarlos uno por uno separados por comas: el nombre del parámetro, luego los dos puntos y luego el tipo del parámetro.

/// Puede controlar cómo se utilizan esos nombres de parámetros externamente, ya sea utilizando un nombre de parámetro externo personalizado o usando un guión bajo para desactivar el nombre externo de ese parámetro.

/// Si crees que hay ciertos valores de parámetros que usarás repetidamente, puedes hacer que tengan un valor predeterminado para que tu función tome menos código para escribir y haga lo inteligente de forma predeterminada.

/// Las funciones pueden devolver un valor si lo desea, pero si desea devolver varios datos de una función, debe usar una tupla. Estos contienen varios elementos con nombre, pero está limitado de una manera en que un diccionario no lo es: enumeras cada elemento específicamente, junto con su tipo.

/// Las funciones pueden lanzar errores: crea una enumeración que define los errores que desea que ocurran, arroja esos errores dentro de la función según sea necesario, luego usa do, try y catch para manejarlos en el sitio de la llamada.


// Función sin parámetros ni valor de retorno:
func saludar() {
    print("¡Hola!")
}

saludar() // Salida: ¡Hola!

// Función con parámetros:
func suma(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let resultado = suma(5, 3)
print("La suma es: \(resultado)") // Salida: La suma es: 8


// Función con valor de retorno y parámetros con nombre externo:
func saludar(nombre: String) -> String {
    return "¡Hola, \(nombre)!"
}

let mensaje1 = saludar(nombre: "Juan")
print(mensaje1) // Salida: ¡Hola, Juan!


// Función con valor de parámetro predeterminado:
func saludar2(nombre: String = "Mundo") -> String {
    return "¡Hola, \(nombre)!"
}

print(saludar2()) // Salida: ¡Hola, Mundo!
print(saludar2(nombre: "Pedro")) // Salida: ¡Hola, Pedro!


// Función que devuelve una tupla:
func obtenerCoordenadas() -> (Double, Double) {
    return (40.7128, -74.0060)
}

let coordenadas = obtenerCoordenadas()
print("Latitud: \(coordenadas.0), Longitud: \(coordenadas.1)") // Salida: Latitud: 40.7128, Longitud: -74.0060


// Función que lanza errores:
enum ErrorPersonalizado: Error {
    case valorNegativo
}

func dividir(_ a: Int, por b: Int) throws -> Int {
    guard b != 0 else {
        throw ErrorPersonalizado.valorNegativo
    }
    return a / b
}

do {
    let resultado = try dividir(10, por: 0)
    print("Resultado: \(resultado)")
} catch ErrorPersonalizado.valorNegativo {
    print("¡Error! No se puede dividir por cero.")
} catch {
    print("Se produjo un error desconocido.")
}



// MARK: - Reto 4
/// El desafío es el siguiente: escribe una función que acepte un entero del 1 al 10,000, y devuelva la raíz cuadrada entera de ese número. Suena fácil, pero hay algunas cosas que tener en cuenta:

/// No puedes usar la función sqrt() u otras similares incorporadas de Swift, necesitas encontrar la raíz cuadrada por ti mismo.
/// Si el número es menor que 1 o mayor que 10,000, debes lanzar un error de "fuera de límites".

/// Solo debes considerar raíces cuadradas enteras; no te preocupes por la raíz cuadrada de 3 siendo 1.732, por ejemplo.
/// Si no puedes encontrar la raíz cuadrada, lanza un error de "sin raíz".

/// Como recordatorio, si tienes el número X, la raíz cuadrada de X será otro número que, cuando se multiplica por sí mismo, da como resultado X. Entonces, la raíz cuadrada de 9 es 3, porque 3x3 es 9, y la raíz cuadrada de 25 es 5, porque 5x5 es 25.

/// Te daré algunas pistas en un momento, pero como siempre te animo a que lo intentes primero por ti mismo: luchar por recordar cómo funcionan las cosas, y a menudo tener que buscarlas de nuevo, es una forma poderosa de progresar.


enum ErrorRaizCuadrada: Error {
    case fueraDeLimites
    case sinRaiz
}

func raizCuadradaEntera(_ numero: Int) throws -> Int {
    guard numero >= 1 && numero <= 10000 else {
        throw ErrorRaizCuadrada.fueraDeLimites
    }
    
    for i in 1...100 {
        if i * i == numero {
            return i
        }
    }
    
    throw ErrorRaizCuadrada.sinRaiz
}

do {
    let numero = 25
    let resultado = try raizCuadradaEntera(numero)
    print("La raíz cuadrada de \(numero) es \(resultado)")
} catch ErrorRaizCuadrada.fueraDeLimites {
    print("Error: El número está fuera de los límites permitidos.")
} catch ErrorRaizCuadrada.sinRaiz {
    print("Error: No se pudo encontrar la raíz cuadrada entera del número.")
}


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


// MARK: - Dia 10 y 11, Structuras

/// Los structs se utilizan casi en todas partes en Swift: String, Int, Double, Array e incluso Bool están todos implementados como structs, y ahora puedes reconocer que una función como isMultiple(of:) es realmente un método perteneciente a Int.

/// Repasemos qué más aprendimos:

/// Puedes crear tus propios structs escribiendo struct, dándole un nombre y luego colocando el código del struct dentro de llaves.

/// Los structs pueden tener variables y constantes (conocidas como propiedades) y funciones (conocidas como métodos).

/// Si un método intenta modificar propiedades de su struct, debes marcarlo como mutating.

/// Puedes almacenar propiedades en memoria, o crear propiedades calculadas que calculan un valor cada vez que se acceden.

/// Podemos adjuntar observadores de propiedades didSet y willSet a propiedades dentro de un struct, lo cual es útil cuando necesitamos asegurarnos de que algún código siempre se ejecute cuando la propiedad cambia.

/// Los inicializadores son un poco como funciones especializadas, y Swift genera uno para todos los structs utilizando los nombres de sus propiedades.

/// Puedes crear tus propios inicializadores personalizados si quieres, pero siempre debes asegurarte de que todas las propiedades en tu struct tengan un valor para cuando el inicializador termine, y antes de llamar a cualquier otro método.

/// Podemos usar access para marcar cualquier propiedad y método como disponible o no disponible externamente, según sea necesario.

/// Es posible adjuntar una propiedad o métodos directamente a un struct, para que puedas usarlos sin crear una instancia del struct.

// Ejemplo de código:

struct Rectangulo {
    var ancho: Double
    var altura: Double
    
    func area() -> Double {
        return ancho * altura
    }
}

var miRectangulo = Rectangulo(ancho: 5.0, altura: 10.0)
print("Área del rectángulo: \(miRectangulo.area())")



// MARK: - Reto 6


/// Las estructuras se encuentran en el núcleo de cada aplicación SwiftUI, por lo que es muy importante que te tomes un tiempo extra para asegurarte de entender lo que hacen y cómo funcionan.

/// Para comprobar sus conocimientos, aquí hay una pequeña tarea para usted: cree una estructura para almacenar información sobre un coche, incluido su modelo, el número de asientos y el equipo actual, y luego agregue un método para cambiar los engranajes hacia arriba o hacia abajo. Piensa en las variables y el control de acceso: ¿qué datos deben ser una variable en lugar de una constante, y qué datos deben exponerse públicamente? ¿Debería el método de cambio de marchas validar su entrada de alguna manera?

/// Como siempre, escribiré algunas pistas a continuación, pero primero voy a dejar algo de espacio para que no veas las pistas por accidente. Como siempre, es una muy buena idea probar este desafío usted mismo antes de mirar las pistas: es la forma más rápida de identificar las partes con las que te sientes menos seguro.

// Solucion ....
struct Coche {

    static let marca = "Citroen"
    let modelo: String
    let numeroAsientos: Int
    
    private var cambioMarcha: Int = 0
    
    init(modelo: String, numeroAsientos: Int = 5, cambioMarcha: Int ) {
        self.modelo = modelo
        self.numeroAsientos = numeroAsientos
      
    }

    // Cambio de marcha ascendente
    mutating func marchaAscendete(){
        if cambioMarcha < 6 {
            cambioMarcha += 1
            print("camvio de marcha \(cambioMarcha)")
        }else{
            print("esta enmarcha")
        }
    }
    
    // Cambio de marcha descendente
    mutating func marchaDesdecndente(){
        if cambioMarcha > 0 {
            cambioMarcha -= 1
            print("camvio de marcha \(cambioMarcha)")
        }else{
            print("camvio de marcha \(cambioMarcha)")
        }
    }
    
    // obtener la macha actual
    func marchaActual() -> Int {
        return cambioMarcha
    }
    
}

// Mostrar resultado:
print(Coche.marca)

//llamo a la estructura coche
var miCoche = Coche(modelo: "C5", cambioMarcha: 5)

// imprimo resultados
print(miCoche.modelo)
print("El numero de asiento es de \(miCoche.numeroAsientos)")

miCoche.marchaAscendete()// sube macha

// mostrar marcha
print("tengo metida la \( miCoche.marchaActual())")
miCoche.marchaAscendete()// sube macha

// mostrar marcha
print("tengo metida la \( miCoche.marchaActual())")

miCoche.marchaDesdecndente()// bajar

// mostrar marcha
print("tengo metida la \( miCoche.marchaActual())")



// MARK: - Dia 12, Clases


/// Las clases no se usan tan comúnmente como los structs, pero sirven un propósito invaluable para compartir datos, y si alguna vez eliges aprender el antiguo framework UIKit de Apple, te encontrarás usándolas extensamente.

/// Repasemos lo que aprendimos:

/// Las clases tienen muchas cosas en común con los structs, incluida la capacidad de tener propiedades y métodos, pero hay cinco diferencias clave entre clases y structs.

/// Primero, las clases pueden heredar de otras clases, lo que significa que obtienen acceso a las propiedades y métodos de su clase padre. Opcionalmente, puedes anular métodos en clases secundarias si lo deseas, o marcar una clase como final para evitar que otros la hereden.

/// Segundo, Swift no genera un inicializador miembro para las clases, así que necesitas hacerlo tú mismo. Si una subclase tiene su propio inicializador, siempre debe llamar al inicializador de la clase padre en algún momento.

/// Tercero, si creas una instancia de clase y luego haces copias de ella, todas esas copias apuntan de vuelta a la misma instancia. Esto significa que cambiar algunos datos en una de las copias cambia todas ellas.

/// Cuarto, las clases pueden tener desinicializadores que se ejecutan cuando se destruye la última copia de una instancia.

/// Finalmente, las propiedades variables dentro de las instancias de clase pueden cambiarse independientemente de si la instancia misma se creó como variable.


// Ejemplo de código:

class Persona {
    var nombre: String
    var edad: Int
    
    init(nombre: String, edad: Int) {
        self.nombre = nombre
        self.edad = edad
    }
    
    func saludar() {
        print("¡Hola! Mi nombre es \(nombre) y tengo \(edad) años.")
    }
}

var persona1 = Persona(nombre: "Juan", edad: 30)
var persona2 = persona1

persona1.edad = 35

persona1.saludar() // Output: ¡Hola! Mi nombre es Juan y tengo 35 años.
persona2.saludar() // Output: ¡Hola! Mi nombre es Juan y tengo 35 años.



// MARK: - Reto 7

/// Ahora que entiendes cómo funcionan las clases y, lo que es igual de importante, cómo son diferentes de las estructuras, es hora de abordar un pequeño desafío para comprobar tu progreso.

/// Tu desafío es el siguiente: hacer una jerarquía de clases para los animales, comenzando con Animal en la parte superior, luego Perro y Gato como subclases, luego Corgi y Caniche como subclases de Perro, y Persa y León como subclases de Gato.

/// Pero hay más:

/// La clase Animal debe tener una propiedad entera de patas que rastree cuántas patas tiene el animal.

/// La clase Dog debería tener un método speak() que imprima una cadena genérica de ladridos de perros, pero cada una de las subclases debería imprimir algo ligeramente diferente.

/// La clase Cat debería tener un método speak() coincidente, de nuevo con cada subclase imprimiendo algo diferente.

/// La clase Cat debe tener una propiedad booleana isTame, proporcionada mediante un inicializador.

/// Te daré algunos consejos en un momento, pero primero te recomiendo que lo pruebes tú mismo.

class Animal {
    var numberOfLegs: Int
    
    init(numberOfLegs: Int) {
        self.numberOfLegs = numberOfLegs
    }
}

class Dog: Animal {
    override init(numberOfLegs: Int) {
        super.init(numberOfLegs: numberOfLegs)
    }
    
    func speak() {
        print("Woof!")
    }
}

class Corgi: Dog {
    override init(numberOfLegs: Int) {
        super.init(numberOfLegs: numberOfLegs)
    }
    
    override func speak() {
        print("Woof! I'm a Corgi!")
    }
}

class Poodle: Dog {
    override init(numberOfLegs: Int) {
        super.init(numberOfLegs: numberOfLegs)
    }
    
    override func speak() {
        print("Woof! I'm a Poodle!")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(numberOfLegs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(numberOfLegs: numberOfLegs)
    }
    
    func speak() {
        print("Meow!")
    }
}

class Persian: Cat {
    override init(numberOfLegs: Int, isTame: Bool) {
        super.init(numberOfLegs: numberOfLegs, isTame: isTame)
    }
    
    override func speak() {
        print("Meow! I'm a Persian cat!")
    }
}

class Lion: Cat {
    override init(numberOfLegs: Int, isTame: Bool) {
        super.init(numberOfLegs: numberOfLegs, isTame: isTame)
    }
    
    override func speak() {
        print("Roar! I'm a Lion!")
    }
}
