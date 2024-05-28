//
//  Day_53_Project11App.swift
//  Day_53-Project11
//
//  Created by Bruno Oliveira on 28/05/24.
//

/*Now that we've defined the data we want to work with, we can proceed to the second step of setting up SwiftData: writing a little Swift code to load that model. This code will tell SwiftData to prepare some storage for us on the iPhone, which is where it will read and write Student objects.
 
 This work is best done in the App struct. Every project has one of these, including all the projects we've made so far, and it acts as the launch pad for the whole app we're running.*/

/*You can see it looks a bit like our regular view code: we still have an import SwiftUI, we still use a struct to create a custom type, and there's our ContentView right there. The rest is new, and really we care about two parts:*/

import SwiftData
import SwiftUI

//1- The @main line tells Swift this is what launches our app. Internally this is what bootstraps the whole program when the user launches our app from the iOS Home Screen.
@main
struct Day_53_Project11App: App {
    var body: some Scene {
        //2- The WindowGroup part tells SwiftUI that our app can be displayed in many windows. This doesn't do much on iPhone, but on iPad and macOS it becomes a lot more important.
        WindowGroup {
            ContentView()
        }
        /*This is where we need to tell SwiftData to setup all its storage for us to use, which again takes two very small changes.
         
         First, we need to add import SwiftData next to import SwiftUI. I'm a big fan of sorting my imports alphabetically, but it's not required.

         Second, we need to add a modifier to the WindowGroup so that SwiftData is available everywhere in our app:*/
        .modelContainer(for: Student.self)
        
        //A model container is SwiftData's name for where it stores its data. The first time your app runs this means SwiftData has to create the underlying database file, but in future runs it will load the database it made previously.
        
        /*At this point you've seen how to create data models using @Model, and you've sent how to create a model container using the modelContainer() modifier. The third part of the puzzle is called the model context, which is effectively the “live” version of your data – when you load objects and change them, those changes only exist in memory until they are saved. So, the job of the model context is to let us work with all our data in memory, which is much faster than constantly reading and writing data to disk.
         
         Every SwiftData app needs a model context to work with, and we've already created ours – it's created automatically when we use the modelContainer() modifier. SwiftData automatically creates one model context for us, called the main context, and stores it in SwiftUI's environment,

         That completes all our SwiftData configuration, so now it's time for the fun part: reading data, and writing it too.*/
    }
}
