import Foundation


// ------------ Condiciones ------------

// Utiliza declaraciones if, else y else if para verificar una condición
// y ejecutar un código correspondiente:

let edad = 16

if edad < 12 {
    print("No puedes votar")
} else if edad < 18 {
    print("Pronto podrás votar.")
} else {
    print("Ya puedes votar.")
}
// Podemos usar && para combinar dos condiciones, y toda la condición solo
// será verdadera si las dos partes internas son verdaderas:

let temperatura = 26

if temperatura > 20 && temperatura < 30 {
    print("Es un día agradable.")
}

// Alternativamente, || hará que una condición sea verdadera si cualquiera
// de las subcondiciones es verdadera.


// ------------ Sentencias switch ----------

// Swift nos permite verificar un valor contra múltiples condiciones utilizando
// la sintaxis switch/case, de esta manera:

enum Clima {
    case sol, lluvia, viento
}

let pronostico = Clima.sol

switch pronostico {
case .sol:
    print("Un buen día.")
case .lluvia:
    print("Lleva un paraguas.")
default:
    print("Debería estar bien.")
}

// Las sentencias switch deben ser exhaustivas: se deben manejar todos los valores
// posibles para que no se omita uno por accidente.

// El operador ternario condicional
// El operador ternario nos permite verificar una condición y devolver uno de dos valores:
// algo si la condición es verdadera y algo si es falsa:


let edad = 18
let puedeVotar = edad >= 18 ? "Sí" : "No"

// Cuando se ejecuta ese código, puedeVotar se establecerá en "Sí" 
// porque la edad está configurada en 18.



// ------------ Bucles ------------

// Los bucles for de Swift ejecutan un código para cada elemento en
// una colección o en un rango personalizado. Por ejemplo:


let plataformas = ["iOS", "macOS", "tvOS", "watchOS"]

for os in plataformas {
    print("Swift funciona en \(os).")
}

// También puedes iterar sobre un rango de números:


for i in 1...12 {
    print("5 x \(i) es \(5 * i)")
}
// 1...12 contiene los valores del 1 al 12 inclusive. 
// Si deseas excluir el número final, utiliza ..< en su lugar:

for i in 1..<13 {
    print("5 x \(i) es \(5 * i)")
}

// Consejo: Si no necesitas la variable de bucle, utiliza _:


var letra = "Los odiosos"

for _ in 1...5 {
    letra += " odian"
}

print(letra)

// También existen los bucles while, que ejecutan su cuerpo de
// bucle hasta que una condición sea falsa, como este:


var cuenta = 10

while cuenta > 0 {
    print("\(cuenta)...")
    cuenta -= 1
}

print("¡Ir!")

// Puedes usar continue para omitir la iteración actual del bucle
// y proceder a la siguiente:

let archivos = ["yo.jpg", "trabajo.txt", "sophie.jpg"]

for archivo in archivos {
    if archivo.hasSuffix(".jpg") == false {
        continue
    }

    print("Imagen encontrada: \(archivo)")
}

// Alternativamente, usa break para salir de un bucle y omitir todas
// las iteraciones restantes.


// ------------ Funciones ------------

// Para crear una nueva función, escribe func seguido del nombre de tu
// función, luego agrega parámetros dentro de paréntesis:


func imprimirTablaMultiplicar(numero: Int) {
    for i in 1...12 {
        print("\(i) x \(numero) es \(i * numero)")
    }
}

imprimirTablaMultiplicar(numero: 5)
// Necesitamos escribir número: 5 en el sitio de llamada, porque el nombre
// del parámetro es parte de la llamada de la función.

// Para devolver datos desde una función, dile a Swift de qué tipo es, 
// luego usa la palabra clave return para enviarlo de vuelta. Por ejemplo, 
// esto devuelve un lanzamiento de dado:

func lanzarDado() -> Int {
    return Int.random(in: 1...6)
}

let resultado = lanzarDado()
print(resultado)

// Si tu función contiene solo una línea de código, puedes eliminar 
// la palabra clave return:


func lanzarDado() -> Int {
    Int.random(in: 1...6)
}

// Devolver múltiples valores desde funciones
// Las tuplas almacenan un número fijo de valores de tipos específicos,
// que es una forma conveniente de devolver múltiples valores desde una función:


func obtenerUsuario() -> (nombre: String, apellido: String) {
    (nombre: "Taylor", apellido: "Swift")
}

let usuario = obtenerUsuario()
print("Nombre: \(usuario.nombre) \(usuario.apellido)")

// Si no necesitas todos los valores de la tupla, puedes desestructurar la tupla
// para dividirla en valores individuales, y _ para indicar a Swift que ignore algunos:


let (nombre, _) = obtenerUsuario()
print("Nombre: \(nombre)")

// Personalización de etiquetas de parámetros
// Si no deseas pasar el nombre de un parámetro al llamar a una función, 
// coloca un guion bajo antes de él:

func estaEnMayusculas(_ cadena: String) -> Bool {
    cadena == cadena.uppercased()
}

let cadena = "HOLA, MUNDO"
let resultado = estaEnMayusculas(cadena)

// Una alternativa es escribir un segundo nombre antes del primero: uno para 
// usar externamente y otro internamente:


func imprimirTablaMultiplicar(para numero: Int) {
    for i in 1...12 {
        print("\(i) x \(numero) es \(i * numero)")
    }
}

imprimirTablaMultiplicar(para: 5)

// En ese código, para se utiliza externamente y número se utiliza internamente.

// Proporcionar valores predeterminados para parámetros
// Podemos proporcionar valores de parámetros predeterminados escribiendo un signo
//  de igual después del tipo y luego proporcionando un valor, así:

func saludar(_ persona: String, formal: Bool = false) {
    if formal {
        print("¡Bienvenido, \(persona)!")
    } else {
        print("¡Hola, \(persona)!")
    }
}

// Ahora podemos llamar a saludar() de dos maneras:


saludar("Tim", formal: true)
saludar("Taylor")

// Manejo de errores en funciones, para manejar errores en funciones, necesitas 
// decirle a Swift qué errores pueden ocurrir, escribir una función que pueda 
// lanzar errores, luego llamarla y manejar cualquier problema.

// Primero, define los errores que pueden ocurrir:

enum ErrorDeContraseña: Error {
    case corta, obvia
}

// A continuación, escribe una función que pueda lanzar errores. Esto se hace 
// colocando throws en el tipo de la función, y luego usando throw para 
// desencadenar errores específicos:

func verificarContraseña(_ contraseña: String) throws -> String {
    if contraseña.count < 5 {
        throw ErrorDeContraseña.corta
    }

    if contraseña == "12345" {
        throw ErrorDeContraseña.obvia
    }

    if contraseña.count < 10 {
        return "OK"
    } else {
        return "Buena"
    }
}

// Ahora llama a la función que lanza mediante un bloque do, llama a la función
// usando try, luego captura los errores que ocurran:

let cadena = "12345"

do {
    let resultado = try verificarContraseña(cadena)
    print("Calificación: \(resultado)")
} catch ErrorDeContraseña.obvia {
    print("¡Tengo la misma combinación en mi maleta!")
} catch {
    print("Hubo un error.")
}

// Cuando se trata de capturar errores, siempre debes tener un bloque catch que 
// pueda manejar todos los tipos de errores.


// ------------ Cierres ------------

// Puedes asignar funcionalidad directamente a una constante o variable de esta manera:

let decirHola = {
    print("¡Hola!")
}

decirHola()

// En ese código, decirHola es un cierre, un fragmento de código que podemos pasar y 
// llamar cuando queramos. Si deseas que el cierre acepte parámetros,
// deben escribirse dentro de las llaves:

let decirHola = { (nombre: String) -> String in
    "¡Hola \(nombre)!"
}

/*
 El in se utiliza para marcar el final de los parámetros y el tipo de retorno; 
 todo después de eso es el cuerpo del cierre en sí mismo.

 Los cierres se utilizan extensamente en Swift. Por ejemplo, hay un método de 
 array llamado filter() que ejecuta todos los elementos del array a través de
 una prueba, y cualquier elemento que devuelva true para la prueba se devuelve 
 en un nuevo array.

 Podemos proporcionar esa prueba usando un cierre, por lo que podríamos filtrar 
 un array para incluir solo nombres que comiencen con T:
*/

let equipo = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let soloT = equipo.filter({ (nombre: String) -> Bool in
    return nombre.hasPrefix("T")
})

/*
Dentro del cierre, listamos el parámetro que filter() nos pasa, que es una cadena 
del array. También decimos que nuestro cierre devuelve un booleano, luego marcamos 
el inicio del código del cierre usando in: después de eso, todo lo demás es código 
de función normal.

Cierres de clausura y sintaxis abreviada Swift tiene algunos trucos bajo la manga 
para hacer que los cierres sean más fáciles de leer. Aquí tienes un código que 
filtra un array para incluir solo nombres que comiencen con "T":
*/

let equipo = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let soloT = equipo.filter({ (nombre: String) -> Bool in
    return nombre.hasPrefix("T")
})

print(soloT)

// Inmediatamente puedes ver que el cuerpo del cierre tiene solo una línea de código, 
// así que podemos eliminar return:

let soloT = equipo.filter({ (nombre: String) -> Bool in
    nombre.hasPrefix("T")
})

// filter() debe recibir una función que acepte un elemento de su array, y devuelva
//  true si debe estar en el array devuelto.

// Dado que la función que pasamos debe comportarse de esa manera, no necesitamos 
// especificar los tipos en nuestro cierre. Entonces, podemos reescribir el código a esto:

let soloT = equipo.filter({ nombre in
    nombre.hasPrefix("T")
})

// Podemos ir más lejos usando una sintaxis especial llamada sintaxis
// de cierre de cierre, que se ve así:

let soloT = equipo.filter {
    $0.hasPrefix("T")
}

// Finalmente, Swift puede proporcionar nombres cortos de parámetros para nosotros, 
// por lo que ya no escribimos nombre en más, y en su lugar confiamos en un valor 
// nombrado especialmente proporcionado para nosotros: $0:

let soloT = equipo.filter {
    $0.hasPrefix("T")
}


// ------------ Estructuras ------------

// Las estructuras nos permiten crear nuestros propios tipos de datos personalizados, 
// completos con sus propias propiedades y métodos:

struct Album {
    let título: String
    let artista: String
    var estáPublicado = true

    func imprimirResumen() {
        print("\(título) por \(artista)")
    }
}

let red = Album(título: "Red", artista: "Taylor Swift")
print(red.título)
red.imprimirResumen()

/*
 Cuando creamos instancias de estructuras, lo hacemos usando un inicializador: 
 Swift nos permite tratar nuestra estructura como una función, pasando parámetros 
 para cada una de sus propiedades. Genera silenciosamente este inicializador por 
 miembros basado en las propiedades de la estructura.

 Si deseas que el método de una estructura cambie una de sus propiedades, 
 márquelo como mutante:
*/

mutating func eliminarDeLaVenta() {
    estáPublicado = false
}


// ------------ Propiedades calculadas ------------

// Una propiedad calculada calcula su valor cada vez que se accede. Por ejemplo, 
// podríamos escribir una estructura Empleado que rastree cuántos días de vacaciones 
// quedaban para ese empleado:

struct Empleado {
    let nombre: String
    var vacacionesAsignadas = 14
    var vacacionesTomadas = 0

    var vacacionesRestantes: Int {
        vacacionesAsignadas - vacacionesTomadas
    }
}

// In order to be able to write on vacations, we need to provide both a getter and a setter:

var vacacionesRestantes: Int {
    get {
        vacacionesAsignadas - vacacionesTomadas
    }

    set {
        vacacionesAsignadas = vacacionesTomadas + newValue
    }
}

// newValue es proporcionado por Swift y almacena cualquier valor que el
// usuario esté asignando a la propiedad.
