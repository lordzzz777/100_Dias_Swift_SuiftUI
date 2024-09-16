//
//  Tutorial7.swift
//  HotProspects
//
//  Created by Esteban Perez Castillejo on 16/9/24.
//

/// iOS tiene un marco llamado UserNotifications que hace casi exactamente lo que esperas: nos permite crear notificaciones al usuario que se pueden mostrar en la pantalla de bloqueo. Tenemos dos tipos de notificaciones con las que trabajar, y difieren dependiendo de dónde se crearon: las notificaciones locales son las que programamos localmente, y las notificaciones remotas (comúnmente llamadas notificaciones push) se envían desde un servidor en algún lugar.

/// Las notificaciones remotas requieren que un servidor funcione, porque envías tu mensaje al servicio de notificaciones push de Apple (APNS), que luego lo reenvía a los usuarios. Pero las notificaciones locales son agradables y fáciles en comparación, porque podemos enviar cualquier mensaje en cualquier momento siempre y cuando el usuario lo permita.

/// Para probar esto, comience agregando una importación adicional cerca de la parte superior de ContentView.swift:
import SwiftUI
import UserNotifications

/// A continuación, vamos a poner una estructura básica que rellenaremos con el código de notificaciones locales. El uso de notificaciones locales requiere pedir permiso al usuario y luego registrar realmente la notificación que queremos mostrar. Colocaremos cada una de esas acciones en botones separados dentro de un VStack.
struct Tutorial7: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                /// Bien, esa es nuestra configuración completa, así que centrémonos en la primera de dos piezas de trabajo importantes: solicitar autorización para mostrar alertas. Las notificaciones pueden tomar una variedad de formas, pero lo más común es pedir permiso para mostrar alertas, insignias y sonidos; eso no significa que debamos usarlas todas al mismo tiempo, pero pedir permiso por adelantado significa que podemos ser selectivos más adelante.
                
              ///   Cuando le decimos a iOS qué tipo de notificaciones queremos, mostrará un mensaje al usuario para que tenga la última decir sobre lo que nuestra aplicación puede hacer. Cuando hagan su elección, se llamará a un cierre que proporcionamos y nos dirá si la solicitud fue exitosa o no.
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }

            Button("Schedule Notification") {
            /// Si el usuario otorga permiso, entonces todos estamos listos para comenzar a programar notificaciones. Aunque las notificaciones pueden parecer simples, Apple las divide en tres partes para darle la máxima flexibilidad:
                
            ///  El contenido es lo que se debe mostrar, y puede ser un título, subtítulo, sonido, imagen, etcesí.

            /// El disparador determina cuándo se debe mostrar la notificación, y puede ser un número de segundos a partir de ahora, una fecha y hora en el futuro o una ubicación.

            /// La solicitud combina el contenido y el activador, pero también añade un identificador único para que pueda editar o eliminar alertas específicas más adelante. Si no quieres editar o eliminar cosas, usa UUID().uuidString para obtener un identificador aleatorio.

            /// Cuando solo estás aprendiendo notificaciones, el tipo de activación más fácil de usar es UNTimeIntervalNotificationTrigger, que nos permite solicitar que se muestre una notificación en un cierto número de segundos a partir de ahora.
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default

                // Mostrar esta notificación dentro de cinco segundos
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                // Elige un identificador aleatorio
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // Añadir nuestra solicitud de notificación
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    Tutorial7()
}
