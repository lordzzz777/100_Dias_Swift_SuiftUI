//
//  Tutorial1.swift
//  SnowSeeker
//
//  Created by Esteban Pérez Castillejo on 9/10/24.
//
// Trabajando con dos vistas una al lado de la otra en SwiftUI

import SwiftUI

struct Tutorial1: View {
    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.all)) {
            NavigationLink("Primary") {
                Text("New view")
            
                /// Cuando inicias la aplicación, lo que veas una vez más depende de tu dispositivo y orientación:
                
                /// En el iPhone verás Principal.

                /// En el iPad, en horizontal, verás Principal en una barra lateral a lo largo del borde de inicio de tu dispositivo, y Contenido llenando el resto de la pantalla.

                /// En el iPad, en modo vertical, verás Contenido llenando la pantalla.

                /// iPadOS hace dos cosas muy inteligentes aquí.

                /// En primer lugar, independientemente de la orientación de su dispositivo, verá un botón que muestra u oculta la vista principal, para que los usuarios puedan elegir el diseño que quieran.

                /// En segundo lugar, cuando activas la multitarea, si traes una ventana de Safari al lado, por ejemplo, verás que las vistas de nuestra aplicación se adaptan para que la vista principal esté oculta, porque el sistema reconoce que la cantidad de espacio libre ha disminuido.

                /// SwiftUI vincula automáticamente las vistas primaria y secundaria, lo que significa que si tiene un NavigationLink en la vista principal, cargará automáticamente su contenido en la vista secundaria:
            }
        } detail: {
            Text("Content")
                .navigationTitle("Content View")
        }
        .navigationSplitViewStyle(.balanced)
        /// Hay algunas formas de personalizar el comportamiento de esta vista dividida.
        
        /// Por ejemplo, puedes decirle a iOS que prefiera mantener la vista principal cuando el espacio es parcialmente limitado
        
        /// Eso solicita que todas las columnas se muestren en un estilo de equilibrio, y el resultado es que los iPads en modo vertical ahora mostrarán la vista principal.
        
        /// Consejo: columnVisibility en realidad se proporciona como un enlace, por lo que podría almacenar su opción en algún estado y actualizarla dinámicamente.

        /// En segundo lugar, puede decirle al sistema que prefiera la vista detallada por defecto, lo cual es útil en el iPhone donde la vista principal se selecciona como estándar:
    }
}

#Preview {
    Tutorial1()
}
