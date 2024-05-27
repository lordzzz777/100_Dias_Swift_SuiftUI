//
//  Tutorial5.swift
//  GuessTheFlag
//
//  Created by Esteban Perez Castillejo on 22/5/24.
//

import SwiftUI

struct AlertasView: View {
    
    @State private var showAlert = false
    @State private var showAlert2 = false
    @State private var showAlert3 = false
    
    var body: some View {
        
        // cuando pulse el boton mostrar una alerta
        Button("Picha aqui y pasan cosas 1"){
            showAlert = true
        }
/// La primera parte es el título de la alerta, que es bastante sencillo, pero también hay otro enlace de datos bidireccional porque SwiftUI establecerá automáticamente showingAlert en false cuando se descarte la alerta.
        .alert("¡¡Estan pasado cosas!!", isPresented: $showAlert){
            // un botón dentro de una alerta culle cierre esta vacio
            // decartara la alerta (se cerrara)
            Button("ok"){}
        }
        
/// Aleta con unos cuantos botones, los cuales puede agregarles su propios roles
        Button("Picha aqui y pasan cosas 2"){
            showAlert2 = true
        }.alert("Esto es el texto de la alerta", isPresented: $showAlert2) {
            Button("Borrar", role: .destructive) { }// role de borrar
            Button("Cancelar", role: .cancel) { }// role de cancelar
        }
 
/// Y, por último, puedes añadir texto de mensaje para ir junto a tu título con un segundo cierre final, así:
        Button("Picha aqui y pasan cosas 3") {
            showAlert3 = true
        }
        .alert("Esto es el texto de la alerta", isPresented: $showAlert3) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Esto es el segundo texto de la alerta")
        }
    }
}

#Preview {
    AlertasView()
}
