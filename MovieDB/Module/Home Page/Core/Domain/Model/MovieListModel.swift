//
//  MovieListModel.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation

struct MovieListModel {
    
    var id: Int?
    var releaseDate: String?
    var title: String?
    var image: String?
    var genreID: [GenreID] = []
    
}

struct GenreID {
    var id: Int?
}
