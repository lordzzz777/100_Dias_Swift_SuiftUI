import Foundation


// MARK: - Dia 14 Opcionales


/// ***Cómo manejar los datos que faltan con opciones

let  opposites = [
    "Mario":"Wario",
    "Luigi": "Waruigi"
    ]

let peachOpposite = opposites["Peach"]

/// La solución de Swift se llama opcionales, lo que significa datos que podrían estar presentes o no. 
/// Se representan principalmente colocando un signo de interrogación después de su tipo de datos,
/// por lo que en este caso peachOposite sería una cadena. En lugar de una cadena.

/// Los opcionales son como una caja que puede o no tener algo dentro. Entonces, ¿una cuerda?
/// Significa que puede haber una cadena esperando dentro de nosotros, o puede que no haya
/// nada en absoluto - un valor especial llamado nil, que significa "sin valor". Cualquier tipo de
/// datos puede ser opcional, incluyendo Int, Double y Bool,
/// así como instancias de enumeraciones, estructuras y clases.

/// Probablemente estés pensando "así que... ¿qué ha cambiado realmente aquí? 
/// Antes teníamos una cadena, ¿y ahora tenemos una cadena?,
/// pero, ¿cómo cambia eso realmente el código que escribimos?"

/// Bueno, aquí está la clave: a Swift le gusta que nuestro código sea predecible, lo que significa 
/// que no nos deja usar datos que podrían no estar allí. En el caso de los opcionales, eso significa
/// que tenemos que desenvolver el opcional para poder usarlo; tenemos que mirar dentro de la caja
/// para ver si hay un valor y, si lo hay, sacarlo y usarlo.

/// Swift nos da dos formas principales de desenvolver los opcionales, pero la que más verás se ve así:


// Ejeplo 1:

// Este condicional cotrola que en nuestro diccionario tenga valor
// Dado que el valor no es nulo entra en el primer bloque
if let marioOpposite = opposites ["Mario"]{
    print("Mario´s opposite is \(marioOpposite)")
}else {
 print("No existe ninguna cadena de texto con ese nombre")
}

// Ejeplo 2:

// cuando el valor es nulo, ente bloque de codigo entraria en el "else"
var userName: String? = nil

if let unwrappedName = userName{
    print("We got user: \(unwrappedName)")
}else{
    print("The optional was empty")
}


// Funcion que precisa de un valor no opcinal
func square(number: Int) -> Int {
    number * number
}

// variable que contine valor opcional
var number: Int? = nil

// print(square(number: number)) Xcode te dirar que eso es un error

// para poder usar un volor opcinal es necesario desembolverlo
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

/// Antes de que terminemos, quiero mencionar una última cosa: al desenvolver los opcionales,
/// es muy común desenvolverlos en una constante del mismo nombre. Esto está perfectamente
/// permitido en Swift, y significa que no necesitamos 
/// seguir nombrando constantes unwrappedNumber o similar.

/// Usando este enfoque, podríamos reescribir el código anterior a esto:

if let numero = number {
    print(square(number: numero))
}


// MARK: - Cómo desenvolver los opcionales con guard

/// Ya has visto cómo Swift usa if let para desenvolver los opcionales, y es la forma más común de
/// usar los opcionales. Pero hay una segunda forma que hace más o menos lo mismo, y es casi tan común: guardar.

/// Se ve así:

func printSquare(of number: Int?){
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}

/// Como si se deja, la guardia se deja comprobar si hay un valor dentro de un opcional, y si lo hay, 
/// recuperará el valor y lo colocará en una constante de nuestra elección.

/// Sin embargo, la forma en que lo hace cambia las cosas:

/// El guardia está diseñado exactamente para este estilo de programación y, de hecho, hace dos cosas para ayudar:

/// 1. - Si usas guard para comprobar que las entradas de una función son válidas, 
///    Swift siempre te pedirá que uses return si la comprobación falla.

/// 2. - Si el cheque pasa y el opcional que estás desempaquetando tiene un valor en su interior,
///    puede usarlo después de que termine el código de guardia.

/// Puedes ver ambos puntos en acción si miras la función printSquare() de antes

/// Por lo tanto: use "if let" para desenvolver los opcionales para que pueda procesarlos de alguna manera,
/// y use "guard let" para asegurarse de que los opcionales tengan algo dentro de ellos y salir de lo contrario.

/// Consejo: Puedes usar la guardia con cualquier condición, incluidas las que no desenvuelven las opciones.
/// Por ejemplo, podrías usar guard someArray.isEmpty else { return }.

/// Sí, eso es un poco más largo, pero dos cosas importantes han cambiado:

/// Use "if let" si solo desea desenvolver algunos opcionales, y  "guard let" si está comprobando 
/// específicamente que las condiciones son correctas antes de continuar.


// MARK: - Cómo desenvolver los opcionales con la fusión nula

/// Espera... ¿Swift tiene una tercera forma de desenvolver los opcionales? 
/// ¡Sí! Y también es muy útil: se llama el operador de fusión nil y nos permite desenvolver un opcional y
/// proporcionar un valor predeterminado si el opcional estaba vacío.

/// Vamos a retroceder un poco:

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

/// ***let new = captains["Serenity"]

/// Eso lee una clave inexistente en nuestro diccionario de capitanes, lo que significa que nueva será
/// una cadena opcional que se establecerá en nulo.

/// Con el operador de coalescing nil, escrito ??, podemos proporcionar un valor predeterminado para 
/// cualquier opcional, como este:

let new = captains["Serenity"] ?? "N/A"

/// Eso leerá el valor del diccionario de capitanes e intentará desenvolverlo. Si el opcional tiene un valor
/// en su interior, se devolverá y se almacenará en nuevo, pero si no lo tiene, 
/// entonces se utilizará "N/A" en su lugar.

/// Esto significa que no importa lo que contenga el opcional, un valor o nil, el resultado final es que lo
/// nuevo será una cadena real, no opcional. Esa podría ser la cadena desde
/// el interior del valor de los capitanes, o podría ser "N/A".

/// Ahora, sé lo que estás pensando: ¿no podemos especificar un valor predeterminado al leer del diccionario?
///  Si estás pensando que tienes toda la razón:

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

/// Incluso es útil si creas un entero a partir de una cadena, ¿dónde realmente obtienes un Int opcional?
/// Porque la conversión podría haber fallado, es posible que haya proporcionado un entero no válido,
///  como "Hola". Aquí podemos usar la fusión nil para proporcionar un valor predeterminado, como este:

let input = ""
let newNumber = Int(input) ?? 0
print(newNumber)

/// Como puede ver, el operador de fusión nil es útil en cualquier lugar donde tenga un opcional y desee
/// usar el valor dentro o proporcionar un valor predeterminado si falta.


// MARK: - Cómo manejar múltiples opciones usando el encadenamiento opcional

/// El encadenamiento opcional es una sintaxis simplificada para leer opcionales dentro de los opcionales.
/// Eso puede sonar como algo que querrías usar rara vez, pero si te muestro un ejemplo, verás por qué es útil.

/// Echa un vistazo a este código:

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

/// El encadenamiento opcional nos permite decir "si el opcional tiene un valor dentro, desenvuélvelo entonces..."
/// y podemos añadir más código. En nuestro caso, estamos diciendo "si logramos obtener un elemento aleatorio
/// de la matriz, entonces en mayúsculas". Recuerde, randomElement()
/// devuelve un opcional porque la matriz podría estar vacía.

/// La magia del encadenamiento opcional es que silenciosamente no hace nada si el opcional estaba vacío,
/// solo devolverá el mismo opcional que tenías antes, todavía vacío. Esto significa que el valor de retorno de
/// una cadena opcional siempre es opcional, por lo que todavía necesitamos la fusión de cero para
/// proporcionar un valor predeterminado.

/// Las cadenas opcionales pueden ir todo el tiempo que quieras, y tan pronto como cualquier parte se devuelve nil,
/// el resto de la línea de código se ignora y se devuelve nil.

/// Para darte un ejemplo que empuja más el encadenamiento opcional, imagina esto: queremos colocar los libros
/// en orden alfabético según los nombres de sus autores. Si desglosamos esto, entonces:

/// Tenemos una instancia opcional de una estructura de libro: puede que tengamos un libro para ordenar, o puede que no.

/// El libro puede tener un autor o puede ser anónimo.

/// Si tiene una cadena de autor presente, podría ser una cadena vacía o tener texto,
/// por lo que no siempre podemos confiar en que la primera letra esté allí.

/// Si la primera letra está ahí, asegúrese de que esté en mayúsculas para que los autores con nombres en minúsculas,
/// como los ganchos de campana, se ordenen correctamente.

/// Así es como se vería eso:

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

let racers = ["Hamilton", "Verstappen", "Vettel"]
let winnerWasVE = racers.first?.hasPrefix("Ve")


// MARK: - Cómo manejar el fallo de la función con opciones

/// Cuando llamamos a una función que podría arrojar errores, la llamamos usando try y manejamos los errores de 
/// manera adecuada, o si estamos seguros de que la función no fallará, ¡usamos try! Y acepta que si nos equivocamos,
/// nuestro código se bloqueará. (Spoiler: ¡deberías probar! Muy raramente.)

/// Sin embargo, hay una alternativa: si todo lo que nos importa es si la función tuvo éxito o falló, podemos usar un intento 
/// opcional para que la función devuelva un valor opcional. Si la función se ejecuró sin lanzar ningún error, entonces el
/// opcional contendrá el valor devuelto, pero si se lanzó algún error, la función devolverá nula. Esto significa que no
/// llegamos a saber exactamente qué error se lanzó, pero a menudo está bien, puede que nos importe si la función funcionó o no.

/// Así es como se ve:

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

/// La función getUser() siempre lanzará un error de networkFailed, lo cual está bien para nuestros fines de prueba, 
/// pero en realidad no nos importa qué error se lanzó, todo lo que nos importa es si la llamada devolvió a un usuario o no.

/// ¿Aquí es donde lo intentas? Ayuda: hace que getUser() devuelva una cadena opcional, que será nula si se lanza algún error.
/// Si quieres saber exactamente qué error ocurrió, entonces este enfoque no será útil, pero la mayor parte del tiempo
/// simplemente no nos importa.

/// Si quieres, ¿puedes combinarlo? Con coalescing nil, que significa "intentar obtener el valor de retorno de esta función,
/// pero si falla, use este valor predeterminado en su lugar".

/// Sin embargo, ten cuidado: debes añadir algunos paréntesis antes de la fusión de nil para que Swift entienda exactamente
/// lo que quieres decir. Por ejemplo, escribirías esto:

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

/// ¿Encontrarás la oportunidad? Se utiliza principalmente en tres lugares:

/// 1. - En combinación con el protector, ¿se permite salir de la función actual si se intenta? La llamada no devuelve nada.

/// 2. - En combinación con la fusión de cero para intentar algo o proporcionar un valor predeterminado en caso de fallo.

/// 3. - Al llamar a cualquier función de lanzamiento sin un valor de retorno, cuando realmente no le importa si tuvo éxito o no,
///    tal vez esté escribiendo en un archivo de registro o enviando análisis a un servidor, por ejemplo.


// MARK: - Resumen: Opcionales

/// En estos capítulos hemos cubierto una de las características más importantes de Swift, y aunque a la mayoría de la gente 
/// le resulta difícil entender las opciones al principio, casi todo el mundo está de acuerdo en que son útiles en la práctica.

/// Vamos a recapitular lo que hemos aprendido:

///  * Los opcionales nos permiten representar la ausencia de datos, lo que significa que podemos decir
///    "este entero no tiene valor", que es diferente de un número fijo como 0.

///  * Como resultado, todo lo que no es opcional definitivamente tiene un valor en su interior, incluso si eso es solo una cadena vacía.

///  * Desenvolver un opcional es el proceso de mirar dentro de una caja para ver lo que contiene: si hay un valor dentro,
///    se envía de vuelta para su uso, de lo contrario habrá nulo en el interior.

///  * Podemos usar if let para ejecutar algún código si el opcional tiene un valor, o guard let para ejecutar algún código si el
///    opcional no tiene un valor, pero con guard siempre debemos salir de la función después.

///  * El operador de fusión nil, ??, desenvuelve y devuelve un valor opcional, o utiliza un valor predeterminado en su lugar.

///  * El encadenamiento opcional nos permite leer un opcional dentro de otro opcional con una sintaxis conveniente.

///  * Si una función puede lanzar errores, puede convertirla en una opcional usando try? - o bien recuperará el valor de
///    retorno de la función, o nulo si se produce un error.

/// Los opcionales son solo los segundos después de los cierres cuando se trata de características lingüísticas que a la gente
/// le cuesta aprender, ¡pero te prometo que después de unos meses te preguntarás cómo podrías vivir sin ellos!

// MARK: - Reto nº 9


/// Tu desafío es el siguiente: escribe una función que acepte una matriz opcional de enteros y devuelva uno al azar. Si falta la matriz o está vacía, devuelve un número aleatorio en el rango del 1 al 100.

/// Si eso suena fácil, es porque aún no he explicado el traco: quiero que escribas tu función en una sola línea de código. No, eso no significa que debas escribir mucho código y luego eliminar todos los saltos de línea, deberías ser capaz de escribir todo esto en una línea de código.


//Función que retorna un numero aleatorio en el rango del 1 al 100
func numberArray(number: [Int]?) -> Int { return number?.randomElement() ?? .random(in: 1...100) }
