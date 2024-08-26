//
//  UserView.swift
//  SwiftDataProjectTuto
//
//  Created by Esteban Perez Castillejo on 11/8/24.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]
    @Environment(\.modelContext) var modelContext
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    var body: some View {
        List(users){ user in
            Text(user.name)
            Spacer()

            Text(String(user.jobs.count))
                .fontWeight(.black)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
        
        }
    }
    
    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)

        modelContext.insert(user1)

        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
}

#Preview {
    UsersView(minimumJoinDate: Date(), sortOrder:   [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
