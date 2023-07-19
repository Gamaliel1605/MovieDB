//
//  HomeMapper.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation

class HomeMapper {
    
    public static func mapMovieDataResponseToEntity(movieResponse: [MovieListDataResponse]) -> [MovieListEntity] {
        return movieResponse.map { movie in
            var entity = MovieListEntity()
            entity.id = movie.id
            entity.title = movie.title
            entity.releaseDate = movie.releaseDate
            entity.image = movie.image
            return entity
        }
    }
    
    public static func mapMovieDataEntityToDomainModel(movieEntity: [MovieListEntity]) -> [MovieListModel] {
        return movieEntity.map { movie in
            var model = MovieListModel()
            model.id = movie.id
            model.image = movie.image
            model.title = movie.title
            model.releaseDate = movie.releaseDate
            return model
        }
    }
}
