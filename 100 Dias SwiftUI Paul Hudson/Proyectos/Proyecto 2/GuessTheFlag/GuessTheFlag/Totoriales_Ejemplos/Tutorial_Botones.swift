//
//  Tutorial4.swift
//  GuessTheFlag
//
//  Created by Esteban Perez Castillejo on 22/5/24.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        VStack {
            // Foma senciilla de botón
            Button("Pulsa para hacer clip"){
                print("Has hecho clip")
            }
            
             ///podría ser cualquier función en lugar de solo un cierre,
            ///así que este tipo de cosas están bien:
            Button("Pulsa para hacer clip2", action: admeClip)
            
            /// se puede personalizar de esta forma
            Button("Ejemplo botoón de estilo -> Borara", role: .destructive, action: executeDelete)
        }
/// En segundo lugar, podemos usar uno de los estilos integrados para los botones: .bordered y .borderedProminent. Estos pueden ser utilizados por sí mismos, o en combinación con un papel:
    Divider()
        VStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            Divider()
/// Si quieres personalizar los colores utilizados para un botón bordeado, usa el modificador tint() como este:
            Button("Button 3") { admeClip() }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
        }
/// Importante: Apple recomienda explícitamente no usar demasiados botones prominentes, porque cuando todo es prominente, nada lo es.
        
/// Si quieres algo completamente personalizado, puedes pasar una etiqueta personalizada usando un segundo cierre final:
        
        Button {
            admeClip()
        } label: {
            Text("¡Tocame!")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
        .padding()
        
/// Debido a que la forma más larga de botones puede tener cualquier tipo de vistas dentro de ellos, puedes usar imágenes como esta:
        Button {
            print("Edit button was tapped")
        } label: {
            /// imagen predeterminada de sistema
            Image(systemName: "pencil").font(.system(size: 30))
        }.padding()

/// Si quieres tanto el texto como la imagen al mismo tiempo, tienes dos opciones. El primero es proporcionarlos a ambos directamente al botón, de esta manera:
       
        Button {
            print("Edit button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
        
    }
    
    func admeClip(){
        print("Me has hecho clip")
    }
    
    func executeDelete(){
        print("Me has hecho clip para borra?")
    }
}

#Preview {
    ButtonsView()
}
