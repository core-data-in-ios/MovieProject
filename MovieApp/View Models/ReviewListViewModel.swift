//
//  ReviewListViewModel.swift
//  MovieApp
//
//  Created by Chris Hand on 9/20/22.
//

import Foundation
import CoreData

class ReviewListViewModel: ObservableObject {
    
    @Published var reviews = [ReviewViewModel]()
    
    func getReviewsByMovie(movieVM: MovieViewModel) {
    
        let movie = CoreDataManager.shared.getMovieById(id: movieVM.id)
        if let movie = movie {
            DispatchQueue.main.async {
                self.reviews = (movie.reviews?.allObjects as! [Review]).map(ReviewViewModel.init)
            }
        }
        
    }
}

struct ReviewViewModel {
    let review: Review
    
    var reviewId: NSManagedObjectID {
        return review.objectID
    }
    
    var title: String {
        return review.title ?? ""
    }
    
    var text: String {
        return review.text ?? ""
    }
    
    var publichedDate: Date? {
        return review.publishedAt
    }
}
