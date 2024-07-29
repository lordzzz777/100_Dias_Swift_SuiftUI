//
//  DetailsView.swift
//  HabitTracking
//
//  Created by Esteban Perez Castillejo on 28/7/24.
//

import SwiftUI

struct DetailsView: View {
    @State var model: HabitTrackingModel
    @State var viewmodel: HabitItemsViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                
                Section("Cuanto progrso Tengo realizado:"){
                    Stepper("\(String(format: "%.2f", model.countHabit)) %", value: $model.countHabit, in: 0...100.0, step: 5.0 )
                        .onChange(of: model.countHabit) { _, _ in
                            // elemento filtiltrado, seria un arreglo del modelo
                            let filteredItem = viewmodel.items.filter {$0.id == model.id} // comopara
                            let item = filteredItem[0] // obtener el primer elemento de un arreglo
                            
                            // obteniendo el indice de donde los id de los items, son iguales
                            if let index = viewmodel.items.firstIndex(where: {$0.id == item.id} ){
                                viewmodel.items[index] = model // actualizadondo  el elemento que corresponda al indice, del arreglo de los objeto, en el viewmodel
                            }
                            
                        }
                }
                ScrollView{
                    Text(model.comment)
                }
                .navigationTitle(model.title)
            }.padding()
            
        }
        
    }
}

#Preview {
    @State var model = HabitTrackingModel(title: "Titulo de ejemplo", comment: """
Su objetivo es construir una aplicación de seguimiento de hábitos, para las personas que quieren hacer un seguimiento de cuánto hacen ciertas cosas. Eso podría ser aprender un idioma, practicar un instrumento, hacer ejercicio o lo que sea: pueden decidir qué actividades añaden y rastrearlas como quieran.

Por lo menos, esto significa que debería haber una lista de todas las actividades que quieren rastrear, además de un formulario para agregar nuevas actividades; un título y una descripción deberían ser suficientes.

Para un desafío más grande, tocar una de las actividades debería mostrar una pantalla de detalles con la descripción. Para un desafío difícil, ¡vea las sugerencias a continuación! - haga que esa pantalla de detalles contenga cuántas veces la han completado, además de un botón que aumente su recuento de finalización.

Y si quieres que la aplicación sea realmente útil, usa Codable y UserDefaults para cargar y guardar todos tus datos.

Por lo tanto, hay tres niveles en esta aplicación, y puedes elegir hasta dónde quieres llegar dependiendo de cuánto tiempo tengas y hasta dónde quieras esforzarte. Sin embargo, te recomiendo que al menos pruebes cada nivel, ¡cada poco de práctica que obtengas ayuda a solidificar tu aprendizaje!
""")
    @State  var viewModel = HabitItemsViewModel()
    return DetailsView(model: model, viewmodel: viewModel)
}
