//
//  AddMovieViewModel.swift
//  MovieApp
//
//  Created by Chris Hand on 9/18/22.
//

import Foundation

class AddMovieViewModel : ObservableObject {
    
    var title: String = ""
    var director: String = ""
    
    // The @Published allows the star rating view to still work
    @Published var rating: Int? = nil
    
    
    var releaseData: Date = Date()
    
    func save() {
        let manager = CoreDataManager.shared
        let movie = Movie(context: manager.persistantContainer.viewContext)
        movie.title = title
        movie.director = director
        movie.rating = Double(rating ?? 0)
        movie.releaseDate = releaseData
        
        manager.save()
    }
    
}
