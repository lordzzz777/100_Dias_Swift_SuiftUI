//
//  ContentView.swift
//  HabitTracking
//
//  Created by Esteban Perez Castillejo on 28/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = HabitItemsViewModel()
    @State private var isShowModal = false
    @State private var maxiCount: CGFloat = 100.0
    @State private var modelo = HabitTrackingModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach (viewModel.items, id: \.id){ item in
                    NavigationLink{
                        DetailsView(model: item, viewmodel: viewModel)
                        
                    } label: {
                        VStack(alignment: .leading){
                            Text(item.title).font(.title.bold())
                                .padding(.bottom, 10)
                            Text("Nivel de reto conseguido:")
                            HStack{
                                Text("\(String(format: "%.2f", item.countHabit)) %")
                                ProgressView(value: item.countHabit, total: maxiCount)
                            }
                        }
                    }
                    
                }.onDelete(perform: { indexSet in
                    removeItems(at: indexSet)
                })
            }
            .navigationTitle("Liasta de retos")
            .sheet(isPresented: $isShowModal) {
                AddActivitiesView(habitItemsViewModel: viewModel)
                    .presentationDetents([.medium])
            }
            .toolbar{
                ToolbarItem{
                    Button(action: {
                        isShowModal = true
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            }
        }
    }
    
    
    func removeItems(at offsets: IndexSet){
        viewModel.items.remove(atOffsets: offsets)
    }
    
   
}

#Preview {
    ContentView()
}
