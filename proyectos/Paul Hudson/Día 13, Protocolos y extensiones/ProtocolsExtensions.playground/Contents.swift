import UIKit

// MARK:  Protocolos y extensiones

/// Los protocolos son un poco como los contratos en Swift: nos permiten definir qué tipo de funcionalidad esperamos que admita un tipo de datos, y Swift se asegura de que el resto de nuestro código siga esas reglas.

/// Piensa en cómo podríamos escribir algún código para simular que alguien viaje de su casa a su oficina. Podríamos crear una pequeña estructura de coche y luego escribir una función como esta:



// tren
struct Train{
}

// Autubus
struct Bus{
}

func commute(distance: Int, using vehicle: Car) {
    // lots of code here
}

/// Por supuesto, también podrían viajar en tren, así que también escribiríamos esto:

func commute(distance: Int, using vehicle: Train) {
    // lots of code here
}

/// O podrían viajar en autobús:
func commute(distance: Int, using vehicle: Bus) {
    // lots of code here
}

/// O podrían usar una bicicleta, un scooter eléctrico, un viaje compartido o cualquier otra cantidad de opciones de transporte.

/// La verdad es que a este nivel en realidad no nos importa cómo suceda el viaje subyacente. Lo que nos importa es mucho más amplio: cuánto tiempo podría tardar el usuario en viajar usando cada opción, y cómo realizar el acto real de mudarse a la nueva ubicación.

/// Aquí es donde entran en manos los protocolos: nos permiten definir una serie de propiedades y métodos que queremos usar. No implementan esas propiedades y métodos, en realidad no ponen ningún código detrás de ellos, solo dicen que las propiedades y los métodos deben existir, un poco como un plano.

/// Por ejemplo, podríamos definir un nuevo protocolo de vehículo como este:

protocol Vehicle{
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

/// Vamos a desglosar eso:

/// * Para crear un nuevo protocolo, escribimos un protocolo seguido del nombre del protocolo. Este es un tipo nuevo, por lo que necesitamos usar el caso camel que comience con una letra mayúscula.

/// * Dentro del protocolo enumeramos todos los métodos que necesitamos para que este protocolo funcione de la manera que esperamos.

/// * Estos métodos no contienen ningún código en su interior, no hay cuerpos de funciones proporcionados aquí. En su lugar, estamos especificando los nombres de los métodos, los parámetros y los tipos de retorno. También puedes marcar los métodos como lanzados o mutando si es necesario.

/// Así que hemos hecho un protocolo, ¿cómo nos ha ayudado eso?

/// Bueno, ahora podemos diseñar tipos que funcionen con ese protocolo. Esto significa crear nuevas estructuras, clases o enumeraciones que implementen los requisitos para ese protocolo, que es un proceso que llamamos adopción o conformidad con el protocolo.

/// El protocolo no especifica la gama completa de funcionalidades que debe existir, solo un mínimo. Esto significa que cuando crea nuevos tipos que se ajustan al protocolo, puede agregar todo tipo de otras propiedades y métodos según sea necesario.

/// Por ejemplo, podríamos hacer una estructura de coche que se ajuste al vehículo, como esta:

// Coche
struct Car: Vehicle {
    var name: String
    
    var currentPassengers: Int
    
    func travel(distance: Int) {
        print("Estoy conduciendo \(distance)")
    }
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func openSunroof() {
        print("¡Es un buen día!")
    }
    
    
}

/// Hay algunas cosas a las que quiero llamar la atención en particular en ese código:

/// 1. Le decimos a Swift que el coche se ajusta al vehículo usando dos puntos después del nombre de coche, al igual que marcamos las subclases.

/// 2. Todos los métodos que enumeramos en Vehicle deben existir exactamente en Car. Si tienen nombres ligeramente diferentes, aceptan diferentes parámetros, tienen diferentes tipos de retorno, etc., entonces Swift dirá que no nos hemos ajustado al protocolo.

/// 3. Los métodos en Car proporcionan implementaciones reales de los métodos que definimos en el protocolo. En este caso, eso significa que nuestra estructura proporciona una estimación aproximada de cuántos minutos se tarda en conducir una cierta distancia, e imprime un mensaje cuando se llama a travel().

/// 4. El método openSunroof() no proviene del protocolo Vehicle, y realmente no tiene sentido allí porque muchos tipos de vehículos no tienen techo corredizo. Pero eso está bien, porque el protocolo describe solo la funcionalidad mínima que los tipos que cumplen deben tener, y pueden agregar la suya propia según sea necesario.

/// Por lo tanto, ahora hemos creado un protocolo y hemos hecho una estructura de coche que se ajusta al protocolo.

/// Para terminar, actualicemos la función commute() de antes para que utilice los nuevos métodos que añadimos a Car:

func commute(ditance: Int, using vehicle: Vehicle){
    if vehicle.estimateTime(for: ditance) > 100 {
        print("¡Eso es demasiado lento! Intentaré probar con un vehículo diferente.")
    }else {
        vehicle.travel(distance: ditance)
    }
}

let car = Car(name: "Car", currentPassengers: 5)
commute(ditance: 100, using: car)

/// Todo ese código funciona, pero aquí el protocolo en realidad no está agregando ningún valor. Sí, nos hizo implementar dos métodos muy específicos dentro del coche, pero podríamos haberlo hecho sin añadir el protocolo, así que ¿por qué molestarse?

/// Aquí viene la parte inteligente: Swift sabe que cualquier tipo que cumpla con Vehicle debe implementar tanto los métodos estimateTime() como travel(), por lo que en realidad nos permite usar Vehicle como el tipo de nuestro parámetro en lugar de Car. Podemos reescribir la función a esto:

/// ***  func commute(distance: Int, using vehicle: Vehicle) {

/// Ahora estamos diciendo que esta función se puede llamar con cualquier tipo de datos, siempre y cuando ese tipo se ajuste al protocolo del vehículo. El cuerpo de la función no necesita cambiar, porque Swift sabe con certeza que existen los métodos estimateTime() y travel().

/// Si todavía te estás preguntando por qué esto es útil, considera la siguiente estructura:

struct Bicycle: Vehicle {
    var name: String
    
    var currentPassengers: Int
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("Mi vicicleta \(distance) Km")
    }
}

let bike = Bicycle(name: "Bicyce", currentPassengers: 1)
commute(ditance: 50, using: bike)

/// Ahora tenemos una segunda estructura que también se ajusta a Vehicle, y aquí es donde el poder de los protocolos se hace evidente: ahora podemos pasar un coche o una bicicleta a la función commute(). Internamente, la función puede tener toda la lógica que quiere, y cuando llama a estimateTime() o travel() Swift usará automáticamente la adecuada: si pasamos en un coche, dirá "Estoy conduciendo", pero si pasamos en una bicicleta, dirá "Estoy en bicicleta".

/// Por lo tanto, los protocolos nos permiten hablar sobre el tipo de funcionalidad con la que queremos trabajar, en lugar de los tipos exactos. En lugar de decir "este parámetro debe ser un coche", podemos decir "este parámetro puede ser cualquier cosa, siempre y cuando sea capaz de estimar el tiempo de viaje y moverse a una nueva ubicación".

/// Además de los métodos, también puede escribir protocolos para describir las propiedades que deben existir en los tipos conformes. Para hacer esto, escriba var, luego un nombre de propiedad, luego enumere si debe ser legible y/o escribible.

/// Por ejemplo, podríamos especificar que todos los tipos que conforman el vehículo deben especificar su nombre y cuántos pasajeros tienen actualmente, así:

/*
 protocol Vehicle{
     var name: String { get }
     var currentPassengers: Int { get set }
     func estimateTime(for distance: Int) -> Int
     func travel(distance: Int)
 }
 */
/// Eso añade dos propiedades:

/// 1. Una cadena llamada nombre, que debe ser legible. Eso podría significar que es una constante, pero también podría ser una propiedad calculada con un getter.

/// 2. Un entero llamado currentPassengers, que debe ser de lectura y escritura. Eso podría significar que es una variable, pero también podría ser una propiedad calculada con un getter y un setter.

/// Se requiere una anotación de tipo para ambos, porque no podemos proporcionar un valor predeterminado en un protocolo, al igual que los protocolos no pueden proporcionar implementaciones para los métodos.

/// Con esos dos requisitos adicionales establecidos, Swift nos advertirá que tanto el coche como la bicicleta ya no se ajustan al protocolo porque les faltan las propiedades.



/// Una vez más, sin embargo, podría reemplazarlos con propiedades calculadas siempre y cuando obedezca las reglas; si usa { get set }, entonces no puede ajustarse al protocolo usando una propiedad constante.

/// Así que ahora nuestro protocolo requiere dos métodos y dos propiedades, lo que significa que todos los tipos conformes deben implementar esas cuatro cosas para que nuestro código funcione. Esto a su vez significa que Swift sabe con seguridad que la funcionalidad está presente, por lo que podemos escribir código confiando en ella.

/// Por ejemplo, podríamos escribir un método que acepte una variedad de vehículos y lo utilice para calcular estimaciones en una serie de opciones:


/*
 func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
     for vehicle in vehicles {
         let estimate = vehicle.estimateTime(for: distance)
         print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
     }
 }
 */

/// Espero que eso le muestre el verdadero poder de los protocolos: aceptamos toda una serie del protocolo del vehículo, lo que significa que podemos pasar en un automóvil, una bicicleta o cualquier otra estructura que se ajuste al vehículo, y funcionará automáticamente:

// getTravelEstimates(using: [car, bike], distance: 150)


/// Además de aceptar protocolos como parámetros, también puede devolver protocolos desde una función si es necesario.

/// Consejo: Puede ajustarse a tantos protocolos como necesite, simplemente enumerándolos uno por uno, separados con una coma. Si alguna vez necesita subclasificar algo y ajustarse a un protocolo, debe poner primero el nombre de la clase principal y luego escribir sus protocolos.

// MARK: Opcional: ¿Por qué Swift necesita protocolos?

/// Los protocolos nos permiten definir cómo deben funcionar las estructuras, las clases y las enumeraciones: qué métodos deben tener y qué propiedades deben tener. Swift hará cumplir estas reglas por nosotros, de modo que cuando digamos que un tipo se ajusta a un protocolo, Swift se asegurará de que tenga todos los métodos y propiedades requeridos por ese protocolo.

/// En la práctica, lo que los protocolos nos permiten hacer es tratar nuestros datos en términos más generales. Por lo tanto, en lugar de decir "este método buy() debe aceptar un objeto Book", podemos decir "este método puede aceptar cualquier cosa que se ajuste al protocolo que se puede comprar". Eso podría ser un libro, pero también podría ser una película, un coche, un poco de café, etc.: hace que nuestro método simple sea más flexible, a la vez que garantiza que Swift haga cumplir las reglas para nosotros.

/// En términos de código, nuestro simple método buy() que solo funciona con libros se vería así:

/*
struct Book {
    var name: String
}

func buy(_ book: Book) {
    print("I'm buying \(book.name)")
}
*/
/// Para crear un enfoque más flexible y basado en el protocolo, primero crearíamos un protocolo que declare la funcionalidad básica que necesitamos. Estos podrían ser muchos métodos y propiedades, pero aquí solo vamos a decir que necesitamos una cadena de nombres:

protocol Purchaseable {
    var name: String { get set }
}

/// Ahora podemos seguir adelante y definir tantas estructuras como necesitemos, cada una de las cuales se ajusta a ese protocolo al tener una cadena de nombres:

struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Car2: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

/// Notarás que cada uno de esos tipos tiene una propiedad diferente que no se declaró en el protocolo, y eso está bien: los protocolos determinan la funcionalidad mínima requerida, pero siempre podemos añadir más.

/// Por último, podemos reescribir la función buy() para que acepte cualquier tipo de artículo comprable:

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}

/// Dentro de ese método podemos usar la propiedad de nombre de nuestro artículo de forma segura, porque Swift garantizará que cada artículo que se puede comprar tenga una propiedad de nombre. No garantiza que exista ninguna de las otras propiedades que definimos, solo las que se declaran específicamente en el protocolo.

/// Por lo tanto, los protocolos nos permiten crear planos de cómo nuestros tipos comparten la funcionalidad, y luego usar esos planos en nuestras funciones para que trabajen en una variedad más amplia de datos.


// MARK: - Cómo utilizar los tipos de devolución opacos

/// Swift proporciona una característica realmente oscura, muy compleja, pero realmente importante llamada tipos de retorno opacos, que nos permite eliminar la complejidad de nuestro código. Honestamente, no lo cubriría en un curso para principiantes si no fuera por un hecho muy importante: lo verás inmediatamente tan pronto como crees tu primer proyecto SwiftUI.

/// Importante: No es necesario entender en detalle cómo funcionan los tipos de devolución opacos, solo que existen y hacen un trabajo muy específico. A medida que sigues aquí, puede que empieces a preguntarte por qué esta función es útil, pero créeme: es importante y es útil, ¡así que trata de seguir adelante!

/// Implementemos dos funciones simples:

func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

func getRandomBoll () -> Bool {
    Bool.random()
}

/// Consejo: Bool.random() devuelve verdadero o falso. A diferencia de los enteros aleatorios y los decimales, no necesitamos especificar ningún parámetro porque no hay opciones de personalización.

/// Por lo tanto, getRandomNumber() devuelve un entero aleatorio, y getRandomBool() devuelve un Boolean aleatorio.

/// Tanto Int como Bool se ajustan a un protocolo Swift común llamado Equatable, que significa que "se puede comparar para la igualdad". El protocolo Equatable es lo que nos permite usar ==, así:

print(getRandomNumber() == getRandomNumber())

///Debido a que ambos tipos se ajustan a Equatable, podríamos intentar modificar nuestra función para devolver un valor Equatable, como este:


func getRandomNumber2() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBoll2 () -> some  Equatable {
    Bool.random()
}

/// Sin embargo, ese código no funcionará, y Swift lanzará un mensaje de error que es poco probable que sea útil en este momento de su carrera en Swift: "el protocolo 'Equatable' solo se puede usar como una restricción genérica porque tiene requisitos de tipo propio o asociados". Lo que significa el error de Swift es que devolver Equatable no tiene sentido, y entender por qué no tiene sentido es la clave para entender los tipos de retorno opacos.

/// En primer lugar: sí, puedes devolver los protocolos de las funciones, y a menudo es algo muy útil de hacer. Por ejemplo, podría tener una función que encuentre alquileres de coches para los usuarios: acepta el número de pasajeros que necesita transportar, junto con la cantidad de equipaje que quieren, pero podría devolver una de las varias estructuras: Compacto, SUV, Minivan, etc.

/// Podemos manejar esto devolviendo un protocolo de vehículo que es adoptado por todas esas estructuras, por lo que quienquiera que llame a la función recuperará algún tipo de coche que coincida con su solicitud sin que tengamos que escribir 10 funciones diferentes para manejar todas las variedades de automóviles. Cada uno de esos tipos de automóviles implementará todos los métodos y propiedades del vehículo, lo que significa que son intercambiables; desde una perspectiva de codificación, no nos importa cuál de las opciones obtengamos.

/// Ahora piensa en devolver un Int o un Bool. Sí, ambos se ajustan a Equatable, pero no son intercambiables - no podemos usar == para comparar un Int y un Bool, porque Swift no nos deja independientemente de los protocolos con los que se ajusten.

/// Devolver un protocolo de una función es útil porque nos permite ocultar información: en lugar de indicar el tipo exacto que se está devolviendo, podemos centrarnos en la funcionalidad que se devuelve. En el caso de un protocolo de vehículo, eso podría significar informar sobre el número de asientos, el uso aproximado de combustible y un precio. Esto significa que podemos cambiar nuestro código más tarde sin romper cosas: podríamos devolver un coche de carreras o un camión de recogida, etc., siempre y cuando implementen las propiedades y métodos requeridos por el vehículo.

/// bOcultar información de esta manera es realmente útil, pero simplemente no es posible con Equatable porque no es posible comparar dos cosas diferentes de Equatable. Incluso si llamamos a getRandomNumber() dos veces para obtener dos enteros, no podemos compararlos porque hemos ocultado su tipo de datos exacto; hemos ocultado el hecho de que son dos enteros que en realidad podrían compararse.

/// Aquí es donde entran en adentro los tipos de retorno opacos: nos permiten ocultar información en nuestro código, pero no del compilador de Swift. Esto significa que nos reservamos el derecho de hacer que nuestro código sea flexible internamente para que podamos devolver diferentes cosas en el futuro, pero Swift siempre entiende el tipo de datos real que se devuelve y lo comprobará adecuadamente.

/// BPara actualizar nuestras dos funciones a tipos de retorno opacos, agregue la palabra clave un poco antes de su tipo de retorno, como este:

/// Y ahora podemos llamar a getRandomNumber() dos veces y comparar los resultados usando ==. Desde nuestra perspectiva, todavía solo tenemos algunos datos de Equatable, pero Swift sabe que detrás de escena en realidad son dos enteros.

/// Devolver un tipo de retorno opaco significa que todavía podemos centrarnos en la funcionalidad que queremos devolver en lugar del tipo específico, lo que a su vez nos permite cambiar de opinión en el futuro sin romper el resto de nuestro código. Por ejemplo, getRandomNumber() podría cambiar a usar Double.random(in:) y el código seguiría funcionando muy bien.

/// Pero la ventaja aquí es que Swift siempre conoce el tipo de datos subyacente real. Es una distinción sutil, pero devolver el vehículo significa "cualquier tipo de vehículo, pero no sabemos qué", mientras que devolver algún vehículo significa "un tipo específico de tipo de vehículo, pero no queremos decir cuál".

/// En este punto, espero que tu cabeza esté girando, así que déjame darte un ejemplo real de por qué esto es importante en SwiftUI. SwiftUI necesita saber exactamente qué tipo de diseño quieres mostrar en la pantalla, por lo que escribimos código para describirlo.

/// En inglés, podríamos decir algo como esto: "hay una pantalla con una barra de herramientas en la parte superior, una barra de pestañas en la parte inferior, y en el medio hay una cuadrícula de desplazamiento de iconos de color, cada uno de los cuales tiene una etiqueta debajo que dice lo que significa el icono escrito en una fuente en negrita, y cuando tocas un icono aparece un mensaje".

/// Cuando SwiftUI pide nuestro diseño, esa descripción, todo el asunto, se convierte en el tipo de retorno para el diseño. Tenemos que ser explícitos sobre todo lo que queremos mostrar en la pantalla, incluidas las posiciones, los colores, los tamaños de fuente y más. ¿Te imaginas escribiendo eso como tu tipo de devolución? ¡Sería una milla de largo! Y cada vez que cambias el código para generar tu diseño, tienes que cambiar el tipo de devolución para que coincida.

/// Aquí es donde los tipos de retorno opacos vienen al rescate: podemos devolver el tipo some View, lo que significa que se devolverá algún tipo de pantalla de visualización, pero no queremos tener que escribir su tipo de una milla de largo. Al mismo tiempo, Swift conoce el tipo subyacente real porque así es como funcionan los tipos de retorno opacos: Swift siempre sabe el tipo exacto de datos que se envían de vuelta, y SwiftUI lo usará para crear sus diseños.

/// Como dije al principio, los tipos de retorno opacos son una característica muy oscura, muy compleja, pero muy importante, y no los cubriría en un curso para principiantes si no fuera por el hecho de que se utilizan ampliamente en SwiftUI.

/// Por lo tanto, cuando ves alguna vista en tu código SwiftUI, efectivamente le decimos a Swift "esto va a enviar de vuelta algún tipo de vista para presentarla, pero no quiero escribir lo exacto, lo averiguas por ti mismo".


// MARK: - Cómo crear y usar extensiones

/// Las extensiones nos permiten añadir funcionalidad a cualquier tipo, ya sea que lo hayamos creado o que alguien más lo haya creado, incluso uno de los propios tipos de Apple.

/// Para demostrar esto, quiero presentarte un método útil en las cuerdas, llamado trimmingCharacters(en:). Esto elimina ciertos tipos de caracteres del principio o del final de una cadena, como letras alfanuméricas, dígitos decimales o, más comúnmente, espacios en blanco y nuevas líneas.

/// Los espacios en blanco son el término general del carácter de espacio, el carácter de tabular y una variedad de otras variantes de esos dos. Las nuevas líneas son saltos de línea en el texto, lo que puede sonar simple, pero en la práctica, por supuesto, no hay una sola forma de hacerlas, por lo que cuando pedimos recortar nuevas líneas, se encargará automáticamente de todas las variantes para nosotros.

/// Por ejemplo, aquí hay una cadena que tiene espacios en blanco a cada lado:

var quote = "   La verdad rara vez es pura y nunca simple   "

/// Si quisiéramos recortar el espacio en blanco y las nuevas líneas a cada lado, podríamos hacerlo así:

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

/// El valor .whitespacesAndNewlines proviene de la API de Foundation de Apple, y en realidad también lo hace trimmingCharacters(in:) - como dije al principio de este curso, ¡Foundation está realmente lleno de código útil!

/// Tener que llamar a trimmingCharacters(in:) cada vez es un poco prolija, así que vamos a escribir una extensión para acortarla:

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}


/// Vamos a desglosar eso...

/// 1. Comenzamos con la palabra clave de la extensión, que le dice a Swift que queremos añadir funcionalidad a un tipo existente.

/// 2. ¿Qué tipo? Bueno, eso viene después: queremos añadir funcionalidad a String.

/// 3. Ahora abrimos un corsé, y todo el código hasta que el corsé de cierre final esté allí para ser añadido a las cuerdas.

/// 4. Estamos añadiendo un nuevo método llamado trimmed(), que devuelve una nueva cadena.

/// 5. Dentro de allí llamamos al mismo método que antes: trimmingCharacters(in:), enviando de vuelta su resultado.

/// 6. Observe cómo podemos usar el auto aquí, que se refiere automáticamente a la cadena actual. Esto es posible porque actualmente estamos en una extensión de cadena.

/// Y ahora, en todas partes donde queramos eliminar los espacios en blanco y las nuevas líneas, podemos escribir lo siguiente:

let trimmed2 = quote.trimmed()

/// ¡Mucho más fácil!

/// Eso ha ahorrado algo de escritura, pero ¿es mucho mejor que una función normal?

/// Bueno, la verdad es que podríamos haber escrito una función como esta:

func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

/// Luego lo usé así:

let trimmed3 = trim(quote)

/// Eso es menos código que usar una extensión, tanto en términos de hacer la función como de usarla. Este tipo de función se llama función global, porque está disponible en todas partes de nuestro proyecto.

/// Sin embargo, la extensión tiene una serie de beneficios sobre la función global, que incluyen:

/// 1. Cuando escribes una cita. Xcode muestra una lista de métodos en la cadena, incluidos todos los que añadimos en extensiones. Esto hace que nuestra funcionalidad adicional sea fácil de encontrar.

/// 2. Escribir funciones globales hace que su código sea bastante desordenado: son difíciles de organizar y de rastrear. Por otro lado, las extensiones se agrupan naturalmente por el tipo de datos que están ampliando.

/// 3. Debido a que sus métodos de extensión son una parte completa del tipo original, obtienen acceso completo a los datos internos del tipo. Eso significa que pueden usar propiedades y métodos marcados con control de acceso privado, por ejemplo.

/// Además, las extensiones facilitan la modificación de los valores en su lugar, es decir, cambiar un valor directamente, en lugar de devolver un nuevo valor.

/// Por ejemplo, antes escribimos un método trimmed() que devuelve una nueva cadena con espacios en blanco y nuevas líneas eliminadas, pero si queríamos modificar la cadena directamente, podríamos añadir esto a la extensión:

/*
mutating func trim() {
    self = self.trimmed()
}
*/
/// Debido a que la cadena de comillas se creó como una variable, podemos recortarla en su lugar de esta manera:

// quote.trim()

/// Observe cómo el método tiene un nombre ligeramente diferente ahora: cuando devolvemos un nuevo valor usamos trimmed(), pero cuando modificamos la cadena directamente usamos trim(). Esto es intencional y forma parte de las directrices de diseño de Swift: si está devolviendo un nuevo valor en lugar de cambiarlo en su lugar, debe usar terminaciones de palabras como ed o ing, como reversed().

/// Consejo: Anteriormente te presenté el método sorted() en las matrices. Ahora que conoces esta regla, debes darte cuenta de que si creas una matriz variable, puedes usar sort() en ella para ordenar la matriz en su lugar en lugar de devolver una nueva copia.

/// También puede usar extensiones para agregar propiedades a los tipos, pero hay una regla: solo deben ser propiedades calculadas, no propiedades almacenadas. La razón de esto es que agregar nuevas propiedades almacenadas afectaría el tamaño real de los tipos de datos; si añadiéramos un montón de propiedades almacenadas a un entero, entonces cada número entero en todas partes tendría que ocupar más espacio en la memoria, lo que causaría todo tipo de problemas.

/// Afortunadamente, todavía podemos hacer mucho usando propiedades computadas. Por ejemplo, una propiedad que me gusta añadir a las cadenas se llama líneas, que divide la cadena en una matriz de líneas individuales. Esto envuelve otro método de cadena llamado components (separatedBy:), que divide la cadena en una matriz de cadenas dividiéndola en un límite de nuestra elección. En este caso, nos gustaría que ese límite sean nuevas líneas, por lo que añadiríamos esto a nuestra extensión de cadena:

/*
var lines: [String] {
    self.components(separatedBy: .newlines)
}

*/

/// Con eso en su lugar, ahora podemos leer la propiedad de las líneas de cualquier cadena, así:

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

// print(lyrics.lines.count)


/// Ya sean líneas individuales o piezas complejas de funcionalidad, las extensiones siempre tienen el mismo objetivo: hacer que su código sea más fácil de escribir, más fácil de leer y más fácil de mantener a largo plazo.

/// Antes de que terminemos, quiero mostrarte un truco realmente útil cuando trabajas con extensiones. Has visto anteriormente cómo Swift genera automáticamente un inicializador por miembros para estructuras, como esta:

struct Book2 {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

// let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

/// También mencioné que crear tu propio inicializador significa que Swift ya no nos proporcionará el miembro. Esto es intencional, porque un inicializador personalizado significa que queremos asignar datos basados en alguna lógica personalizada, como esta:


struct Book3 {
    let title: String
    let pageCount: Int
    let readingHours: Int

    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

/// Si Swift mantuviera el inicializador por miembros en este caso, omitiría nuestra lógica para calcular el tiempo de lectura aproximado.

/// Sin embargo, a veces quieres ambas cosas: quieres la capacidad de usar un inicializador personalizado, pero también conservar el inicializador automático por miembros de Swift. En esta situación, vale la pena saber exactamente lo que está haciendo Swift: si implementamos un inicializador personalizado dentro de nuestra estructura, entonces Swift desactiva el inicializador automático por miembros.

/// Ese pequeño detalle adicional podría darte una pista sobre lo que viene a continuación: si implementamos un inicializador personalizado dentro de una extensión, entonces Swift no desactivará el inicializador automático por miembros. Esto tiene sentido si lo piensas: si agregar un nuevo inicializador dentro de una extensión también deshabilitó el inicializador predeterminado, un pequeño cambio de nosotros podría romper todo tipo de otro código Swift.

/// Por lo tanto, si quisiéramos que nuestra estructura de libros tuviera el inicializador predeterminado por miembro, así como nuestro inicializador personalizado, colocaríamos el personalizado en una extensión, como esta:

extension Book2 {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}


// MARK: - ¿Cuándo deberías usar extensiones en Swift?

/// Las extensiones nos permiten agregar funcionalidad a clases, estructuras y más, lo que es útil para modificar los tipos que no poseemos, tipos que fueron escritos por Apple o por otra persona, por ejemplo. Los métodos añadidos usando extensiones son indistinguibles de los métodos que originalmente formaban parte del tipo, pero hay una diferencia en las propiedades: las extensiones no pueden agregar nuevas propiedades almacenadas, solo propiedades calculadas.

/// Las extensiones también son útiles para organizar nuestro propio código, y aunque hay varias formas de hacer esto, quiero centrarme en dos aquí: la agrupación de conformidad y la agrupación de propósitos.

/// La agrupación de conformidad significa agregar una conformidad de protocolo a un tipo como una extensión, agregando todos los métodos requeridos dentro de esa extensión. Esto hace que sea más fácil entender cuánto código necesita un desarrollador mantener en su cabeza mientras lee una extensión: si la extensión actual agrega soporte para Printable, no encontrará métodos de impresión mezclados con métodos de otros protocolos no relacionados.

/// Por otro lado, la agrupación de propósitos significa crear extensiones para hacer tareas específicas, lo que facilita el trabajo con tipos grandes. Por ejemplo, es posible que tenga una extensión específicamente para manejar la carga y el guardado de ese tipo.

/// Vale la pena añadir aquí que muchas personas se dan cuenta de que tienen una clase grande y tratan de hacerla más pequeña dividiéndola en extensiones. Para que quede claro: el tipo es exactamente del mismo tamaño que antes, está perfectamente dividido. Esto significa que es probable que sea un poco más fácil de entender, pero no significa que la clase sea más pequeña.



// MARK: - Cómo crear y usar extensiones de protocolo

/// Los protocolos nos permiten definir los contratos a los que deben adherirse los tipos conformes, y las extensiones nos permiten añadir funcionalidad a los tipos existentes. Pero, ¿qué pasaría si pudiéramos escribir extensiones en los protocolos?

/// Bueno, no te preguntes más porque Swift admite exactamente esto usando las extensiones de protocolo con el nombre adecuado: podemos extender un protocolo completo para agregar implementaciones de métodos, lo que significa que cualquier tipo que se ajuste a ese protocolo obtiene esos métodos.

/// Empecemos con un ejemplo trivial. Es muy común escribir una condición comprobando si una matriz tiene algún valor, como este:

let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

/// ¡Algunas personas prefieren usar el booleano! Operador, así:


if !guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

/// ¿Realmente no soy un gran fanático de ninguno de esos enfoques, porque simplemente no me leen de forma natural "si no, alguna matriz está vacía"?

/// Podemos arreglar esto con una extensión muy simple para Array, como esta:

extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

/// Consejo: Los playgrounds de Xcode ejecutan su código de arriba a abajo, así que asegúrate de poner esa extensión antes de donde se usa.

/// Ahora podemos escribir un código que creo que es más fácil de entender:

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

/// Pero podemos hacerlo mejor. Verás, acabamos de añadir isNotEmpty a las matrices, pero ¿qué pasa con los conjuntos y los diccionarios? Claro, podríamos repetirnos y copiar el código en extensiones para esos, pero hay una solución mejor: Array, Set y Dictionary se ajustan a un protocolo integrado llamado Collection, a través del cual obtienen funcionalidades como contains(), sorted(), reversed() y más.

/// Esto es importante, porque la colección también es lo que requiere que exista la propiedad isEmpty. Por lo tanto, si escribimos una extensión en Collection, todavía podemos acceder a isEmpty porque es necesario. Esto significa que podemos cambiar Array a Collection en nuestro código para obtener esto:

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

/// Con ese cambio de palabra en su lugar, ahora podemos usar isNotEmpty en matrices, conjuntos y diccionarios, así como en cualquier otro tipo que se ajuste a la Colección. Lo creas o no, esa pequeña extensión existe en miles de proyectos de Swift porque a muchas otras personas les resulta más fácil de leer.

/// Lo que es más importante, al ampliar el protocolo estamos agregando una funcionalidad que de otro modo tendría que hacerse dentro de estructuras individuales. Esto es realmente poderoso y conduce a una técnica que Apple llama programación orientada al protocolo: podemos enumerar algunos métodos requeridos en un protocolo y luego agregar implementaciones predeterminadas de los que están dentro de una extensión de protocolo. Todos los tipos conformes luego usan esas implementaciones predeterminadas, o proporcionan las suyas propias según sea necesario.

/// Por ejemplo, si tuviéramos un protocolo como este:

protocol Person {
    var name: String { get }
    func sayHello()
}

/// Eso significa que todos los tipos conformes deben agregar un método sayHello(), pero también podemos agregar una implementación predeterminada de eso como una extensión como esta:

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

/// Y ahora los tipos que se conforman pueden agregar su propio método sayHello() si lo desean, pero no es necesario, siempre pueden confiar en el que se proporciona dentro de nuestra extensión de protocolo.

/// Por lo tanto, podríamos crear un empleado sin el método sayHello():

struct Employee: Person {
    let name: String
}

/// Pero debido a que se ajusta a Person, podríamos usar la implementación predeterminada que proporcionamos en nuestra extensión:

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

/// Swift utiliza mucho las extensiones de protocolo, pero honestamente no necesitas entenderlas con gran detalle todavía: puedes crear aplicaciones fantásticas sin necesidad de usar una extensión de protocolo. ¡En este punto sabes que existen y eso es suficiente!



// MARK: - ¿Cuándo son útiles las extensiones de protocolo en Swift?

/// Las extensiones de protocolo se utilizan en todas partes en Swift, por lo que a menudo lo verás descrito como un "lenguaje de programación orientado al protocolo". Los usamos para agregar funcionalidad directamente a los protocolos, lo que significa que no necesitamos copiar esa funcionalidad a través de muchas estructuras y clases.

/// Por ejemplo, las matrices de Swift tienen un método allSatisfy() que devuelve true si todos los elementos de la matriz pasan una prueba. Por lo tanto, podríamos crear una matriz de números y comprobar que todos estén pares:

let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2) }

/// Eso es muy útil, pero ¿no sería más útil si también funcionara en sets? Claro que lo haría, y por eso lo hace:

let numbers2 = Set([4, 8, 15, 16])
let allEven2 = numbers2.allSatisfy { $0.isMultiple(of: 2) }

/// El principio subyacente es idéntico: pase cada elemento de la matriz o conjunto a través de una prueba que proporcione, y si eso devuelve verdadero para todos los elementos, entonces el resultado del método es verdadero.

/// ¿Qué hay de los diccionarios? ¿Pueden usar esto también? Claro que pueden, y funciona de manera idéntica: cada par clave/valor se pasa al cierre, y debes devolver verdadero o falso. Se ve así:

let numbers3 = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let allEven3 = numbers3.allSatisfy { $0.value.isMultiple(of: 2) }

/// Por supuesto, los desarrolladores de Swift no quieren escribir este mismo código una y otra vez, por lo que usaron una extensión de protocolo: escribieron un solo método allSatisfy() que funciona en un protocolo llamado Sequence, al que se ajustan todas las matrices, conjuntos y diccionarios. Esto significó que el método allSatisfy() estuvo inmediatamente disponible en todos esos tipos, compartiendo exactamente el mismo código.



// MARK: - Resumen: Protocolos y extensiones

/// En estos capítulos hemos cubierto algunas características complejas pero poderosas de Swift, pero no te sientas mal si has luchado un poco: estas son realmente difíciles de entender al principio, y solo se hundirán realmente una vez que hayas tenido tiempo de probarlas en tu propio código.

/// Vamos a recapitular lo que hemos aprendido:

/// * Los protocolos son como contratos de código: especificamos las funciones y los métodos que requerimos, y los tipos conformes deben implementarlos.

/// ** Los tipos de devolución opacos nos permiten ocultar alguna información en nuestro código. Eso podría significar que queremos mantener la flexibilidad para cambiar en el futuro, pero también significa que no necesitamos escribir tipos de retorno gigantescos.

/// **Las extensiones nos permiten añadir funcionalidad a nuestros propios tipos personalizados o a los tipos integrados de Swift. Esto podría significar agregar un método, pero también podemos agregar propiedades calculadas.

/// **Las extensiones de protocolo nos permiten agregar funcionalidad a muchos tipos a la vez: podemos agregar propiedades y métodos a un protocolo, y todos los tipos conformes tienen acceso a ellos.

/// Cuando llegamos a eso, estas características parecen fáciles, pero no lo son. Necesitas conocerlos, saber que existen, pero necesitas usarlos solo superficialmente para continuar tu viaje de aprendizaje.


// MARK: - Punto de control 8

/// Ahora que entiendes cómo funcionan los protocolos y las extensiones, es hora de pausar nuestro aprendizaje y asumir un desafío para que puedas ponerlo todo en práctica.

/// Su desafío es el siguiente: hacer un protocolo que describa un edificio, agregar varias propiedades y métodos, luego crear dos estructuras, House y Office, que se ajusten a él. Su protocolo debe requerir lo siguiente:

/// 1. - Una propiedad que almacena cuántas habitaciones tiene.

/// 2. - Una propiedad que almacena el costo como un número entero (por ejemplo, 500.000 para un edificio que cuesta 500.000 dólares).

/// 3. - Una propiedad que almacena el nombre del agente inmobiliario responsable de la venta del edificio.

/// 4. - Un método para imprimir el resumen de ventas del edificio, describiendo lo que es junto con sus otras propiedades.

///Te daré algunos consejos en un momento, pero primero te recomiendo que lo pruebes tú mismo.

protocol VentaInmueble {
    var havitaciones: Int {get set}
    var precio: Int {get set}
    var agente: String { get set}
    func printingSummary()
}

struct House: VentaInmueble {
    var havitaciones: Int
    
    var precio: Int
    
    var agente: String
    
    func printingSummary() {
        print("El ajente de ventas se llama \(agente)")
        print("El inmueble tiene \(havitaciones) havitaciones")
        print("Su precio es de \(precio) €")
    }
}

let house = House(havitaciones: 4, precio: 170_000, agente: "Marcos")
print(house.printingSummary())

struct Office: VentaInmueble {
    var havitaciones: Int
    
    var precio: Int
    
    var agente: String
    
    func printingSummary() {
        print("El ajente de ventas se llama \(agente)")
        print("El inmueble tiene \(havitaciones) departamentos")
        print("Su precio es de \(precio) €")
    }
}

let offices = Office(havitaciones: 3, precio: 80_000, agente: "Manuel")
print(offices.printingSummary())
