import Foundation

// MARK: - Dia 10 y 11, Structuras

// Estructura que contine dos variable y una funcion 
struct Rectangulo {
    var ancho: Double // variable de tipo decimal que hace alusión al ancho
    var altura: Double // variable de tipo decimal que hace alusión al largo
    
    // funcion que calcula el area de dicha figura 
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