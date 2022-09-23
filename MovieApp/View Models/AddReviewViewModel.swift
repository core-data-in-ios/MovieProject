//
//  AddReviewViewModel.swift
//  MovieApp
//
//  Created by Chris Hand on 9/20/22.
//

import Foundation
import CoreData

class AddReviewViewModel: ObservableObject {
    var title: String = ""
    var text: String = ""
    
    func addReviewForMovie(movieVM: MovieViewModel) {
        let movie = CoreDataManager.shared.getMovieById(id: movieVM.id)
        let review = Review(context: CoreDataManager.shared.viewContext)
        
        review.title = title
        review.text = text
        review.movie = movie
        
        CoreDataManager.shared.save()
        
    }
}
