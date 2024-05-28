//
//  TextEditorField.swift
//  Day_53-Project11
//
//  Created by Bruno Oliveira on 28/05/24.
//

import SwiftUI

struct TextEditorField: View {
    @AppStorage ("notes") private var notes = ""
    @AppStorage ("notesWithGrowthTextField") private var notesWithGrowthTextField = ""
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
        .padding()
       
        Form {
        
            /*SwiftUI provides a third option that works better in some situations.
             
             When we create a TextField, we can optionally provide an axis it can grow along. This means the textfield starts out as a regular, single-line text field, but as the user types it can grow, just like the iMessage text box does. Like this:*/
            Section ("Notes With Text Field") {
                TextField("Enter yout text", text: $notesWithGrowthTextField, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            
            Section ("TextEditor way inside a Form") {
                TextEditor(text: $notesWithGrowthTextField)
                    .padding()
            }
        }
        
    }
}

#Preview {
    TextEditorField()
}
