//
//  Review+Extensions.swift
//  MovieApp
//
//  Created by Chris Hand on 9/23/22.
//

import Foundation
import CoreData

extension Review {
    
    static func getReviewsByMovieId(MovieId: NSManagedObjectID) -> [Review] {
        
        let request: NSFetchRequest<Review> = Review.fetchRequest()
        request.predicate = NSPredicate(format: "movie = %@", MovieId)
        
        do {
            return try CoreDataManager.shared.viewContext.fetch(request)
        } catch {
            return []
        }
    }
}
