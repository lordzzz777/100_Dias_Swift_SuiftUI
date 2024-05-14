import Foundation


// MARK: - Resumen: Día 13 Protocolos y extensiones

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
