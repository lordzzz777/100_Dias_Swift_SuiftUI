# Estructuras, segunda parte

Como has visto, las estructuras nos permiten combinar piezas de datos individuales para hacer algo nuevo, y luego adjuntar métodos para que podamos manipular esos datos.

Hoy vas a aprender sobre algunas de las características más avanzadas de las estructuras que las hacen más potentes, incluidas las propiedades estáticas y el control de acceso, el arte de evitar que otras partes de tu código se entromieran en lugares en los que no deberían estar.

Hay una cita famosa que es tristemente anónima, pero creo que encaja bien aquí: "la privacidad es poder, lo que la gente no sabe, no lo puede arruinar". Como verás, lo mismo es cierto en Swift: ocultar el acceso a ciertas propiedades y métodos en realidad puede mejorar nuestro código, porque hay menos lugares que pueden acceder a él.

Como recordatorio, ambas cosas se utilizan ampliamente en SwiftUI, por lo que vale la pena tomarse el tiempo para dominarlas ahora porque se utilizarán desde nuestro primer proyecto en adelante.

Hoy tienes dos tutoriales en los que trabajar, donde cumplirás con múltiples niveles de control de acceso, y también la capacidad de crear propiedades y métodos estáticos. Una vez que hayas visto cada vídeo y cualquier lectura adicional opcional que quisieras, hay una breve prueba para asegurarte de que has entendido lo que se enseñó.



Cómo limitar el acceso a los datos internos utilizando el control de acceso


De forma predeterminada, las estructuras de Swift nos permiten acceder a sus propiedades y métodos libremente, pero a menudo eso no es lo que quieres, a veces quieres ocultar algunos datos del acceso externo. Por ejemplo, tal vez tenga alguna lógica que deba aplicar antes de tocar sus propiedades, o tal vez sepa que algunos métodos deben llamarse de cierta manera u orden, por lo que no deben tocarse externamente.

Podemos demostrar el problema con una estructura de ejemplo:
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




















Eso tiene métodos para depositar y retirar dinero de una cuenta bancaria, y debe usarse de la siguiente manera:
var account = BankAccount()/// Llamo a la estructura

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


















Pero la propiedad de los fondos solo está expuesta a nosotros externamente, así que ¿qué nos impide tocarla directamente? La respuesta no es nada en absoluto: este tipo de código está permitido:

account.fund -= 1000

Eso pasa por alto por completo la lógica que pusimos en marcha para evitar que las personas saquen más dinero del que tienen, y ahora nuestro programa podría comportarse de maneras extrañas.

Para resolver esto, podemos decirle a Swift que los fondos solo deben ser accesibles dentro de la estructura, por métodos que pertenezcan a la estructura, así como por cualquier propiedad calculada, observadores de propiedades, etc.

Esto solo requiere una palabra más:

private var fund = 0

Y ahora no es posible acceder a los fondos desde fuera de la estructura, pero es posible tanto dentro de deposit() como de withdraw(). Si intenta leer o escribir fondos desde fuera de la estructura, Swift se negará a construir su código.

Esto se llama control de acceso, porque controla cómo se puede acceder a las propiedades y métodos de una estructura desde fuera de la estructura.

Swift nos ofrece varias opciones, pero cuando estés aprendiendo solo necesitarás un puñado:

Usa private para "no dejes que nada fuera de la estructura lo pueda usar".

Usa fileprivate para "no dejes que nada fuera del archivo actual lo pueda usar".

Usa public para "dejar que cualquiera, en cualquier lugar, pueda usar esto”.

Hay una opción adicional que a veces es útil para los estudiantes, que es esta: private(set). Esto significa "deja que cualquiera lea esta propiedad, pero solo deja que mis métodos la escriban". Si lo fuéramos usado con BankAccount, significaría que podríamos imprimir account.funds fuera de la estructura, pero solo deposit() y withdraw() podrían cambiar el valor.

En este caso, creo que el private(set) es la mejor opción para los fondos: puedes leer el saldo actual de la cuenta bancaria en cualquier momento, pero no puedes cambiarlo sin pasar por mi lógica.

Si lo piensas, el control de acceso se trata realmente de limitar lo que tú y otros desarrolladores de tu equipo son capaces de hacer, ¡y eso es sensato! Si podemos hacer que Swift nos deje de cometer errores, siempre es una medida inteligente.

Importante: Si utiliza el control de acceso private para una o más propiedades, lo más probable es que tenga que crear su propio inicializador.


### ¿Cuál es el punto del control de acceso?

Las palabras clave de control de acceso de Swift nos permiten restringir la forma en que se puede acceder a diferentes partes de nuestro código, pero la mayor parte del tiempo es solo obedecer las reglas que pusimos en marcha: podríamos eliminarlas si quisiéramos y eludir las restricciones, así que ¿cuál es el punto?

Hay algunas respuestas a eso, pero una es particularmente fácil, así que empezaré por ahí: a veces el control de acceso se utiliza en el código que no tienes, por lo que no puedes eliminar la restricción. Esto es común cuando estás creando aplicaciones con las API de Apple, por ejemplo: imponen restricciones sobre lo que puedes y no puedes hacer, y debes cumplir con esas restricciones.

En tu propio código, sí, por supuesto, puedes eliminar cualquier restricción de control de acceso que pongas en marcha, pero eso no hace que sea inútil. El control de acceso nos permite determinar cómo se debe usar un valor, de modo que si es necesario acceder a algo con mucho cuidado, debe seguir las reglas.

Anteriormente he mencionado Unwrap, mi aplicación de aprendizaje Swift, y quiero usar otro ejemplo a partir de ahí. Cuando los usuarios aprenden diferentes partes de Swift, almaceno el nombre de lo que aprendieron en un conjunto privado dentro de una estructura de usuario, declarado así:

private var learnedSections = Set<String>()

Es privado, lo que significa que nadie puede leerlo o escribirlo directamente. En su lugar, proporciono métodos públicos para leer o escribir valores que se deben usar en su lugar. Eso es intencional, porque aprender una sección necesita hacer más que solo insertar una cadena en ese conjunto: necesita actualizar la interfaz de usuario para reflejar el cambio, y necesita guardar la nueva información para que la aplicación recuerde que se aprendió.

Si no hubiera hecho privada la propiedad de learnedSections, es posible que la olvide y le escriba cosas directamente. Eso daría lugar a que mi interfaz de usuario fuera inconsistente con sus datos, y también que no guardara el cambio, ¡mal por todas partes!

Por lo tanto, al usar lo privado aquí, le estoy pidiendo a Swift que haga cumplir las reglas por mí: no me dejes leer o escribir esta propiedad desde cualquier lugar fuera de la estructura del usuario.

Otra ventaja del control de acceso es que nos permite controlar cómo otras personas ven nuestro código, conocido como su "área de superficie". Piénsalo: si te diera una estructura para usar y tuviera 30 propiedades y métodos públicos, es posible que no estés seguro de cuáles están ahí para que las uses y cuáles son realmente solo para uso interno. Por otro lado, si marco 25 de esos como privados, entonces está claro de inmediato que no deberías usarlos externamente.

El control de acceso puede ser un problema bastante espinoso, especialmente cuando se tiene en cuenta el código externo. Por lo tanto, no es una sorpresa que la propia documentación de Apple sea bastante larga, puedes encontrarla aquí: https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html








# Propiedades y métodos estáticos


Has visto cómo podemos adjuntar propiedades y métodos a las estructuras, y cómo cada estructura tiene su propia copia única de esas propiedades para que llamar a un método en la estructura no lea las propiedades de una estructura diferente del mismo tipo.

Bueno, a veces, solo a veces, quieres añadir una propiedad o un método a la estructura en sí, en lugar de a una instancia en particular de la estructura, que te permite usarlos directamente. Utilizo mucho esta técnica con SwiftUI para dos cosas: crear datos de ejemplo y almacenar datos fijos a los que se debe acceder en varios lugares.

En primer lugar, echemos un vistazo a un ejemplo simplificado de cómo crear y usar propiedades y
/// Ejemplo de  usar  propiedades y métodos estáticos

struct School {
    static var studentCount = 0
    
    static func add(student: String){
        print ("\(student) Se unió a la escuela.")
        studentCount += 1
    }
} 

métodos estáticos:














Observe la palabra clave estática allí, lo que significa que tanto la propiedad studentCount como el método add() pertenecen a la propia estructura de la escuela, en lugar de a instancias individuales de la estructura.
School.add(student: "Paquito paquete")
print(School.studentCount)
Para usar ese código, escribiríamos lo siguiente:





No he creado una instancia de School, literalmente podemos usar add() y studentCount directamente en la estructura. Esto se debe a que ambos son estáticos, lo que significa que no existen exclusivamente en instancias de la estructura.

Esto también debería explicar por qué podemos modificar la propiedad studentCount sin marcar el método como mutante, eso solo es necesario con funciones de struct regulares para los momentos en que se creó una instancia de struct como una constante, y no hay ninguna instancia al llamar a add().

Si desea mezclar y combinar propiedades y métodos estáticos y no estáticos, hay dos reglas:

Para acceder al código no estático desde el código estático... no se puede: las propiedades y los métodos estáticos no pueden referirse a las propiedades y métodos no estáticos porque simplemente no tiene sentido: ¿a qué instancia de la escuela te estarías refiriendo?

Para acceder al código estático desde un código no estático, utilice siempre el nombre de su tipo, como School.studentCount. También puedes usar Self para hacer referencia al tipo actual.

Ahora tenemos el self y el Self, y significan cosas diferentes: el self se refiere al valor actual de la estructura, y el Self se refiere al tipo actual.

Consejo: Es fácil olvidar la diferencia entre el self y el Self, pero si lo piensas, es como el resto del nombre de Swift: comenzamos todos nuestros tipos de datos con una letra mayúscula (Int, Doble, Bool, etc.), por lo que tiene sentido que Self comience con una letra mayúscula también.

Ahora, ese sonido que puedes escuchar son otros mil estudiantes que dicen "¿por qué diablos se necesita esto?" Y lo entiendo, esto puede parecer una característica bastante redundante al principio. Por lo tanto, quiero mostrarte las dos formas principales en que uso los datos estáticos.

En primer lugar, uso propiedades estáticas para organizar los datos comunes en mis aplicaciones. Por ejemplo, podría tener una estructura como AppData para almacenar muchos valores compartidos que uso
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
} en muchos lugares:








Usando este enfoque, en todos los lugares donde necesito comprobar o mostrar algo como el número de versión de mi aplicación, sobre la pantalla, la salida de depuración, la información de registro, los correos electrónicos de soporte, etc., puedo leer AppData.version.

La segunda razón por la que suelo usar datos estáticos es para crear ejemplos de mis estructuras. Como verá más adelante, SwiftUI funciona mejor cuando puede mostrar vistas previas de su aplicación a medida que desarrolla, y esas vistas previas a menudo requieren datos de muestra. Por ejemplo, si está mostrando una pantalla que muestra datos de un empleado, querrá poder mostrar un empleado de ejemplo en la pantalla de vista previa para que pueda comprobar que todo se ve correcto mientras trabaja.
struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}
Esto se hace mejor usando una propiedad de ejemplo estático en la estructura, como esta:









Y ahora, cada vez que necesites una instancia de empleado con la que trabajar en tus vistas previas de diseño, puedes usar Employee.example y ya está.

Como dije al principio, solo hay un puñado de ocasiones en las que una propiedad o método estático tiene sentido, pero siguen siendo una herramienta útil para tener a su alrededo


¿Cuál es el punto de las propiedades y métodos estáticos en Swift?

La mayoría de las personas que aprenden Swift ven inmediatamente el valor de las propiedades y los métodos regulares, pero tienen dificultades para entender por qué las propiedades y los métodos estáticos serían útiles. Ciertamente, es cierto que son menos útiles que las propiedades y métodos normales, pero siguen siendo bastante comunes en el código Swift.

Un uso común de las propiedades y métodos estáticos es almacenar la funcionalidad común que usas en toda una aplicación. Por ejemplo, hago una aplicación llamada Unwrap, que es una aplicación gratuita de iOS para la gente que está aprendiendo Swift. En la aplicación quiero almacenar alguna información común, como la URL de la aplicación en la App Store, para poder hacer referencia a ella en cualquier lugar donde la aplicación la necesite. Por lo tanto, tengo un código como este que almacena mis datos:
struct Unwrap {
    static let appURL = "https://itunes.apple.com/app/id1440611372"
}








De esa manera puedo escribir Unwrap.appURL cuando alguien comparte algo de la aplicación, lo que ayuda a otras personas a descubrir la aplicación. Sin la palabra clave estática, necesitaría hacer una nueva instancia de la estructura Unwrap solo para leer la URL fija de la aplicación, lo que no es realmente necesario.

También uso tanto una propiedad estática como un método estático para almacenar alguna entropía
static var entropy = Int.random(in: 1...1000)

static func getEntropy() -> Int {
    entropy += 1
    return entropy
} aleatoria en la misma estructura, como esta:










La entropía aleatoria es algo de aleatoriedad recopilada por el software para hacer que la generación de números aleatorios sea más efectiva, pero hago un poco de trampa en mi aplicación porque no quiero datos verdaderamente aleatorios. La aplicación está diseñada para darte varias pruebas de Swift en un orden aleatorio, pero si fuera realmente aleatoria, entonces es probable que veas la misma pregunta una y otra a veces. No quiero eso, así que mi entropía en realidad hace que la aleatoriedad sea menos aleatoria, por lo que tenemos una difusión más justa de preguntas. Por lo tanto, lo que hace mi código es almacenar un entero de entropía que comienza al azar, pero se incrementa por 1 cada vez que se llama a getEntropy().

Esta entropía "justa aleatoria" se utiliza en toda la aplicación para que los duplicados no aparezcan, por lo que, de nuevo, son compartidos estáticamente por la estructura Unwrap para que en todas partes puedan acceder a ellos.

Antes de seguir adelante, hay dos cosas más que quiero mencionar que podrían interesarte.

En primer lugar, mi estructura de unwrap realmente no necesita ser una estructura en absoluto, podría y, de hecho, debería declararla como una enumeración en lugar de una estructura. Esto se debe a que la enumeración no tiene ningún caso, por lo que es una mejor opción que una estructura aquí porque nunca quiero crear una instancia de este tipo, no hay razón para hacerlo. Hacer una enumeración impide que esto suceda, lo que ayudaría a aclarar mi intención.

En segundo lugar, debido a que tengo un método dedicado a getEntropy(), en realidad le pido a Swift que restrinja el acceso a la entropía para que no pueda acceder a ella desde ningún lugar. Esto se llama
private static var entropy = Int.random(in: 1...1000) control de acceso, y se ve así en Swift:




Pronto buscaremos más control de acceso.











# Resumen: Estructuras

Las estructuras se utilizan en casi todas partes en Swift: String, Int, Double, Array e incluso Bool se implementan como estructuras, y ahora puedes reconocer que una función como isMultiple(of:) es realmente un método que pertenece a Int.

Vamos a recapitular lo que más hemos aprendido:

Puedes crear tus propias estructuras escribiendo la estructura, dándole un nombre y luego colocando el código de la estructura dentro de llaves.

Las estructuras pueden tener variables y constantes (conocidas como propiedades) y funciones (conocidas como métodos)

Si un método intenta modificar las propiedades de su estructura, debe marcarlo como mutante.

Puede almacenar propiedades en la memoria o crear propiedades calculadas que calculen un valor cada vez que se accede a ellas.

Podemos adjuntar observadores de propiedades didSet y willSet a las propiedades dentro de una estructura, lo que es útil cuando necesitamos asegurarnos de que siempre se ejecute algún código cuando cambia la propiedad.

Los inicializadores son un poco como funciones especializadas, y Swift genera una para todas las estructuras usando sus nombres de propiedades.

Puede crear sus propios inicializadores personalizados si lo desea, pero siempre debe asegurarse de que todas las propiedades de su estructura tengan un valor en el momento en que termine el inicializador y antes de llamar a cualquier otro método.

Podemos usar el acceso para marcar cualquier propiedad y método como disponible o no disponible externamente, según sea necesario.

Es posible adjuntar una propiedad o métodos directamente a una estructura, para que pueda usarlos sin crear una instancia de la estructura.


# Punto de control 6


Las estructuras se encuentran en el núcleo de cada aplicación SwiftUI, por lo que es muy importante que te tomes un tiempo extra para asegurarte de entender lo que hacen y cómo funcionan.

Para comprobar sus conocimientos, aquí hay una pequeña tarea para usted: cree una estructura para almacenar información sobre un coche, incluido su modelo, el número de asientos y el equipo actual, y luego agregue un método para cambiar los engranajes hacia arriba o hacia abajo. Piensa en las variables y el control de acceso: ¿qué datos deben ser una variable en lugar de una constante, y qué datos deben exponerse públicamente? ¿Debería el método de cambio de marchas validar su entrada de alguna manera?

Como siempre, escribiré algunas pistas a continuación, pero primero voy a dejar algo de espacio para que no veas las pistas por accidente. Como siempre, es una muy buena idea probar este desafío usted mismo antes de mirar las pistas: es la forma más rápida de identificar las partes con las que te sientes menos seguro.



Solucion ....


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







