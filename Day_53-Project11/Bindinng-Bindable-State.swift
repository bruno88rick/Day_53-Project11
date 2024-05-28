//
//  Bindinng-Bindable-State.swift
//  Day_53-Project11
//
//  Created by Bruno Oliveira on 28/05/24.
//

import SwiftUI

/*The diference Between @Binding and @Bindaable is:
 
 @Bindable is used when you`re accessing a shared class that uses the @Observable macro: You create it using @State in one view, so you have bindings available there, but you use @Bindable when sharing with other views so SwiftUI can create bindings there too.
 
 @Binding is used when you have a simple, value type piece of data rather than a separate class. For exemple, you have an @State property that stores a Boolean, a Double, an array of strings, etc, and you want to pass that around. That doesn`t use the @Observable macro, so we can`t use @Bindable. Instead, we use @Binding, so we can share that Boolean on integer in several places. This behaior makes @Binding extremely important for whenever we want to create a custom component or user interface component. At their core, UI components are just SwiftUI views like everything else, but @Binding is what sets them apart: while they might have their local @State properties, they also expose @Binding properties that let them interface directly with other views
 */

//Example above, consisdering a creating an use of the mememberMe variable on a custom component that we`ve created.

struct Bindinng_Bindable_State: View {
    /*That has a text view below the button so we can track the state of the button – try running the code and see how it works. What you’ll find is that tapping the button does indeed affect the way it appears, but our text view doesn’t reflect that change – it always says “Off”. Clearly something is changing because the button’s appearance changes when it’s pressed, but that change isn’t being reflected here. What’s happening here is that we’ve defined a one-way flow of data: Here we have the rememberMe Boolean, which gets used to create a PushButton – the button has an initial value provided by ContentView. However, once the button was created it takes over control of the value: it toggles the isOn property between true or false internally to the button, but doesn’t pass that change back on here. This is a problem, because we now have two sources of truth: Here we are storing one value, and there on PushButton another. Fortunately, this is where @Binding comes in: it allows us to create a two-way connection between PushButton and whatever is using it, so that when one value changes the other does too.

     To switch over to @Binding we need to make just two changes. First, in PushButton change its isOn property to @Binding var isOn: Bool:*/
    @State private var rememberMe = false
    //to use with a custom component that shares the rememberMe var each other:
    
    
    var body: some View {
        Toggle("Remember Me", isOn: $rememberMe)
        
        VStack {
            
            /* And second, in ContentView change the way we create the button to ... isOn: $rememberMe */
            
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

//This is the power of @Binding: as far as the button is concerned it’s just toggling a Boolean – it has no idea that something else is monitoring that Boolean and acting upon changes.

#Preview {
    Bindinng_Bindable_State()
}
