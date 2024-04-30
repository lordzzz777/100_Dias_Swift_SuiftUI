//
//  FriendList.swift
//  FriendsFavoriteMovies
//
//  Created by Esteban Perez Castillejo on 28/4/24.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Environment (\.modelContext) private var modelContext
    @Query(sort: \Friend.name) private var friend: [Friend]
    
    @State private var newFriend: Friend?
    
    var body: some View {
        NavigationSplitView{
            Group{
                if !friend.isEmpty{
                    List{
                        ForEach(friend){ friend in
                            NavigationLink{
                               FriendDetail(friend: friend)
                            } label: {
                                Text(friend.name)
                            }
                        }
                        .onDelete(perform: deleteFriends)
                    }
                }else{
                    ContentUnavailableView{
                        Label("No Friend", systemImage: "person.and.person")
                    }
                }
            }
            .navigationTitle("Friend")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    EditButton()
                }
                ToolbarItem{
                    Button(action: addFriend){
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            
            .sheet(item: $newFriend){ friend in
                NavigationStack{
                    FriendDetail(friend: friend, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        }detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
        }
    }
    
    private func addFriend(){
        withAnimation{
            let newItem = Friend(name: "")
            modelContext.insert(newItem)
            newFriend = newItem
        }
    }
    
    private func deleteFriends(offsets: IndexSet){
        withAnimation{
            for index in offsets {
                modelContext.delete(friend[index])
            }
        }
    }
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
