//
//  CoreDataManager.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import Foundation
import CoreData

class CoreDataManager {
    // This is added code from the lecture
   
    let persistantContainer: NSPersistentContainer
    static let shared = CoreDataManager() //A singleton instance
    
    private init() {
        persistantContainer = NSPersistentContainer(name: "MovieAppModel") // the name of the entity
        persistantContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("failed to initialize Core Data \(error.localizedDescription)")
            }
        }
    }
    
    
    func save() {
        do {
            try persistantContainer.viewContext.save()
        } catch {
            fatalError("Failed to save a movie \(error.localizedDescription)")
        }
    }
    
    
    func getMovieById(id: NSManagedObjectID) -> Movie? {
        do {
            return try persistantContainer.viewContext.existingObject(with: id) as? Movie
        } catch {
            print("getMovieById: no movie found.\n\(error.localizedDescription)")
            return nil
        }
    }
    
    
    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistantContainer.viewContext.fetch(fetchRequest)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    
    func deleteMovie(movie: Movie) {
        persistantContainer.viewContext.delete(movie)
        
        do {
            try persistantContainer.viewContext.save()
        } catch {
            persistantContainer.viewContext.rollback()
            fatalError("Could not delete movie")
        }
    }
}
