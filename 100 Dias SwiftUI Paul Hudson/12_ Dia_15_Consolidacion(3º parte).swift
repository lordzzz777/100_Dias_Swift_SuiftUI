import Foundation

// -------- Property observers --------

/*
 Los observadores de propiedades son fragmentos de código que se ejecutan cuando
 las propiedades cambian: didSet se ejecuta cuando la propiedad acaba de cambiar,
 y willSet se ejecuta antes de que cambie la propiedad.

 Podemos demostrar didSet haciendo que una estructura Game imprima un mensaje
 cuando cambie la puntuación:
 */

 struct Game {
    var score = 0 {
        didSet {
            print("La puntuación es ahora \(score)")
        }
    }
}

var juego = Game()
juego.score += 10
juego.score -= 3

/*
Inicializadores personalizados
Los inicializadores son funciones especiales que preparan una nueva instancia de una
estructura para ser utilizada, asegurando que todas las propiedades tengan un valor inicial.

Swift genera uno basado en las propiedades de la estructura, pero puedes crear el tuyo propio:
*/

struct Player {
    let nombre: String
    let número: Int

    init(nombre: String) {
        self.nombre = nombre
        número = Int.random(in: 1...99)
    }
}

/*
 Importante: Los inicializadores no tienen func delante de ellos, y no devuelven explícitamente un valor.

 Control de acceso, Swift tiene varias opciones para el control de acceso dentro de las estructuras,
 pero cuatro son las más comunes:

 * Usa private para "no permitir que nada fuera de la estructura use esto".

 * Usa private(set) para "cualquier cosa fuera de la estructura puede leer esto, 
   pero no permitas que lo cambien".

 * Usa fileprivate para "no permitir que nada fuera del archivo actual use esto".

 * Usa public para "dejar que cualquiera, en cualquier lugar, use esto". 

 Por ejemplo:
*/

struct BankAccount {
    private(set) var fondos = 0

    mutating func depositar(cantidad: Int) {
        fondos += cantidad
    }

    mutating func retirar(cantidad: Int) -> Bool {
        if fondos > cantidad {
            fondos -= cantidad
            return true
        } else {
            return false
        }
    }
}

/*
 Debido a que usamos private(set), leer fondos desde fuera de la estructura está bien, 
 pero no es posible escribir en él.

 Propiedades y métodos estáticos, Swift admite propiedades y métodos estáticos, lo que te 
 permite agregar una propiedad o método directamente a la propia estructura en lugar de a
 una instancia de la estructura:
*/

struct AppData {
    static let versión = "1.3 beta 2"
    static let configuración = "configuración.json"
}


// Usando este enfoque, en todas partes donde necesitemos verificar o mostrar algo como el 
// número de versión de la aplicación, podemos leer AppData.version.


// ------------ Clases ------------

// Las clases nos permiten crear tipos de datos personalizados y son diferentes de las
// estructuras en cinco formas.

// La primera diferencia es que podemos crear clases heredando funcionalidad de otras clases:

class Employee {
    let horas: Int

    init(horas: Int) {
        self.horas = horas
    }

    func imprimirResumen() {
        print("Trabajo \(horas) horas al día.")
    }
}

class Developer: Employee {
    func trabajar() {
        print("Estoy programando durante \(horas) horas.")
    }
}

let novall = Developer(horas: 8)
novall.trabajar()
novall.imprimirResumen()

// Si una clase hija quiere cambiar un método de una clase padre, debe usar override:

override func imprimirResumen() {
    print("Paso \(horas) horas al día buscando en Stack Overflow.")
}

/*
 La segunda diferencia es que los inicializadores son más complicados con las clases. 
 Hay mucha complejidad aquí, pero hay tres puntos clave:

 * Swift no generará un inicializador de miembro para las clases.

 * Si una clase hija tiene inicializadores personalizados, siempre debe llamar al 
   inicializador del padre después de haber terminado de configurar sus propias propiedades.

 * Si una subclase no tiene ningún inicializador, hereda automáticamente
   los inicializadores de su clase padre.

 Por ejemplo:
 */

class Vehicle {
    let esEléctrico: Bool

    init(esEléctrico: Bool) {
        self.esEléctrico = esEléctrico
    }
}

class Car: Vehicle {
    let esConvertible: Bool

    init(esEléctrico: Bool, esConvertible: Bool) {
        self.esConvertible = esConvertible
        super.init(esEléctrico: esEléctrico)
    }
}

/*
 super nos permite llamar a métodos que pertenecen a nuestra clase padre,
 como su inicializador.

 La tercera diferencia es que todas las copias de una instancia de clase 
 comparten sus datos, lo que significa que los cambios que hagas en una 
 cambiarán automáticamente otras copias.

 Por ejemplo:
*/

class Singer {
    var nombre = "Adele"
}

var cantante1 = Singer()
var cantante2 = cantante1
cantante2.nombre = "Justin"
print(cantante1.nombre)  
print(cantante2.nombre)

/*
 Eso imprimirá "Justin" para ambos, aunque solo hayamos cambiado uno de ellos,
 el otro también cambió. En comparación, las copias de estructuras no comparten sus datos.

 La cuarta diferencia es que las clases pueden tener un destructor que se llama cuando se 
 destruye la última referencia a un objeto.

 Por lo tanto, podríamos crear una clase que imprima un mensaje cuando se crea y se destruye:
 */

 class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("Usuario \(id): ¡Estoy vivo!")
    }

    deinit {
        print("Usuario \(id): ¡Estoy muerto!")
    }
}

for i in 1...3 {
    let usuario = User(id: i)
    print("Usuario \(usuario.id): ¡Estoy en control!")
}

// La última diferencia es que las clases nos permiten cambiar propiedades 
// variables incluso cuando la clase misma es constante:

class User {
    var nombre = "Paul"
}

let usuario = User()
usuario.nombre = "Taylor"
print(usuario.nombre)

// Como resultado de esto, las clases no necesitan la palabra clave mutating
// con métodos que cambian sus datos.


// ------------ Protocolos -----------


// Los protocolos definen la funcionalidad que esperamos que un tipo de datos admita, 
// y Swift garantiza que nuestro código siga esas reglas.

// Por ejemplo, podríamos definir un protocolo Vehicle de esta manera:

protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

/*
 Eso enumera los métodos requeridos para que este protocolo funcione, pero no contiene 
 ningún código: estamos especificando solo nombres de método, parámetros y tipos de retorno.

 Una vez que tienes un protocolo, puedes hacer que los tipos de datos se ajusten a él 
 implementando la funcionalidad requerida. Por ejemplo, podríamos hacer una estructura 
 Car que se ajuste a Vehicle:
*/

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("Estoy conduciendo \(distance)km.")
    }
}

/*
 Todos los métodos enumerados en Vehicle deben existir exactamente en Car, con el mismo nombre, 
 parámetros y tipos de retorno.

 Ahora puedes escribir una función que acepte cualquier tipo de dato que se ajuste a Vehicle,
 porque Swift sabe que implementa tanto estimateTime() como travel():
*/

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("¡Demasiado lento!")
    } else {
        vehicle.travel(distance: distance)
    }
}

let carro = Car()
commute(distance: 100, using: carro)

// Los protocolos también pueden requerir propiedades, por lo que podríamos requerir
// propiedades para saber cuántos asientos tienen los vehículos y cuántos pasajeros
// tienen actualmente:

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

/*
 Eso agrega dos propiedades: una marcada con get que podría ser una propiedad constante
 o calculada, y otra marcada con get set que podría ser una variable o una propiedad 
 calculada con un getter y un setter.

 Ahora, todos los tipos que se ajusten deben agregar implementaciones de esas dos
 propiedades, como esta para Car:
*/

let name = "Car"
var currentPassengers = 1

// Consejo: Puedes ajustarte a tantos protocolos como necesites, 
// solo enumerándolos separados por comas.



// ------------ Extensiones ------------

/*
 Las extensiones nos permiten agregar funcionalidad a cualquier tipo. Por ejemplo,
 las cadenas de Swift tienen un método para recortar espacios en blanco y nuevas líneas, 
 pero es bastante largo, así que podríamos convertirlo en una extensión:
 */

 extension String {
    func recortado() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

var cita = "   La verdad rara vez es pura y nunca simple   "
let recortado = cita.recortado()

// Si quieres cambiar un valor directamente en lugar de devolver un nuevo valor,
// marca tu método como mutante de esta manera:

extension String {
    mutating func recortar() {
        self = self.recortado()
    }
}

cita.recortar()

// Las extensiones también pueden agregar propiedades calculadas a los tipos, como esta:

extension String {
    var lineas: [String] {
        self.components(separatedBy: .newlines)
    }
}

/*
 El método components(separatedBy:) divide una cadena en una matriz de cadenas usando un límite 
 que nosotros elijamos, que en este caso son nuevas líneas.

 Ahora podemos usar esa propiedad con todas las cadenas:
*/

let letra = """
Pero sigo avanzando
No puedo parar, no pararé de moverme
"""

print(letra.lineas.count)

/*
 Extensiones de protocolo, las extensiones de protocolo amplían un protocolo completo para agregar
 propiedades calculadas e implementaciones de métodos, de modo que cualquier tipo que se ajuste a 
 ese protocolo las obtenga.

 Por ejemplo, Array, Dictionary y Set se ajustan todos al protocolo Collection, por lo que podemos 
 agregar una propiedad calculada a los tres de esta manera:
*/

extension Collection {
    var noEstaVacio: Bool {
        !isEmpty
    }
}

// Ahora podemos ponerlo en uso:

let invitados = ["Mario", "Luigi", "Peach"]

if invitados.noEstaVacio {
    print("Número de invitados: \(invitados.count)")
}

/*
 Este enfoque significa que podemos enumerar los métodos requeridos en un protocolo, y luego 
 agregar implementaciones predeterminadas de esos métodos dentro de una extensión de protocolo.
 Todos los tipos que se ajusten luego podrán usar esas implementaciones predeterminadas o 
 proporcionar las suyas propias según sea necesario.
*/


// ------------ Opcionales ------------

/*
 Los opcionales representan la ausencia de datos; por ejemplo, distinguen entre un entero que 
 tiene el valor 0 y no tener ningún valor en absoluto.

 Para ver los opcionales en acción, piensa en este código:
*/

let opuestos = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let opuestoDurazno = opuestos["Durazno"]

/*
 Eso intenta leer el valor asociado con la clave "Durazno", que no existe, por lo que esto no
 puede ser una cadena regular. La solución de Swift se llama opcionales, lo que significa datos 
 que pueden estar presentes o no.

 Una cadena opcional podría tener una cadena esperando dentro para nosotros, o podría no haber 
 nada en absoluto, un valor especial llamado nil, que significa "ningún valor". Cualquier tipo 
 de datos puede ser opcional, incluidos Int, Double y Bool, así como instancias de enums, 
 structs y clases.

 Swift no nos permite usar datos opcionales directamente, porque podrían estar vacíos. 
 Eso significa que necesitamos desenvolver el opcional para usarlo; necesitamos mirar adentro 
 para ver si hay un valor y, si lo hay, sacarlo y usarlo.

 Swift nos ofrece varias formas de desenvolver opcionales, pero la que verás más a menudo 
 se parece a esto: 
*/

if let opuestoMario = opuestos["Mario"] {
    print("El opuesto de Mario es \(opuestoMario)")
}

/*
 Eso lee el valor opcional del diccionario y, si tiene una cadena adentro, se desenvuelve; 
 la cadena dentro se coloca en la constante opuestoMario, y ya no es opcional. Debido a que 
 pudimos desenvolver el opcional, la condición es un éxito, por lo que se ejecuta 
 el código print().
*/


// ------------ Desenvolviendo opcionales con guard ------------


/* 
 Swift tiene una segunda forma de desenvolver opcionales, llamada guard let, que es muy s
 imilar a if let excepto que invierte las cosas: if let ejecuta el código dentro de sus 
 llaves si el opcional tenía un valor, y guard let ejecuta el código si el opcional no 
 tenía un valor.

 Se ve así:
*/

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Falta entrada")
        return
    }

    print("\(number) x \(number) es \(number * number)")
}

/*
 Si usas guard para verificar que las entradas de una función sean válidas, Swift te exige 
 que uses return si la verificación falla. Sin embargo, si el opcional que estás desenvolviendo 
 tiene un valor adentro, puedes usarlo después de que el código guard termine.

 Consejo: Puedes usar guard con cualquier condición, incluso aquellas que no desenvuelven opcionales.

 Coalescencia de nil 
 Swift tiene una tercera forma de desenvolver opcionales, llamada el operador de coalescencia de nil: 
 desenvuelve un opcional y proporciona un valor predeterminado si el opcional estaba vacío:
*/

let seriesTV = ["Archer", "Babylon 5", "Ted Lasso"]
let favorita = seriesTV.randomElement() ?? "Ninguna"

/*
 El operador de coalescencia de nil es útil en muchos lugares donde se crean opcionales. Por ejemplo, 
 crear un entero a partir de una cadena devuelve un opcional Int? porque la conversión podría haber 
 fallado. Aquí podemos usar la coalescencia de nil para proporcionar un valor predeterminado:
 */

 let entrada = ""
 let número = Int(entrada) ?? 0
 print(número)

// Encadenamiento opcional, el encadenamiento opcional lee opcionales dentro de opcionales, así:

let nombres = ["Arya", "Bran", "Robb", "Sansa"]
let elegido = nombres.randomElement()?.uppercased()
print("Siguiente en la fila: \(elegido ?? "Nadie")")

/*
 El encadenamiento opcional está en la línea 2: un signo de interrogación seguido de más código.
 Nos permite decir "si el opcional tiene un valor adentro, desenvuélvelo y luego..." y agregar
 más código. En nuestro caso, estamos diciendo "si obtuvimos un elemento aleatorio del array, 
 conviértelo en mayúsculas".
*/

// ------------- Intento opcional? ------------


/*
 Cuando llamamos a una función que podría lanzar errores, podemos usar try? para convertir su 
 resultado en un opcional que contenga un valor en caso de éxito, o nil en caso contrario.

 Así es cómo se ve:
*/

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let usuario = try? getUser(id: 23) {
    print("Usuario: \(usuario)")
}

/*
 La función getUser() siempre lanzará networkFailed, pero no nos importa lo que se haya lanzado; 
 todo lo que nos importa es si la llamada devolvió un usuario o no.

 Conclusión
 Hemos cubierto la mayoría de los fundamentos del lenguaje Swift aquí, pero realmente solo hemos 
 rasguñado la superficie de lo que el lenguaje puede hacer. Afortunadamente, con lo que has 
 aprendido ya sabes lo suficiente como para construir software fantástico con Swift y SwiftUI.

 Si estás interesado en continuar tu aprendizaje, te sugiero que visites mi curso 100 Days of 
 wiftUI, que te enseña cómo construir aplicaciones fantásticas para iOS utilizando Swift; es 
 ompletamente gratuito y también tiene cientos de videos. 
*/

