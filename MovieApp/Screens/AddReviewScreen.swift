//
//  AddReviewScreen.swift
//  MovieApp
//
//  Created by Chris Hand on 9/20/22.
//

import SwiftUI

struct AddReviewScreen: View {
    
    @StateObject private var addReviewVM = AddReviewViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    let movie: MovieViewModel
    
    // @State private var title: String = ""
    // @State private var text: String = ""
    
    var body: some View {
        Form {
            TextField("Enter title:", text: $addReviewVM.title)
            TextEditor(text: $addReviewVM.text)
            
            HStack {
                Spacer()
                Button("Save") {
                    addReviewVM.addReviewForMovie(movieVM: movie)
                    presentationMode.wrappedValue.dismiss()
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
        let movie = MovieViewModel(movie: Movie(context: CoreDataManager.shared.viewContext))
        AddReviewScreen(movie: movie)
    }
}
