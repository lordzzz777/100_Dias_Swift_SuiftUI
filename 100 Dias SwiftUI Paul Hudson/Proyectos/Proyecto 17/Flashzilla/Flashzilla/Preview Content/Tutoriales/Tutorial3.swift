//
//  Tutorial3.swift
//  Flashzilla
//
//  Created by Esteban Pérez Castillejo on 23/9/24.
//
// Activación de eventos repetidamente usando un temporizador

import SwiftUI

struct Tutorial3: View {
    @State private var counter = 0
    /// iOS viene con una clase de temporizador incorporada que nos permite ejecutar código de forma regular. Esto utiliza un sistema de editores que proviene de un marco de Apple llamado Combine: se lanzó al mismo tiempo que SwiftUI, hace mucho tiempo en iOS 13, pero desde entonces ha sido reemplazado principalmente por características del lenguaje Swift, como la palabra clave esperar.
    
  ///   La biblioteca del sistema principal de Apple se llama Foundation, y nos da cosas como Data, Date, SortDescriptor, UserDefaults y mucho más. También nos da la clase Timer, que está diseñada para ejecutar una función después de un cierto número de segundos, pero también puede ejecutar código repetidamente. Combine añade una extensión a esto para que los temporizadores puedan convertirse en editores, que son cosas que anuncian cuando cambia su valor.

   /// El código para crear un editor de temporizadores se ve así:
   
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    /// Eso hace varias cosas a la vez:
    
    ///  Le pide al temporizador que dispare cada 1 segundo.

    ///  Dice que el temporizador debería funcionar en el hilo principal.

    /// Dice que el temporizador debe ejecutarse en el bucle de ejecución común, que es el que querrá usar la mayor parte del tiempo. (Los bucles de ejecución permiten que iOS maneje el código en ejecución mientras el usuario está haciendo algo activamente, como desplazarse por una lista).

    /// Conecta el temporizador inmediatamente, lo que significa que comenzará a contar el tiempo.

    
    /// Asigna todo a la constante del temporizador para que se mantenga vivo.

    /// Una vez que el temporizador comience, enviará anuncios de cambios que podemos monitorear en SwiftUI usando un nuevo modificador llamado onReceive(). Esto acepta un editor como su primer parámetro y una función para ejecutar como su segundo, y se asegurará de que esa función se llame cada vez que el editor envíe su notificación de cambio.

    /// Para nuestro ejemplo de temporizador, podríamos recibir sus notificaciones como esta:

    var body: some View {
//        
//        Text("Hello, World!")
//            .onReceive(timer) { time in
//                print("The time is now \(time)")
//            }
        /// Eso imprimirá el tiempo cada segundo hasta que el temporizador finalmente se detenga.
        
        /// Hablando de detener el temporizador, se necesita un poco de excavación para detener el que creamos. Verá, la propiedad del temporizador que hicimos es un editor conectado automáticamente, por lo que tenemos que ir a su editor ascendente para encontrar el propio temporizador. Desde allí podemos conectarnos al editor del temporizador y pedirle que se cancele. Honestamente, si no fuera por la finalización del código, esto sería bastante difícil de encontrar, pero así es como se ve en el código:
       /// `timer.upstream.connect().cancel()
        
        
        Text("Hello, World!")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }

                counter += 1
            }
        
    }
    /// Antes de que terminemos, hay un concepto de temporizador más importante que quiero mostrarte: si te parece bien que tu temporizador tenga un poco de flotación, puedes especificar algo de tolerancia. Esto permite a iOS realizar una importante optimización de la energía, porque puede disparar el temporizador en cualquier punto entre su tiempo de fuego programado y su tiempo de fuego programado más la tolerancia que especifique.
    
    /// En la práctica, esto significa que el sistema puede realizar una fusión del temporizador: puede retrasar un poco el temporizador para que se encienda al mismo tiempo que uno o más temporizadores, lo que significa que puede mantener la CPU inactiva más y ahorrar energía de la batería.

    /// Como ejemplo, esto añade medio segundo de tolerancia a nuestro temporizador:
    /// `let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    /// Si necesita mantener el tiempo estrictamente, entonces dejar fuera el parámetro de tolerancia hará que su temporizador sea lo más preciso posible, pero tenga en cuenta que incluso sin ninguna tolerancia, la clase de temporizador sigue siendo el "mejor esfuerzo" - el sistema no garantiza que se ejecutará con precisión.
}

#Preview {
    Tutorial3()
}
