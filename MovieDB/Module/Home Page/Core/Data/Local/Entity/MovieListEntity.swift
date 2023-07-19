//
//  MovieListEntity.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation
import RealmSwift

class MovieListEntity: Object {
    
    @Persisted(primaryKey: true) var id: Int
    @Persisted var releaseDate: String
    @Persisted var title: String
    @Persisted var image: String
    @Persisted var genreID = List<Int>()
}
