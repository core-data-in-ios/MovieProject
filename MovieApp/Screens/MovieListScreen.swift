//
//  MovieListScreen.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/24/21.
//

import SwiftUI

struct MovieListScreen: View {
    
    @StateObject private var movieListVM = MovieListViewModel()
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            
            ForEach(movieListVM.movies, id: \.id) { movie in
                // replaced the origanal Text() with the Cell definition. Very Nice.
//                NavigationLink(
//                    destination: ReviewListScreen(movie: movie),
//                    label { MovieCell(movie: movie) })
                NavigationLink(destination: ReviewListScreen(movie: movie), label: {
                    MovieCell(movie: movie)
                })
                
            }
            // Instructor comment was to not do the delete in a closure here.
            // I While we probably could, I assume there would be a bunch of jumping around if you were deleting multiple movies
            // That functionality isn't enabled here though. I should go back later and learn how to do that.
            .onDelete(perform: deleteMovie)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Movies")
        .navigationBarItems(trailing: Button("Add Movie") {
            isPresented = true 
        })
        
        // this is the trick to reload the list of movies after addMovie is dismissed
        .sheet(isPresented: $isPresented, onDismiss: {
            movieListVM.getAllMovies()
        },  content: {
            AddMovieScreen()
        })
        .embedInNavigationView()
        
        // this is how to load the movies on the initial load of the view.
        .onAppear(perform: {
            movieListVM.getAllMovies()
        })
    }
    
    private func deleteMovie(at indexSet: IndexSet) {
        // There will only ever be one movie, but we can at least handle if the code gets updated
        // to allow the user to select multiple movies to delete
        indexSet.forEach { index in
            let movie = movieListVM.movies[index]
            
            movieListVM.deleteMovie(movie: movie)
            
            // causes the view to refresh
            movieListVM.getAllMovies()
            
        }
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieListScreen()
        }
    }
}

// This did have hard coded values, and wasn't initially used.
// We added a movie memeber, then updated the Text() to use properties from it.
struct MovieCell: View {
    
    let movie: MovieViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .fontWeight(.bold)
                Text(movie.director)
                    .font(.caption2)
                Text(movie.releaseDate ?? "")
                    .font(.caption)
            }
            Spacer()
            RatingView(rating: .constant(movie.rating))
        }
    }
}
