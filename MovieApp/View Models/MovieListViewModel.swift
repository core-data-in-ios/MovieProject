//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Chris Hand on 9/18/22.
//

import Foundation
import CoreData

class MovieListViewModel : ObservableObject {
    
    
    //@Published is what will tell the view that there are changes to the list
    @Published var movies = [MovieViewModel]()
    
    func deleteMovie(movie: MovieViewModel) {
        let movie = CoreDataManager.shared.getMovieById(id: movie.id)
        if let movie = movie {
            CoreDataManager.shared.deleteMovie(movie: movie)
        }
    }
    
    
    func getAllMovies() {
        
        let movies = CoreDataManager.shared.getAllMovies()
        
        // The instructor isn't clear, but implies that the async changes to [Movies] will cause updates to the UI
        // This allows the UI to remain active as movies are loading, I suspect
        DispatchQueue.main.async {
            self.movies = movies.map(MovieViewModel.init)
        }
    }
    
}

struct MovieViewModel {
    
    let movie: Movie
    
    var id: NSManagedObjectID {
        return movie.objectID
    }
    
    var title: String {
        return movie.title ?? ""
    }
    
    var director: String {
        return movie.director ?? ""
    }
    
    var releaseDate: String? {
        return movie.releaseDate?.asFormattedString() // this is where the instuctor used this extension method.
    }
    
    var rating: Int? {
        return Int(movie.rating) //because the model created rating as a Double
    }
}
