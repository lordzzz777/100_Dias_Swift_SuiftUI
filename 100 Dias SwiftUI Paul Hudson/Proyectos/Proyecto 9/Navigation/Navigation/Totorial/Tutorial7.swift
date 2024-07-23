//
//  Tutorial7.swift
//  Navigation
//
//  Created by Esteban Perez Castillejo on 23/7/24.
//

import SwiftUI

struct Tutorial7: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)// cambia el color de la barra de navegación
            .toolbarColorScheme(.dark)// fuerza a que al desplazar la barra de navegaciín este en modo oscuro
            //.toolbar(.hidden, for: .navigationBar )
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("Tap Me 1"){
                        // ...
                    }
                    
                  //MARK: Aunque eso funciona bien, por lo general es mejor usar una de las opciones semánticas: colocación que tenga un significado específico, en lugar de confiar solo en su ubicación. Estos incluyen:
                    
                  //MARK: .confirmationAction, cuando quieres que los usuarios acepten algo, como aceptar los términos de servicio.

                  //MARK: .destructiveAction, cuando el usuario necesita tomar la decisión de destruir lo que sea que esté trabajando, como confirmar que quiere eliminar algunos datos que creó.

                  //MARK: .cancellationAction, cuando el usuario necesita dar la espalda a  los cambios que ha realizado, como descartar los cambios que ha realizado.

                 //MARK: .Navigation, que se utiliza para botones que hacen que el usuario se mueva entre los datos, como ir hacia atrás y hacia adelante en un navegador web.
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Tap Me 2") {
                        // button action here
                    }
                }

                ToolbarItem(placement: .topBarLeading) {
                    Button("Or Tap Me 3") {
                        // button action here
                    }
                }
                
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Tap Me 4") {
                        // button action here
                    }

                    Button("Tap Me 5") {
                        // button action here
                    }
                }
            }
        }
    }
}

#Preview {
    Tutorial7()
}
