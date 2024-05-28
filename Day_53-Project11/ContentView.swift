//
//  ContentView.swift
//  Day_53-Project11
//
//  Created by Bruno Oliveira on 28/05/24.
//

/*Retrieving information from SwiftData is done using a query – we describe what we want, how it should sorted, and whether any filters should be used, and SwiftData sends back all the matching data. We need to make sure that this query stays up to date over time, so that as students are created or removed our UI stays synchronized.
 
 SwiftUI has a solution for this, and – you guessed it – it’s another property wrapper. This time it’s called @Query and it's available as soon as you add import SwiftData to a file.

 So, add an import for SwiftData at the top of ContentView.swift, then add this property to the ContentView struct:*/

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var students: [Student]
    /*That looks like a regular Student array, but just adding @Query to the start is enough to make SwiftData loads students from its model container – it automatically finds the main context that was placed into the environment, and queries the container through there. We haven't specified which students to load, or how to sort the results, so we'll just get all of them.
     
     From there, we can start using students like a regular Swift array.*/
    
    //property to access the model context that was created earlier
    @Environment(\.modelContext) var modelContext
    
    //properties to create a random list of students
    let firstNames = ["Ginny","Harry","Hermione", "Luna", "Ron"]
    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    for _ in 0..<10 {
                        let chosenFirstName = firstNames.randomElement()!
                        let chosenLastName = lastNames.randomElement()!
                        
                        //creating a Student object
                        let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                        
                        //asking our model context to add that student, which means it will be saved
                        modelContext.insert(student)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
