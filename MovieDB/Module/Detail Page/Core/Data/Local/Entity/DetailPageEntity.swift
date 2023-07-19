//
//  DetailPageEntity.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation
import RealmSwift

class DetailPageEntity: Object {
    
    @Persisted(primaryKey: true) var id: Int
    @Persisted var backgroundImage: String
    @Persisted var genres: List<GenreEntity>
    @Persisted var productions: List<ProductionCompaniesEntity>
    @Persisted var title: String
    @Persisted var descriptionMovie: String
}

class GenreEntity: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
}

class ProductionCompaniesEntity: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var logo_path: String
    @Persisted var name: String
}
