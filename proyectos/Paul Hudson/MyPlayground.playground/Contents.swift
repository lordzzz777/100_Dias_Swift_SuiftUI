import Foundation

var greeting = "Hello, playground"

// MARK: -Cómo limitar el acceso a los datos internos utilizando el control de acceso

/// Estructura que simula con logica que simula retirada de efectivo
/// en una cuanta bancaria

struct BankAccount {
    var fund = 0
    mutating func deposit(amount: Int){
        fund += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if fund >= amount{
            fund -= amount
            return true
        }else{
            return false
        }
    }
}


var account = BankAccount()/// LLamo a la estructuera

/// llamo al método "account.deposit", i me pide como parámetro un entero, coloco "100" como ejemplo
account.deposit(amount: 100)

/// llamo al método "account.withdraw", i me pide como parámetro un entero, coloco "200" como ejemplo
let success = account.withdraw(amount: 200)

/// realizamos la condición  si "success", es verdadero
///  se retira el dinero con éxito, por el contrario te da el mensaje de que no
if success{
    print("Retiró el dinero con éxito")
}else {
    print("No se pudo conseguir el dinero")
}

account.fund -= 1000 /// Esto esta permitino, pero ......

/// Eso pasa por alto por completo la lógica que pusimos en marcha para evitar que las personas saquen más dinero del que tienen, y ahora nuestro programa podría comportarse de maneras extrañas.

/// Para resolver esto, podemos decirle a Swift que los fondos solo deben ser accesibles dentro de la estructura, por métodos que pertenezcan a la estructura, así como por cualquier propiedad calculada, observadores de propiedades, etc.

/// Esto solo requiere una palabra más:

private var fund = 0 /// esto consigure que el valor no seas accesible

/// Y ahora no es posible acceder a los fondos desde fuera de la estructura, pero es posible tanto dentro de deposit() como de withdraw(). Si intenta leer o escribir fondos desde fuera de la estructura, Swift se negará a construir su código.

///  Esto se llama control de acceso, porque controla cómo se puede acceder a las propiedades y métodos de una estructura desde fuera de la estructura.

/// Swift nos ofrece varias opciones, pero cuando estés aprendiendo solo necesitarás un puñado:


// MARK: - Propiedades y métodos estáticos

/// Ejemplo de  usar  propiedades y métodos estáticos
struct School {
    static var studentCount = 0
    
    static func add(student: String){
        print ("\(student) Se unió a la escuela.")
        studentCount += 1
    }
}

/// Aqui, la estamos llamando
School.add(student: "Paquito paquete")
print(School.studentCount)

/// No he creado una instancia de School, literalmente podemos usar add() y studentCount directamente en la estructura. Esto se debe a que ambos son estáticos, lo que significa que no existen exclusivamente en instancias de la estructura.

/// Esto también debería explicar por qué podemos modificar la propiedad studentCount sin marcar el método como mutante, eso solo es necesario con funciones de struct regulares para los momentos en que se creó una instancia de struct como una constante, y no hay ninguna instancia al llamar a add().

/// 1 -. las propiedades y los métodos estáticos no pueden referirse a las propiedades y métodos no estáticos porque simplemente no tiene sentido: ¿a qué instancia de la escuela te estarías refiriendo?

/// 2 -. Para acceder al código estático desde un código no estático, utilice siempre el nombre de su tipo, como School.studentCount. También puedes usar Self para hacer referencia al tipo actual.


struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}
/// Usando este enfoque, en todos los lugares donde necesito comprobar o mostrar algo como el número de versión de mi aplicación, sobre la pantalla, la salida de depuración, la información de registro, los correos electrónicos de soporte, etc., puedo leer AppData.version.

/// La segunda razón por la que suelo usar datos estáticos es para crear ejemplos de mis estructuras. Como verá más adelante, SwiftUI funciona mejor cuando puede mostrar vistas previas de su aplicación a medida que desarrolla, y esas vistas previas a menudo requieren datos de muestra. Por ejemplo, si está mostrando una pantalla que muestra datos de un empleado, querrá poder mostrar un empleado de ejemplo en la pantalla de vista previa para que pueda comprobar que todo se ve correcto mientras trabaja.

/// Esto se hace mejor usando una propiedad de ejemplo estático en la estructura, como esta:

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

/// Y ahora, cada vez que necesites una instancia de empleado con la que trabajar en tus vistas previas de diseño, puedes usar Employee.example y ya está.

/// Como dije al principio, solo hay un puñado de ocasiones en las que una propiedad o método estático tiene sentido, pero siguen siendo una herramienta útil para tener a su alrededor.


// MARK: - Resumen: Estructuras

/// Las estructuras se utilizan en casi todas partes en Swift: String, Int, Double, Array e incluso Bool se implementan como estructuras, y ahora puedes reconocer que una función como isMultiple(of:) es realmente un método que pertenece a Int.

/// Vamos a recapitular lo que más hemos aprendido:

/// Puedes crear tus propias estructuras escribiendo la estructura, dándole un nombre y luego colocando el código de la estructura dentro de llaves.

/// Las estructuras pueden tener variables y constantes (conocidas como propiedades) y funciones (conocidas como métodos)

/// Si un método intenta modificar las propiedades de su estructura, debe marcarlo como mutante.

/// Puede almacenar propiedades en la memoria o crear propiedades calculadas que calculen un valor cada vez que se accede a ellas.

/// Podemos adjuntar observadores de propiedades didSet y willSet a las propiedades dentro de una estructura, lo que es útil cuando necesitamos asegurarnos de que siempre se ejecute algún código cuando cambia la propiedad.

/// Los inicializadores son un poco como funciones especializadas, y Swift genera una para todas las estructuras usando sus nombres de propiedades.

/// Puede crear sus propios inicializadores personalizados si lo desea, pero siempre debe asegurarse de que todas las propiedades de su estructura tengan un valor en el momento en que termine el inicializador y antes de llamar a cualquier otro método.

/// Podemos usar el acceso para marcar cualquier propiedad y método como disponible o no disponible externamente, según sea necesario.

/// Es posible adjuntar una propiedad o métodos directamente a una estructura, para que pueda usarlos sin crear una instancia de la estructura.


// MARK: - Punto de control 6


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


