//
//  DetailMovie.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation

struct DetailMovieModel {
    
    var id: Int?
    var backgroundImage: String?
    var genres: [GenreModel] = []
    var productions: [ProductionCompaniesModel] = []
    var title: String?
    var descriptionMovie: String?
}
