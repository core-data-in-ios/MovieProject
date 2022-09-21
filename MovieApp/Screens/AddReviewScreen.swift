//
//  AddReviewScreen.swift
//  MovieApp
//
//  Created by Chris Hand on 9/20/22.
//

import SwiftUI

struct AddReviewScreen: View {
    
    // @StateObject private var addReviewVM = AddReviewViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title: String = ""
    @State private var text: String = ""
    
    var body: some View {
        Form {
            TextField("Enter title:", text: $title)
            TextEditor(text: $text)
            
            HStack {
                Spacer()
                Button("Save") {
                    
                }
                Spacer()
            }
        }
        .navigationTitle("Add Review")
        .embedInNavigationView()
    }
}

struct AddReviewScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddReviewScreen()
    }
}
