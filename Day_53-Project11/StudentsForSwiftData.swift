//
//  StudentsForSwiftData.swift
//  Day_53-Project11
//
//  Created by Bruno Oliveira on 28/05/24.
//

/*This class is called a SwiftData model: it defines some kind of data we want to work with in our apps. Behind the scenes, @Model builds on top of the same observation system that @Observable uses, which means it works really well with SwiftUI.*/

import SwiftData
import Foundation

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

/*Now that we've defined the data we want to work with, we can proceed to the second step of setting up SwiftData: writing a little Swift code to load that model. This code will tell SwiftData to prepare some storage for us on the iPhone, which is where it will read and write Student objects.
 
 This work is best done in the App struct. Every project has one of these, including all the projects we've made so far, and it acts as the launch pad for the whole app we're running. Look there!*/
