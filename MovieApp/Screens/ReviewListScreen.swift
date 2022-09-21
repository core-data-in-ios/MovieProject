//
//  ReviewListScreen.swift
//  MovieApp
//
//  Created by Chris Hand on 9/20/22.
//

import SwiftUI

struct ReviewListScreen: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            List(0...20, id:\.self) { index in
                HStack {
                    VStack {
                        Text("Review \(index)")
                    }
                    Spacer()
                    Text("Review Published Date")
                }
            }
        }
        .navigationTitle("Movie Title")
        .navigationBarItems(trailing: Button("Add New Review") {
            isPresented = true
        })
        .embedInNavigationView()
    }
}

struct ReviewListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReviewListScreen()
    }
}
