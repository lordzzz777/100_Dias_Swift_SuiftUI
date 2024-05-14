import Foundation


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
