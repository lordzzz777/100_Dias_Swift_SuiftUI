import Foundation

// MARK: - Cómo crear tus propias clases

class Game {
    var score = 0 {
        didSet{
            print("Score is naw \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

/// en este caso una clase no difiere mucho de una estructura, y puede parecer redundantes
/// pero a medida que se abance se irá viendo las diferencia y los necesarias que son


// MARK: - ¿Por qué Swift tiene tanto clases como estructuras?

/// Las clases y estructuras dan a los desarrolladores de Swift la capacidad de crear tipos personalizados y complejos con propiedades y métodos, pero tienen cinco diferencias importantes:

/// * Las clases no vienen con inicializadores sintetizados por miembros.

/// * Una clase se puede construir sobre ("heredar de") otra clase, ganando sus propiedades y métodos.

/// * Las copias de las estructuras siempre son únicas, mientras que las copias de las clases en realidad apuntan a los mismos datos compartidos.

/// * Las clases tienen desinicializadores, que son métodos que se llaman cuando se destruye una instancia de la clase, pero las estructuras no.

/// * Las propiedades variables en clases constantes se pueden modificar libremente, pero las propiedades variables en estructuras constantes no pueden.

/// Pronto explicaré estas diferencias con más detalle, pero el punto es que existen y que importan. La mayoría de los desarrolladores de Swift prefieren usar estructuras en lugar de clases cuando sea posible, lo que significa que cuando eliges una clase en lugar de una estructura, lo estás haciendo porque quieres uno de los comportamientos anteriores.

// MARK: - ¿Por qué las clases de Swift no tienen un inicializador por miembros?

/// Una de las muchas características útiles de la estructura de Swift es que vienen con un inicializador sintetizado por miembros, lo que nos permite crear nuevas instancias de la estructura con solo especificar sus propiedades. Sin embargo, las clases de Swift no tienen esta función, lo cual es molesto, pero ¿por qué no la tienen?

/// La razón principal es que las clases tienen herencia, lo que haría que fuera difícil trabajar con los inicializadores de los miembros. Piénsalo: si construyera una clase de la que heredaste, y luego agregara algunas propiedades a mi clase más tarde, tu código se rompería: todos esos lugares en los que confiaste en mi inicializador de miembros de repente ya no funcionarían.

/// Por lo tanto, Swift tiene una solución simple: en lugar de generar automáticamente un inicializador por miembros, los autores de las clases deben escribir su propio inicializador a mano. De esta manera, puede agregar propiedades tanto como desee sin afectar al inicializador de su clase, y sin afectar a otros que heredan de su clase. Y cuando decides cambiar tu inicializador, lo estás haciendo tú mismo y, por lo tanto, eres plenamente consciente de las implicaciones para cualquier clase que herede.



// MARK: - Cómo hacer que una clase herede de otra

/// Para hacer que una clase herede de otra, escriba dos puntos después del nombre de la clase secundaria y luego agregue el nombre de la clase principal. Por ejemplo, aquí hay una clase de empleado con una propiedad y un inicializador:


class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    // metodo para ser heredado por las demas clases
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

/// Podríamos hacer dos subclases de empleado, cada una de las cuales ganará la propiedad de horas y el inicializador:
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    /// si quisiéramos que los desarrolladores tuvieran un método printSummary() único, añadiríamos esto a la clase de desarrollador:
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

/// Podríamos hacer dos subclases de empleado, cada una de las cuales ganará la propiedad de horas y el inicializador:
class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

/// si creamos una instancia de cada uno y llamamos a work(), obtendremos un resultado diferente:

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

/// se llama al metodo alojado en la clase padre "Employee", desde la clase hija " Developer"
let novall = Developer(hours: 8)
novall.printSummary()


/// Las cosas se complican un poco más cuando quieres cambiar un método que heredaste. Por ejemplo, acabamos de poner printSummary() en Employee, pero tal vez una de esas clases hijas quiera un comportamiento ligeramente diferente.

/// Aquí es donde Swift hace cumplir una regla simple: si una clase secundaria quiere cambiar un método de una clase principal, debe usar override en la versión de la clase secundaria. Esto hace dos cosas:

///   1º Si intenta cambiar un método sin usar la anulación, Swift se negará a construir su código.
///     Esto te impide anular accidentalmente un método.

///   2º Si usas override pero tu método en realidad no anula algo de la clase principal, Swift se negará a
///     construir tu código porque probablemente cometiste un error.


// MARK: - Cómo añadir inicializadores para las clases


// clase padre
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}


// Clase coche hija
class coche: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool ,isConvertible: Bool) {
        self.isConvertible = isConvertible
        /// Le pasamos de la super clase su propio inicializador
        /// en caso de no pasarle Xcode te dara un error --> "'super.init' isn't called on all paths before returning from initializer"
        super .init(isElectric: isElectric )
    }
}

/// Consejo: Si una subclase no tiene ninguno de sus propios inicializadores, hereda automáticamente los inicializadores de su clase principal.



// MARK: Cómo copiar clases


///  En Swift, todas las copias de una instancia de clase comparten los mismos datos, lo que significa que cualquier cambio que realice en una copia cambiará automáticamente las otras copias. Esto sucede porque las clases son tipos de referencia en Swift, lo que significa que todas las copias de una clase se refieren al mismo grupo de datos subyacente.

/// Para ver esto en acción, prueba esta sencilla clase:

class User {
    var username = "Anonymous"
    
    /// Ahora podemos llamar de forma segura a copy() para obtener un objeto con los mismos datos iniciales, pero cualquier cambio futuro no afectará al original.
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

/// creo intacia de la clase User

var user1 = User()

/// Entonces podríamos tomar una copia de user1 y cambiar el valor del nombre de usuario:
var user2 = user1
user2.username = "Manuelita Marquez"

// imprimiendo las copias

print(user1.username)
print(user2.username)

// como puedes ver son diferentes ...

/// una característica muy importante, porque es lo que nos permite compartir datos comunes en todas las partes de nuestra aplicación


// MARK: ¿Por qué las copias de una clase comparten sus datos?

/// Una característica de Swift que es realmente confusa al principio es cómo los comportamientos de sus clases y estructuras difieren cuando se copian: las copias de la misma clase comparten sus datos subyacentes, lo que significa que cambiar uno los cambia a todos, mientras que las estructuras siempre tienen sus propios datos únicos, y cambiar una copia no afecta a los demás.

/// El término técnico para esta distinción es "tipos de valor frente a tipos de referencia". Las estructuras son tipos de valores, lo que significa que tienen valores simples como el número 5 o la cadena "hola". No importa cuántas propiedades o métodos tenga tu estructura, todavía se considera un valor simple como un número. Por otro lado, las clases son tipos de referencia, lo que significa que se refieren a un valor en otro lugar.

/// Para los tipos de valores, esto es bastante fácil de entender que es evidente. Por ejemplo, mira este código:

var message = "Welcome"
var greeting = message
greeting = "Hello"

/// Cuando se ejecute ese código, el mensaje seguirá estableciendo en "Bienvenido", pero el saludo se establecerá en "Hola". Como dice Chris Eidhof, "esto es tan natural que parece afirmar lo obvio". (https://chris.eidhof.nl/post/structs-and-mutation-in-swift/) Pero así es como se comportan las estructuras: su valor está completamente contenido dentro de su variable, y de alguna manera no se comparte con otros valores. Esto significa que todos sus datos se almacenan directamente en cada variable, por lo que cuando los copias, obtienes una copia profunda de todos los datos.

/// Por el contrario, la mejor manera de pensar en un tipo de referencia es que es como una señal que apunta a algunos datos. Si creamos una instancia de una clase, ocupará algo de memoria en tu iPhone, y la variable que almacena la instancia es en realidad solo una señal de la memoria real donde vive el objeto. Si tomas una copia del objeto, obtienes una nueva señal, pero aún así apunta a la memoria donde vive el objeto original. Esta es la razón por la que cambiar una instancia de una clase las cambia a todas: todas las copias del objeto son señales que apuntan a la misma pieza de memoria.

///  Es difícil sobreestimar lo importante que es esta diferencia en el desarrollo de Swift. Anteriormente mencioné que los desarrolladores de Swift prefieren usar estructuras para sus tipos personalizados, y este comportamiento de copia es una gran razón. Imagina si tuvieras una gran aplicación y quisieras compartir un objeto de usuario en varios lugares, ¿qué pasaría si uno de esos lugares cambiara a tu usuario? Si estuvieras usando una clase, todos los demás lugares que usaron a tu usuario cambiarían sus datos sin darte cuenta, y podrías terminar con problemas. Pero si estuvieras usando una estructura, cada parte de tu aplicación tiene su propia copia de los datos y no se puede cambiar por sorpresa.

/// Al igual que con muchas cosas en la programación, las decisiones que tomes deberían ayudar a transmitir un poco de tu razonamiento. En este caso, usar una clase en lugar de una estructura envía un mensaje fuerte de que quieres que los datos se compartan de alguna manera, en lugar de tener muchas copias distintas.



// MARK: Cómo crear un desinicializador para una clase

/// A las clases de Swift se les puede dar opcionalmente un desinicializador, que es un poco como lo opuesto a un inicializador, ya que se llama cuando se destruye el objeto en lugar de cuando se crea.

/// Esto viene con algunas pequeñas condiciones:

/// * Al igual que los inicializadores, no usas func con desinicializadores, son especiales.

/// * Los desinicializadores nunca pueden tomar parámetros o devolver datos y, como resultado, ni siquiera se escriben      con paréntesis.

/// * Su desinicializador se llamará automáticamente cuando se destruya la copia final de una instancia de clase. Eso  
///   podría significar que se creó dentro de una función que ahora se está terminando, por ejemplo.

/// * Nunca llamamos directamente a los desinicializadores; el sistema los maneja automáticamente.

/// * Las estructuras no tienen desinicializadores, porque no puedes copiarlas.

/// Exactamente cuándo se llaman a tus desinicializadores depende de lo que estés haciendo, pero en realidad se reduce a un concepto llamado alcance. Alcance más o menos significa "el contexto en el que la información está disponible", y ya has visto muchos ejemplos:

/// * Si creas una variable dentro de una función, no puedes acceder a ella desde fuera de la función.

/// * Si creas una variable dentro de una condición if, esa variable no está disponible fuera de la condición.

/// * Si creas una variable dentro de un bucle for, incluyendo la variable de bucle en sí, no puedes usarla fuera del bucle.

/// Si miras el panorama general, verás que cada uno de ellos usa llaves para crear su alcance: las condiciones, los bucles y las funciones crean alcances locales.

/// Cuando un valor sale del ámbito, queremos decir que el contexto en el que se creó va a desaparecer. En el caso de las estructuras, eso significa que los datos están siendo destruidos, pero en el caso de las clases, significa que solo una copia de los datos subyacentes va a desaparecer; todavía podría haber otras copias en otro lugar. Pero cuando la copia final desaparece, cuando se destruye la última constante o variable que apunta a una instancia de clase, entonces los datos subyacentes también se destruyen y la memoria que estaba usando se devuelve al sistema.

// MARK: - ¿Por qué las clases tienen desinicializadores y las estructuras no?

/// Una característica pequeña pero importante de las clases es que pueden tener una función de desinicialización, una contraparte de init() que se ejecuta cuando se destruye la instancia de clase. Las estructuras no tienen desinicializadores, lo que significa que no podemos decir cuándo se destruyen.

/// El trabajo de los desinicializadores es decirnos cuándo se destruyó una instancia de clase. Para las estructuras, esto es bastante simple: la estructura se destruye cuando lo que la posee ya no existe. Por lo tanto, si creamos una estructura dentro de un método y los métodos terminan, la estructura se destruye.

/// Sin embargo, las clases tienen un comportamiento de copia complejo que significa que pueden existir varias copias de la clase en varias partes de su programa. Todas las copias apuntan a los mismos datos subyacentes, por lo que ahora es mucho más difícil decir cuándo se destruye la instancia de clase real, cuando la variable final que apunta a ella ha desaparecido.

/// Detrás de escena, Swift realiza algo llamado conteo automático de referencias, o ARC. ARC rastrea cuántas copias de cada instancia de clase existe: cada vez que toma una copia de una instancia de clase, Swift agrega 1 a su recuento de referencias, y cada vez que se destruye una copia, Swift resta 1 de su recuento de referencias. Cuando el recuento llega a 0, significa que ya nadie se refiere a la clase, y Swift llamará a su desinicializador y destruirá el objeto.

/// Por lo tanto, la simple razón por la que las estructuras no tienen desinicializadores es porque no los necesitan: cada estructura tiene su propia copia de sus datos, por lo que no tiene que pasar nada especial cuando se destruye.

/// Puedes poner tu desinicializador en cualquier lugar que quieras en tu código, pero me encanta esta cita de Anne Cahalan: "El código debe leerse como oraciones, lo que me hace pensar que mis clases deberían leerse como capítulos. Así que el desinicializador va al final, ¡es la ~aleta~ de la clase!"


// MARK: - Cómo trabajar con variables dentro de las clases

/// Las clases de Swift funcionan un poco como señales: cada copia de una instancia de clase que tenemos es en realidad una señal que apunta a la misma pieza de datos subyacente. Sobre todo, esto importa debido a la forma en que cambiar una copia cambia todas las demás, pero también importa debido a la forma en que las clases tratan las propiedades variables.

/// Este pequeño ejemplo de código demuestra cómo funcionan las cosas:

class UserName {
    var name = "Paul"
}

let userName = UserName()
userName.name = "Taylor"
print(userName.name)

/// Eso crea una instancia de usuario constante, pero luego la cambia: cambia el valor constante. Eso es malo, ¿verdad?

/// Excepto que no cambia el valor constante en absoluto. Sí, los datos dentro de la clase han cambiado, pero la instancia de la clase en sí, el objeto que creamos, no ha cambiado y, de hecho, no se puede cambiar porque la hicimos constante.

/// Piénsalo así: creamos una señal constante que apunta hacia un usuario, pero borramos la etiqueta de nombre de ese usuario y escribimos con un nombre diferente. El usuario en cuestión no ha cambiado, la persona todavía existe, pero una parte de sus datos internos ha cambiado.

/// Ahora, si hubiéramos hecho que la propiedad del nombre fuera una constante usando let, entonces no se podría cambiar: tenemos una señal constante que apunta a un usuario, pero hemos escrito su nombre en tinta permanente para que no se pueda borrar.

/// Por el contrario, ¿qué sucede si hacemos tanto la instancia de usuario como las variables de propiedad del nombre? Ahora podríamos cambiar la propiedad, pero también podríamos cambiar a una instancia de usuario completamente nueva si quisiéramos. Para continuar con la analogía de la señal, sería como girar la señal para apuntar a una persona completamente diferente.

/// Pruébalo con este código:


class UserName2 {
    var name = "Paul"
}

var userName2 = UserName2()
userName2.name = "Taylor"
userName2 = UserName2()
print(userName2.name)

/// Eso terminaría imprimiendo "Paul", porque a pesar de que cambiamos el nombre a "Taylor", luego sobrescribimos todo el objeto del usuario con uno nuevo, restableciéndolo de nuevo a "Paul".

/// La variación final es tener una instancia variable y propiedades constantes, lo que significaría que podemos crear un nuevo usuario si queremos, pero una vez hecho esto, no podemos cambiar sus propiedades.

// MARK: - ¿Por qué se pueden cambiar las propiedades variables en las clases constantes?

/// Una de las pequeñas pero importantes diferencias entre las estructuras y las clases es la forma en que manejan la mutabilidad de las propiedades:

/// Las clases variables pueden tener propiedades variables cambiadas

/// Las clases constantes pueden tener propiedades variables cambiadas

/// Las estructuras variables pueden tener propiedades variables modificadas

/// Las estructuras constantes no pueden cambiar las propiedades variables

/// La razón de esto radica en la diferencia fundamental entre una clase y una estructura: uno apunta a algunos datos en la memoria, mientras que el otro es un valor como el número 5.

/// Considere un código como este:

var number = 5
number = 6

/// No podemos simplemente definir el número 5 como 6, porque eso no tendría sentido, rompería todo lo que sabemos sobre matemáticas. En su lugar, ese código elimina el valor existente asignado al número y le da el número 6 en su lugar.

/// Así es como funcionan las estructuras en Swift: cuando cambiamos una de sus propiedades, de hecho estamos cambiando toda la estructura. Claro, detrás de escena Swift puede hacer algo de optimización para que realmente no esté tirando todo el valor cada vez que cambiamos solo una parte de él, pero así es como se trata desde nuestra perspectiva.

/// Por lo tanto, si cambiar una parte de una estructura significa efectivamente destruir y recrear toda la estructura, espero que puedas ver por qué las estructuras constantes no permiten cambiar sus propiedades variables, significaría destruir y recrear algo que se supone que es constante, lo cual no es posible.

/// Las clases no funcionan de esta manera: puedes cambiar cualquier parte de sus propiedades sin tener que destruir y recrear el valor. Como resultado, las clases constantes pueden cambiar libremente sus propiedades variables.



// MARK: - Resumen: Clases

/// Las clases no se usan tan comúnmente como las estructuras, pero tienen un propósito invaluable para compartir datos, y si alguna vez eliges aprender el marco UIKit más antiguo de Apple, te encontrarás usándolos ampliamente.

/// Vamos a recapitular lo que hemos aprendido:

/// * Las clases tienen muchas cosas en común con las estructuras, incluida la capacidad de tener propiedades y métodos, pero hay cinco diferencias clave entre las clases y las estructuras.

/// * En primer lugar, las clases pueden heredar de otras clases, lo que significa que tienen acceso a las propiedades y métodos de su clase principal. Opcionalmente, puede anular los métodos en las clases secundarias si lo desea, o marcar una clase como final para evitar que otros la subclasifiquen.

/// * En segundo lugar, Swift no genera un inicializador por miembros para las clases, por lo que tienes que hacerlo tú mismo. Si una subclase tiene su propio inicializador, siempre debe llamar al inicializador de la clase principal en algún momento.

/// * En tercer lugar, si creas una instancia de clase y luego tomas copias de ella, todas esas copias apuntan a la misma instancia. Esto significa que cambiar algunos datos en una de las copias los cambia a todos.

/// * En cuarto lugar, las clases pueden tener desinicializadores que se ejecutan cuando se destruye la última copia de una instancia.

/// * Por último, las propiedades variables dentro de las instancias de clase se pueden cambiar independientemente de si la instancia en sí se creó como variable.


// MARK: - Punto de control 7

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


///--------------------------------------------------------------------------------


/// ##¿Sigues aquí? Vale, aquí hay algunas pistas:

/// Necesitarás siete clases independientes aquí, de las cuales solo una no tiene clase para padres.

/// Para hacer que una clase herede de otra, escríbela así: clase SomeClass: OtherClass.

/// Puedes hacer que las subclases tengan un método speak() diferente al de su padre utilizando la palabra clave override.

/// Todas nuestras subclases tienen cuatro patas, pero aún debes asegurarte de pasar esos datos a la clase Animal dentro del inicializador Cat.
