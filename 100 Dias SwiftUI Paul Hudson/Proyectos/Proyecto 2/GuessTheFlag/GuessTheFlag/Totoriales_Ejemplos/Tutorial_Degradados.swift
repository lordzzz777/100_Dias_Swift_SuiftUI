//
//  Tutorial3.swift
//  GuessTheFlag
//
//  Created by Esteban Perez Castillejo on 22/5/24.
//

import SwiftUI

struct LinearGradientView: View {
    var body: some View {
        VStack {
/// Esto contrulle un color degradado
           
            LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
            
/// En este ejemplo le decimos el porcentaje de espacio que queremos que actue
           
            LinearGradient(stops: [
                Gradient.Stop(color: .orange, location: 0.45),
                Gradient.Stop(color: .yellow, location: 0.55),
            ], startPoint: .top, endPoint: .bottom)
            
///Consejo: Swift sabe que estamos creando paradas de degradado aquí, por lo que como acceso directo podemos escribir .init en lugar de Gradient.Stop, así:
           
            LinearGradient(stops: [
                .init(color: .purple, location: 0.45),
                .init(color: .pink, location: 0.55),
            ], startPoint: .top, endPoint: .bottom)
  
/// Como alternativa, los gradientes radiales se mueven hacia afuera en forma de círculo, por lo que en lugar de especificar una dirección, especificamos un radio de inicio y final: qué tan lejos del centro del círculo el color debe comenzar y dejar de cambiar. Por ejemplo:
            
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            
/// El último gradiente que también es una vista se llama gradiente angular, aunque es posible que hayas oído que se refiere a él en otro lugar como un gradiente cónico o cónico. Esto hace que los colores circulen alrededor de un círculo en lugar de irradiar hacia el exterior, y puede crear algunos efectos hermosos.
            
/// Por ejemplo, esto pasa a través de una gama de colores en un solo gradiente, centrado en el centro del degradado:
            
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
            
/// SwiftUI proporciona un cuarto tipo de degradado que es más simple que estos tres primeros: no tienes ningún control sobre él, y también puedes usarlos solo como fondos y estilos de primer plano en lugar de vistas individuales.
            
/// Este gradiente se crea simplemente añadiendo .gradient después de cualquier color: SwiftUI convertirá automáticamente su color en un degradado lineal muy suave. Pruébalo así:
            
            Text("Your content")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(.red.gradient)
            
        }.ignoresSafeArea()
    }
}

#Preview {
    LinearGradientView()
}
