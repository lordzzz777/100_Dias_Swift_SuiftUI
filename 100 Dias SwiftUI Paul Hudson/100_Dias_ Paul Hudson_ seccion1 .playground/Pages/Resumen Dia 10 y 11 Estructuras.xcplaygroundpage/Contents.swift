import Foundation

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
