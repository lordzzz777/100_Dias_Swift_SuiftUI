# Classes

Al principio, las clases parecen muy similares a las estructuras porque las usamos para crear nuevos tipos de datos con propiedades y métodos. Sin embargo, introducen una característica nueva, importante y compleja llamada herencia: la capacidad de hacer que una clase se base sobre los cimientos de otra.

Esta es una característica poderosa, no hay duda de ella, y no hay forma de evitar el uso de clases cuando empiezas a crear aplicaciones iOS reales. Pero, por favor, recuerde mantener su código simple: solo porque exista una función, no significa que necesite usarla. Como escribió Martin Fowler, "cualquier tonto puede escribir código que un ordenador puede entender, pero los buenos programadores escriben código que los humanos pueden entender".

Ya he dicho que SwiftUI utiliza estructuras ampliamente para su diseño de interfaz de usuario. Bueno, utiliza las clases ampliamente para sus datos: cuando muestras datos de algún objeto en la pantalla, o cuando pasas datos entre tus diseños, normalmente estarás usando clases.

Debo añadir: si alguna vez has trabajado con UIKit antes, este será un cambio notable para ti: en UIKit normalmente usamos clases para el diseño de la interfaz de usuario y estructuras para los datos. Entonces, si pensaste que tal vez podrías saltarte un día aquí y allá, lamento decir que no puedes: todo esto es necesario.

Hoy tienes seis tutoriales para trabajar, y conocerás clases, herencia, desinicializadores y más. Una vez que hayas visto cada vídeo y completado cualquier lectura adicional opcional que quisieras, hay pruebas cortas para asegurarte de que has entendido lo que se enseñó.

# Cómo crear tus propias clases

Swift utiliza estructuras para almacenar la mayoría de sus tipos de datos, incluidos String, Int, Double y Array, pero hay otra forma de crear tipos de datos personalizados llamados clases. Estos tienen muchas cosas en común con las estructuras, pero son diferentes en lugares clave.

En primer lugar, las cosas que las clases y estructuras tienen en común incluyen:

- Puedes crearlos y nombrarlos.
- Puede agregar propiedades y métodos, incluidos los observadores de propiedades y el control de acceso.
- Puedes crear inicializadores personalizados para configurar nuevas instancias como quieras.
- Sin embargo, las clases difieren de las estructuras en cinco lugares clave:

Puedes hacer que una clase se base en la funcionalidad de otra clase, obteniendo todas sus propiedades y métodos como punto de partida. Si quieres anular selectivamente algunos métodos, también puedes hacerlo.

Debido a ese primer punto, Swift no generará automáticamente un inicializador por miembros para las clases. Esto significa que necesita escribir su propio inicializador o asignar valores predeterminados a todas sus propiedades.

Cuando copias una instancia de una clase, ambas copias comparten los mismos datos: si cambias una copia, la otra también cambia.

Cuando se destruye la copia final de una instancia de clase, Swift puede ejecutar opcionalmente una función especial llamada desinicializador.

Incluso si haces una constante de clase, todavía puedes cambiar sus propiedades siempre y cuando sean variables.

En la superficie, probablemente parezcan bastante aleatorios, y es muy probable que te estés preguntando por qué se necesitan clases cuando ya tenemos estructuras.

Sin embargo, SwiftUI utiliza las clases ampliamente, principalmente para el punto 3: todas las copias de una clase comparten los mismos datos. Esto significa que muchas partes de su aplicación pueden compartir la misma información, por lo que si el usuario cambia su nombre en una pantalla, todas las demás pantallas se actualizarían automáticamente para reflejar ese cambio.

Los otros puntos importan, pero son de uso variabl


- Ser capaz de construir una clase basada en otra es realmente importante en el antiguo marco de interfaz de usuario de Apple, UIKit, pero es mucho menos común en las aplicaciones SwiftUI. En UIKit era común tener jerarquías de clases largas, donde la clase A se construyó sobre la clase B, que se construyó sobre la clase C, que se construyó sobre la clase D, etc.

- La falta de un inicializador por miembro es molesto, pero espero que puedas ver por qué sería difícil de implementar, dado que una clase puede basarse en otra: si la clase C agregara una propiedad adicional, rompería todos los inicializadores de C, B y A.

- Ser capaz de cambiar las variables de una clase constante enlaza con el comportamiento de copia múltiple de las clases: una clase constante significa que no podemos cambiar el bote a qué apunta nuestra copia, pero si las propiedades son variables, todavía podemos cambiar los datos dentro del bote. Esto es diferente de las estructuras, donde cada copia de una estructura es única y contiene sus propios datos.

- Debido a que se puede hacer referencia a una instancia de una clase en varios lugares, es importante saber cuándo se ha destruido la copia final. Ahí es donde entra en juego el desinicializador: nos permite limpiar cualquier recurso especial que hayamos asignado cuando esa última copia desaparezca.


Antes de que terminemos, echemos un vistazo a una pequeña porción de código que crea y utiliza una clase:

```swift
class Game {
    var score = 0 {
        didSet{
            print("Score is naw \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10
```

Sí, la única diferencia entre eso y una estructura es que se creó usando una clase en lugar de una estructura; todo lo demás es idéntico. Eso podría hacer que las clases parezcan redundantes, pero créeme: sus cinco diferencias son importantes.

Voy a entrar en más detalles sobre las cinco diferencias entre las clases y las estructuras en los siguientes capítulos, pero ahora mismo lo más importante que hay que saber es esto: las estructuras son importantes, y también lo son las clases, necesitarás ambas al usar SwiftUI.

##  ¿Por qué Swift tiene tanto clases como estructuras?



Las clases y estructuras dan a los desarrolladores de Swift la capacidad de crear tipos personalizados y complejos con propiedades y métodos, pero tienen cinco diferencias importantes:

- Las clases no vienen con inicializadores sintetizados por miembros.

- Una clase se puede construir sobre ("heredar de") otra clase, ganando sus propiedades y métodos.

- Las copias de las estructuras siempre son únicas, mientras que las copias de las clases en realidad apuntan a los mismos datos compartidos.

- Las clases tienen desinicializadores, que son métodos que se llaman cuando se destruye una instancia de la clase, pero las estructuras no.

- Las propiedades variables en clases constantes se pueden modificar libremente, pero las propiedades variables en estructuras constantes no pueden.

## ¿Por qué las clases de Swift no tienen un inicializador por miembros?


Una de las muchas características útiles de la estructura de Swift es que vienen con un inicializador sintetizado por miembros, lo que nos permite crear nuevas instancias de la estructura con solo especificar sus propiedades. Sin embargo, las clases de Swift no tienen esta función, lo cual es molesto, pero ¿por qué no la tienen?

La razón principal es que las clases tienen herencia, lo que haría que fuera difícil trabajar con los inicializadores de los miembros. Piénsalo: si construyera una clase de la que heredaste, y luego agregara algunas propiedades a mi clase más tarde, tu código se rompería: todos esos lugares en los que confiaste en mi inicializador de miembros de repente ya no funcionarían.

Por lo tanto, Swift tiene una solución simple: en lugar de generar automáticamente un inicializador por miembros, los autores de las clases deben escribir su propio inicializador a mano. De esta manera, puede agregar propiedades tanto como desee sin afectar al inicializador de su clase, y sin afectar a otros que heredan de su clase. Y cuando decides cambiar tu inicializador, lo estás haciendo tú mismo y, por lo tanto, eres plenamente consciente de las implicaciones para cualquier clase que herede.

# Cómo hacer que una clase herede de otra

Swift nos permite crear clases basándolas en clases existentes, que es un proceso conocido como herencia. Cuando una clase hereda la funcionalidad de otra clase (su clase "padre" o "súper"), Swift le dará acceso a la nueva clase (la "clase secundaria" o "subclase") a las propiedades y métodos de esa clase principal, lo que nos permitirá hacer pequeñas adiciones o cambios para personalizar la forma en que se comporta la nueva clase.

Para hacer que una clase herede de otra, escriba dos puntos después del nombre de la clase secundaria y luego agregue el nombre de la clase principal. Por ejemplo, aquí hay una clase de empleado con una propiedad y un inicializador:

```swift
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
}
```

Podríamos hacer dos subclases de empleado, cada una de las cuales ganará la propiedad de horas y el inicializador:

```swift

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}


class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}
```

Observe cómo esas dos clases hijas pueden referirse directamente a las horas, es como si ellos mismos agregaran esa propiedad, excepto que no tenemos que seguir repitiéndonos.

Cada una de esas clases hereda del empleado, pero cada una añade su propia personalización. Por lo tanto, si creamos una instancia de cada uno y llamamos a work(), obtendremos un resultado diferente:

```swift
let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()
```
Además de compartir propiedades, también puede compartir métodos, que luego se pueden llamar desde las clases secundarias. Como ejemplo, intente agregar esto a la clase Empleado:
  
```swift
 func printSummary() {
        print("I work \(hours) hours a day.")
    }
```







Debido a que el desarrollador hereda del empleado, podemos comenzar inmediatamente a llamar a printSummary() en instancias de desarrollador, como esta:

```swift
let novall = Developer(hours: 8)
novall.printSummary()

```

Las cosas se complican un poco más cuando quieres cambiar un método que heredaste. Por ejemplo, acabamos de poner printSummary() en Employee, pero tal vez una de esas clases hijas quiera un comportamiento ligeramente diferente.

Aquí es donde Swift hace cumplir una regla simple: si una clase secundaria quiere cambiar un método de una clase principal, debe usar override en la versión de la clase secundaria. Esto hace dos cosas:

1.  Si intenta cambiar un método sin usar la anulación, Swift se negará a construir su código. Esto te impide anular accidentalmente un método.

2.  Si usas override pero tu método en realidad no anula algo de la clase principal, Swift se negará a construir tu código porque probablemente cometiste un error.

Por lo tanto, si quisiéramos que los desarrolladores tuvieran un método printSummary() único, añadiríamos esto a la clase de desarrollador:

```swift
 override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
```


Swift es inteligente sobre cómo funciona la anulación del método: si su clase principal tiene un método work() que no toma parámetros, pero la clase secundaria tiene un método work() que acepta una cadena para designar dónde se está haciendo el trabajo, eso no requiere anulación porque no está reemplazando el método padre.

Consejo: Si sabes con seguridad que tu clase no debería apoyar la herencia, puedes marcarla como definitiva. Esto significa que la clase en sí puede heredar de otras cosas, pero no se puede usar para heredar de - ninguna clase secundaria puede usar una clase final como su padre.



## ¿Cuándo te gustaría anular un método?


En Swift, cualquier clase que herede de una clase principal puede anular los métodos y, a veces, las propiedades de esa clase principal, lo que significa que pueden reemplazar la implementación del método principal con una de las suyas.

Este nivel de personalización es muy importante y nos facilita la vida como desarrolladores. Piénsalo: si alguien ha diseñado una clase brillante que quieres usar, pero no es del todo correcta, ¿no sería bueno anular una parte de su comportamiento en lugar de tener que reescribirlo todo tú mismo?

Claro que lo haría, y ahí es exactamente donde entra la anulación del método: puedes mantener todo el comportamiento que quieras, y solo cambiar una o dos pequeñas partes en una subclase personalizada.

En UIKit, el marco de interfaz de usuario original de Apple para iOS, este enfoque se utilizó mucho. Por ejemplo, considere algunas de las aplicaciones integradas, como Configuración y Mensajes. Ambos presentan información en filas: Configuración tiene filas como General, Centro de Control, Pantalla y Brillo, y así suces, y Mensajes tiene filas individuales para cada conversación que has tenido con diferentes personas. En UIKit, estas se llaman tablas, y tienen algún comportamiento común: puedes desplazarte por todas las filas, puedes tocar las filas para seleccionar una, hay pequeñas flechas grises en el lado derecho de las filas, y así sucede.

Estas listas de filas son muy comunes, por lo que Apple nos proporcionó el código existente para usarlas que tiene todo ese comportamiento estándar incorporado. Por supuesto, hay algunas partes que realmente necesitan cambiar, como cuántas filas tienen las listas y qué contenido tienen dentro. Por lo tanto, los desarrolladores de Swift crearían subclases de la tabla de Apple y anularían las partes que querían cambiar, dándoles toda la funcionalidad integrada y mucha flexibilidad y control.


## ¿Qué clases deberían declararse como finales?

Las clases finales son de las que no se pueden heredar, lo que significa que no es posible que los usuarios de su código agreguen funcionalidad o cambien lo que tienen. Este no es el valor predeterminado: debes optar por este comportamiento añadiendo la palabra clave final a tu clase.

Recuerde, cualquiera que subclasifique su clase puede anular sus propiedades y tal vez también sus métodos, lo que les ofrece un poder increíble. Si haces algo que no les gusta, bam, pueden reemplazarlo. Es posible que todavía llamen a su método original, así como a su reemplazo, pero puede que no.

Esto puede ser problemático: tal vez tu clase haga algo realmente importante que no debe ser reemplazado, o tal vez tengas clientes con un contrato de soporte y no quieras que rompan la forma en que funciona tu código.

Gran parte del propio código de Apple se escribió antes de que llegara Swift, en un lenguaje anterior llamado Objective-C. Objective-C no tenía un gran soporte para las clases finales, por lo que Apple generalmente recurría a grandes advertencias en su sitio. Por ejemplo, hay una clase muy importante llamada AVPlayerViewController que está diseñada para reproducir películas, y su página de documentación tiene una gran advertencia amarilla que dice: "Subclasificar AVPlayerViewController y anular sus métodos no es compatible, y da como resultado un comportamiento indefinido". No sabemos por qué, solo que no deberíamos hacerlo. Hay otra clase llamada Timer que maneja eventos cronometrados como una alarma, y allí la advertencia es aún más simple: "No hagas temporizador de subclase".

En Swift solía ser el caso de que las clases finales tenían más rendimiento que las clases no finales, porque estábamos proporcionando un poco más de información sobre cómo se ejecutaría nuestro código y Swift lo usaría para hacer algunas optimizaciones.

Eso no ha sido cierto durante un tiempo, pero incluso hoy en día creo que muchas personas instintivamente declaran sus clases como finales, lo que significa que "no deberías subclasar de esto a menos que yo lo permita específicamente". Ciertamente hago esto mucho, porque es otra forma en la que puedo ayudar a la gente a entender cómo funciona mi código.



# Cómo añadir inicializadores para las clases

Los inicializadores de clase en Swift son más complicados que los inicializadores de estructuras, pero con un poco de selección podemos centrarnos en la parte que realmente importa: si una clase secundaria tiene algún inicializador personalizado, siempre debe llamar al inicializador  padre después de que haya terminado de configurar sus propias propiedades, si tiene alguna.

Como dije anteriormente, Swift no generará automáticamente un inicializador por miembros para las clases. Esto se aplica con o sin herencia, nunca generará un inicializador por miembro para usted. Por lo tanto, necesita escribir su propio inicializador o proporcionar valores predeterminados para todas las propiedades de la clase.

Comenzamos definiendo una nueva clase:

```swift
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}
```


Eso tiene una sola propiedad booleana, más un inicializador para establecer el valor de esa propiedad. Recuerde, el uso de self aquí deja claro que estamos asignando el parámetro isElectric a la propiedad del mismo nombre.

Ahora, digamos que queríamos hacer que una clase de coche heredara de Vehicle - podrías empezar a

```swift
class Car: Vehicle {
    let isConvertible: Bool

    init(isConvertible: Bool) {
        self.isConvertible = isConvertible
    }
}
```

escribir algo como esto:


Pero Swift se negará a construir ese código: hemos dicho que la clase de vehículos necesita saber si es eléctrico o no, pero no hemos proporcionado un valor para eso.

Lo que Swift quiere que hagamos es proporcionar a Car un inicializador que incluya tanto isElectric como isConvertible, pero en lugar de tratar de almacenar isElectric nosotros mismos, tenemos que pasarlo; tenemos que pedirle a la súper clase que ejecute su propio inicializador.

```swift
class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}
```
Así es como se ve eso:


Super es otro de esos valores que Swift nos proporciona automáticamente, similar a self: nos permite llamar a métodos que pertenecen a nuestra clase principal, como su inicializador. Puedes usarlo con otros métodos si quieres; no se limita a los inicializadores.

Ahora que tenemos un inicializador válido en ambas clases, podemos hacer una instancia de Car así:

```swif
let teslaX = Car(isElectric: true, isConvertible: false)
```

Consejo: Si una subclase no tiene ninguno de sus propios inicializadores, hereda automáticamente los inicializadores de su clase principal.

# Cómo copiar clases

En Swift, todas las copias de una instancia de clase comparten los mismos datos, lo que significa que cualquier cambio que realice en una copia cambiará automáticamente las otras copias. Esto sucede porque las clases son tipos de referencia en Swift, lo que significa que todas las copias de una clase se refieren al mismo grupo de datos subyacente.

```swift
class User {
    var username = "Anonymous"
}
```

Para ver esto en acción, prueba esta sencilla clase

Eso solo tiene una propiedad, pero como se almacena dentro de una clase, se compartirá entre todas las copias de la clase.

```swift
var user1 = User()
```
Por lo tanto, podríamos crear una instancia de esa clase:

Entonces podríamos tomar una copia de user1 y cambiar el valor del nombre de usuario:

```swit
var user1 = User()
var user2 = user1
user2.username = "Manuelita Marquez”
```


¡Espero que veas a dónde va esto! Ahora que hemos cambiado la propiedad del nombre de usuario de la copia, podemos imprimir las mismas propiedades de cada copia diferente:

```swift
print(user1.username)
print(user2.username)
```

...Y eso va a imprimir "Taylor" para ambos, a pesar de que solo cambiamos una de las instancias, la otra también cambió.

Esto puede parecer un error, pero en realidad es una característica, y también una característica muy importante, porque es lo que nos permite compartir datos comunes en todas las partes de nuestra aplicación. Como verás, SwiftUI depende en gran medida de las clases para sus datos, específicamente porque se pueden compartir tan fácilmente.

En comparación, las estructuras no comparten sus datos entre copias, lo que significa que si cambiamos la clase de Usuario a la estructura Usuario en nuestro código, obtenemos un resultado diferente: imprimirá "Anónimo" y luego "Taylor", porque cambiar la copia no también ajustó el original.

Si desea crear una copia única de una instancia de clase, a veces llamada copia profunda, debe manejar la creación de una nueva instancia y copiar a través de todos sus datos de forma segura.

En nuestro caso, eso es sencillo:

```swift
class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

```

Ahora podemos llamar de forma segura a copy() para obtener un objeto con los mismos datos iniciales, pero cualquier cambio futuro no afectará al original.


# ¿Por qué las copias de una clase comparten sus datos?


Una característica de Swift que es realmente confusa al principio es cómo los comportamientos de sus clases y estructuras difieren cuando se copian: las copias de la misma clase comparten sus datos subyacentes, lo que significa que cambiar uno los cambia a todos, mientras que las estructuras siempre tienen sus propios datos únicos, y cambiar una copia no afecta a los demás.

El término técnico para esta distinción es "tipos de valor frente a tipos de referencia". Las estructuras son tipos de valores, lo que significa que tienen valores simples como el número 5 o la cadena "hola". No importa cuántas propiedades o métodos tenga tu estructura, todavía se considera un valor simple como un número. Por otro lado, las clases son tipos de referencia, lo que significa que se refieren a un valor en otro lugar.

Para los tipos de valores, esto es bastante fácil de entender que es evidente. Por ejemplo, mira este

```swift
var message = "Welcome"
var greeting = message
greeting = "Hello" código:
```

Cuando se ejecute ese código, el mensaje seguirá estableciendo en "Bienvenido", pero el saludo se establecerá en "Hola". Como dice Chris Eidhof, "esto es tan natural que parece afirmar lo obvio". (https://chris.eidhof.nl/post/structs-and-mutation-in-swift/) Pero así es como se comportan las estructuras: su valor está completamente contenido dentro de su variable, y de alguna manera no se comparte con otros valores. Esto significa que todos sus datos se almacenan directamente en cada variable, por lo que cuando los copias, obtienes una copia profunda de todos los datos.

Por el contrario, la mejor manera de pensar en un tipo de referencia es que es como una señal que apunta a algunos datos. Si creamos una instancia de una clase, ocupará algo de memoria en tu iPhone, y la variable que almacena la instancia es en realidad solo una señal de la memoria real donde vive el objeto. Si tomas una copia del objeto, obtienes una nueva señal, pero aún así apunta a la memoria donde vive el objeto original. Esta es la razón por la que cambiar una instancia de una clase las cambia a todas: todas las copias del objeto son señales que apuntan a la misma pieza de memoria.

Es difícil sobreestimar lo importante que es esta diferencia en el desarrollo de Swift. Anteriormente mencioné que los desarrolladores de Swift prefieren usar estructuras para sus tipos personalizados, y este comportamiento de copia es una gran razón. Imagina si tuvieras una gran aplicación y quisieras compartir un objeto de usuario en varios lugares, ¿qué pasaría si uno de esos lugares cambiara a tu usuario? Si estuvieras usando una clase, todos los demás lugares que usaron a tu usuario cambiarían sus datos sin darte cuenta, y podrías terminar con problemas. Pero si estuvieras usando una estructura, cada parte de tu aplicación tiene su propia copia de los datos y no se puede cambiar por sorpresa.

Al igual que con muchas cosas en la programación, las decisiones que tomes deberían ayudar a transmitir un poco de tu razonamiento. En este caso, usar una clase en lugar de una estructura envía un mensaje fuerte de que quieres que los datos se compartan de alguna manera, en lugar de tener muchas copias distintas.


# Cómo crear un desinicializador para una clase


A las clases de Swift se les puede dar opcionalmente un desinicializador, que es un poco como lo opuesto a un inicializador, ya que se llama cuando se destruye el objeto en lugar de cuando se crea.

Esto viene con algunas pequeñas condiciones:

Al igual que los inicializadores, no usas func con desinicializadores, son especiales.

Los desinicializadores nunca pueden tomar parámetros o devolver datos y, como resultado, ni siquiera se escriben con paréntesis.

Su desinicializador se llamará automáticamente cuando se destruya la copia final de una instancia de clase. Eso podría significar que se creó dentro de una función que ahora se está terminando, por ejemplo.

Nunca llamamos directamente a los desinicializadores; el sistema los maneja automáticamente.

Las estructuras no tienen desinicializadores, porque no puedes copiarlas.

Exactamente cuándo se llaman a tus desinicializadores depende de lo que estés haciendo, pero en realidad se reduce a un concepto llamado alcance. Alcance más o menos significa "el contexto en el que la información está disponible", y ya has visto muchos ejemplos:

Si creas una variable dentro de una función, no puedes acceder a ella desde fuera de la función.

Si creas una variable dentro de una condición if, esa variable no está disponible fuera de la condición.

Si creas una variable dentro de un bucle for, incluyendo la variable de bucle en sí, no puedes usarla fuera del bucle.

Si miras el panorama general, verás que cada uno de ellos usa llaves para crear su alcance: las condiciones, los bucles y las funciones crean alcances locales.

Cuando un valor sale del ámbito, queremos decir que el contexto en el que se creó va a desaparecer. En el caso de las estructuras, eso significa que los datos están siendo destruidos, pero en el caso de las clases, significa que solo una copia de los datos subyacentes va a desaparecer; todavía podría haber otras copias en otro lugar. Pero cuando la copia final desaparece, cuando se destruye la última constante o variable que apunta a una instancia de clase, entonces los datos subyacentes también se destruyen y la memoria que estaba usando se devuelve al sistema.

Para demostrar esto, podríamos crear una clase que imprima un mensaje cuando se crea y se destruye,

```swift
class User2 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
} usando un inicializador y un desinicializador:

```

Ahora podemos crear y destruir instancias de eso rápidamente usando un bucle: si creamos una instancia de usuario dentro del bucle, se destruirá cuando finalice la iteración del bucle:


```swift
for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}
```

Cuando ese código se ejecute, verás que crea y destruye a cada usuario individualmente, y uno se destruye por completo antes de que se cree otro.

Recuerde, el desinicializador solo se llama cuando se destruye la última referencia que queda a una instancia de clase. Esta podría ser una variable o constante que hayas guardado, o tal vez hayas almacenado algo en una matriz.

Por ejemplo, si añadiéramos nuestras instancias de usuario a medida que se crearon, solo se destruirían cuando se borrara la matriz:

```swift
var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")
```

# ¿Por qué las clases tienen desinicializadores y las estructuras no?

Una característica pequeña pero importante de las clases es que pueden tener una función de desinicialización, una contraparte de init() que se ejecuta cuando se destruye la instancia de clase. Las estructuras no tienen desinicializadores, lo que significa que no podemos decir cuándo se destruyen.

El trabajo de los desinicializadores es decirnos cuándo se destruyó una instancia de clase. Para las estructuras, esto es bastante simple: la estructura se destruye cuando lo que la posee ya no existe. Por lo tanto, si creamos una estructura dentro de un método y los métodos terminan, la estructura se destruye.

Sin embargo, las clases tienen un comportamiento de copia complejo que significa que pueden existir varias copias de la clase en varias partes de su programa. Todas las copias apuntan a los mismos datos subyacentes, por lo que ahora es mucho más difícil decir cuándo se destruye la instancia de clase real, cuando la variable final que apunta a ella ha desaparecido.

Detrás de escena, Swift realiza algo llamado conteo automático de referencias, o ARC. ARC rastrea cuántas copias de cada instancia de clase existe: cada vez que toma una copia de una instancia de clase, Swift agrega 1 a su recuento de referencias, y cada vez que se destruye una copia, Swift resta 1 de su recuento de referencias. Cuando el recuento llega a 0, significa que ya nadie se refiere a la clase, y Swift llamará a su desinicializador y destruirá el objeto.

Por lo tanto, la simple razón por la que las estructuras no tienen desinicializadores es porque no los necesitan: cada estructura tiene su propia copia de sus datos, por lo que no tiene que pasar nada especial cuando se destruye.

Puedes poner tu desinicializador en cualquier lugar que quieras en tu código, pero me encanta esta cita de Anne Cahalan: "El código debe leerse como oraciones, lo que me hace pensar que mis clases deberían leerse como capítulos. Así que el desinicializador va al final, ¡es la ~aleta~ de la clase!"


# Cómo trabajar con variables dentro de las clases

Las clases de Swift funcionan un poco como señales: cada copia de una instancia de clase que tenemos es en realidad una señal que apunta a la misma pieza de datos subyacente. Sobre todo, esto importa debido a la forma en que cambiar una copia cambia todas las demás, pero también importa debido a la forma en que las clases tratan las propiedades variables.

```swift
class UserName {
    var name = "Paul"
}

let userName = UserName()
userName.name = "Taylor"
print(userName.name)
Este pequeño ejemplo de código demuestra cómo funcionan las cosas:

```









Eso crea una instancia de usuario constante, pero luego la cambia: cambia el valor constante. Eso es malo, ¿verdad?

Excepto que no cambia el valor constante en absoluto. Sí, los datos dentro de la clase han cambiado, pero la instancia de la clase en sí, el objeto que creamos, no ha cambiado y, de hecho, no se puede cambiar porque la hicimos constante.

Piénsalo así: creamos una señal constante que apunta hacia un usuario, pero borramos la etiqueta de nombre de ese usuario y escribimos con un nombre diferente. El usuario en cuestión no ha cambiado, la persona todavía existe, pero una parte de sus datos internos ha cambiado.

Ahora, si hubiéramos hecho que la propiedad del nombre fuera una constante usando let, entonces no se podría cambiar: tenemos una señal constante que apunta a un usuario, pero hemos escrito su nombre en tinta permanente para que no se pueda borrar.

Por el contrario, ¿qué sucede si hacemos tanto la instancia de usuario como las variables de propiedad del nombre? Ahora podríamos cambiar la propiedad, pero también podríamos cambiar a una instancia de usuario completamente nueva si quisiéramos. Para continuar con la analogía de la señal, sería como girar la señal para apuntar a una persona completamente diferente.

```swift
class UserName2 {
    var name = "Paul"
}

var userName2 = UserName2()
userName2.name = "Taylor"
userName2 = UserName2()
print(userName2.name)
Pruébalo con este código:
```

Eso terminaría imprimiendo "Paul", porque a pesar de que cambiamos el nombre a "Taylor", luego sobrescribimos todo el objeto del usuario con uno nuevo, restableciéndolo de nuevo a "Paul".

La variación final es tener una instancia variable y propiedades constantes, lo que significaría que podemos crear un nuevo usuario si queremos, pero una vez hecho esto, no podemos cambiar sus propiedades.

Por lo tanto, terminamos con cuatro opciones:


- Instancia constante, propiedad constante: una señal que siempre apunta al mismo usuario, que siempre tiene el mismo nombre.


- Instancia constante, propiedad variable: una señal que siempre apunta al mismo usuario, pero su nombre puede cambiar.

- Instancia variable, propiedad constante: una señal que puede apuntar a diferentes usuarios, pero que sus nombres nunca cambian.

- Instancia variable, propiedad variable: una señal que puede apuntar a diferentes usuarios, y esos usuarios también pueden cambiar sus nombres.


Esto puede parecer terriblemente confuso, y tal vez incluso pedante. Sin embargo, tiene un propósito importante debido a la forma en que se comparten las instancias de clase.

Digamos que se te ha dado una instancia de usuario. Su instancia es constante, pero la propiedad dentro se declaró como una variable. Esto le dice no solo que puede cambiar esa propiedad si lo desea, sino que, lo que es más importante, le dice que existe la posibilidad de que la propiedad se cambie en otro lugar: esa clase que tiene podría ser una copia de otro lugar, y debido a que la propiedad es variable, significa que alguna otra parte del código podría cambiarla por sorpresa.

Cuando ves propiedades constantes, significa que puedes estar seguro de que ni tu código actual ni ninguna otra parte de tu programa pueden cambiarlo, pero tan pronto como estés tratando con propiedades variables, independientemente de si la instancia de clase en sí es constante o no, se abre la posibilidad de que los datos puedan cambiar bajo tus pies.

Esto es diferente de las estructuras, porque las estructuras constantes no pueden cambiar sus propiedades incluso si las propiedades se hicieron variables. Esperemos que ahora puedas ver por qué sucede esto: las estructuras no tienen todo el asunto de la señal en marcha, mantienen sus datos directamente. Esto significa que si intentas cambiar un valor dentro de la estructura, también estás cambiando implícitamente la estructura en sí, lo que no es posible porque es constante.

Una ventaja de todo esto es que las clases no necesitan usar la palabra clave mutante con métodos que cambian sus datos. Esta palabra clave es muy importante para las estructuras porque las estructuras constantes no pueden cambiar sus propiedades sin importar cómo se crearon, por lo que cuando Swift nos ve llamando a un método de mutación en una instancia de estructura constante, sabe que eso no debería estar permitido.

Con las clases, la forma en que se creó la instancia en sí ya no importa: lo único que determina si una propiedad se puede modificar o no es si la propiedad en sí se creó como una constante. Swift puede ver eso por sí mismo con solo mirar cómo hiciste la propiedad, por lo que ya no hay necesidad de marcar el método especialmente.


## ¿Por qué se pueden cambiar las propiedades variables en las clases constantes?

Una de las pequeñas pero importantes diferencias entre las estructuras y las clases es la forma en que manejan la mutabilidad de las propiedades:

- Las clases variables pueden tener propiedades variables cambiadas

- Las clases constantes pueden tener propiedades variables cambiadas

- Las estructuras variables pueden tener propiedades variables modificadas

- Las estructuras constantes no pueden cambiar las propiedades variables

La razón de esto radica en la diferencia fundamental entre una clase y una estructura: uno apunta a algunos datos en la memoria, mientras que el otro es un valor como el número 5.

Considere un código como este:

```swift
var number = 5
number = 6
```

No podemos simplemente definir el número 5 como 6, porque eso no tendría sentido, rompería todo lo que sabemos sobre matemáticas. En su lugar, ese código elimina el valor existente asignado al número y le da el número 6 en su lugar.

Así es como funcionan las estructuras en Swift: cuando cambiamos una de sus propiedades, de hecho estamos cambiando toda la estructura. Claro, detrás de escena Swift puede hacer algo de optimización para que realmente no esté tirando todo el valor cada vez que cambiamos solo una parte de él, pero así es como se trata desde nuestra perspectiva.

Por lo tanto, si cambiar una parte de una estructura significa efectivamente destruir y recrear toda la estructura, espero que puedas ver por qué las estructuras constantes no permiten cambiar sus propiedades variables, significaría destruir y recrear algo que se supone que es constante, lo cual no es posible.

Las clases no funcionan de esta manera: puedes cambiar cualquier parte de sus propiedades sin tener que destruir y recrear el valor. Como resultado, las clases constantes pueden cambiar libremente sus propiedades variables.

# Resumen: Clases


Las clases no se usan tan comúnmente como las estructuras, pero tienen un propósito invaluable para compartir datos, y si alguna vez eliges aprender el marco UIKit más antiguo de Apple, te encontrarás usándolos ampliamente.

Vamos a recapitular lo que hemos aprendido:

- Las clases tienen muchas cosas en común con las estructuras, incluida la capacidad de tener propiedades y métodos, pero hay cinco diferencias clave entre las clases y las estructuras.

- En primer lugar, las clases pueden heredar de otras clases, lo que significa que tienen acceso a las propiedades y métodos de su clase principal. Opcionalmente, puede anular los métodos en las clases secundarias si lo desea, o marcar una clase como final para evitar que otros la subclasifiquen.

- En segundo lugar, Swift no genera un inicializador por miembros para las clases, por lo que tienes que hacerlo tú mismo. Si una subclase tiene su propio inicializador, siempre debe llamar al inicializador de la clase principal en algún momento.

- En tercer lugar, si creas una instancia de clase y luego tomas copias de ella, todas esas copias apuntan a la misma instancia. Esto significa que cambiar algunos datos en una de las copias los cambia a todos.

- En cuarto lugar, las clases pueden tener desinicializadores que se ejecutan cuando se destruye la última copia de una instancia.

- Por último, las propiedades variables dentro de las instancias de clase se pueden cambiar independientemente de si la instancia en sí se creó como variable.


## Punto de control 7


Ahora que entiendes cómo funcionan las clases y, lo que es igual de importante, cómo son diferentes de las estructuras, es hora de abordar un pequeño desafío para comprobar tu progreso.

Tu desafío es el siguiente: hacer una jerarquía de clases para los animales, comenzando con Animal en la parte superior, luego Perro y Gato como subclases, luego Corgi y Caniche como subclases de Perro, y Persa y León como subclases de Gato.

Pero hay más:

La clase Animal debe tener una propiedad entera de patas que rastree cuántas patas tiene el animal.

La clase Dog debería tener un método speak() que imprima una cadena genérica de ladridos de perros, pero cada una de las subclases debería imprimir algo ligeramente diferente.

La clase Cat debería tener un método speak() coincidente, de nuevo con cada subclase imprimiendo algo diferente.

La clase Cat debe tener una propiedad booleana isTame, proporcionada mediante un inicializador.

Te daré algunos consejos en un momento, pero primero te recomiendo que lo pruebes tú mismo.



¿Sigues aquí? Vale, aquí hay algunas pistas:

Necesitarás siete clases independientes aquí, de las cuales solo una no tiene clase para padres.

Para hacer que una clase herede de otra, escríbela así: clase SomeClass: OtherClass.

Puedes hacer que las subclases tengan un método speak() diferente al de su padre utilizando la palabra clave override.

Todas nuestras subclases tienen cuatro patas, pero aún debes asegurarte de pasar esos datos a la clase Animal dentro del inicializador Cat.

