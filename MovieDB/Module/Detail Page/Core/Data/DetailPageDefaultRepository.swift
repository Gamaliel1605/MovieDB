//
//  DetailPageDefaultRepository.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation
import RxSwift

protocol DetailPageRepository {
    func getMovieDetailData(movieID: Int) -> Observable<DetailMovieModel>
}

class DetailPageDefaultRepository {
    
    typealias instance = (DetailPageLocalDataSource, DetailPageRemoteDataSource) -> DetailPageRepository
    
    let local: DetailPageLocalDataSource
    let remote: DetailPageRemoteDataSource
    
    private init(local: DetailPageLocalDataSource, remote: DetailPageRemoteDataSource) {
        self.local = local
        self.remote = remote
    }
    
    static let sharedInstance: instance = { localDataSource, remoteDataSource in
        return DetailPageDefaultRepository(local: localDataSource, remote: remoteDataSource)
    }
}

extension DetailPageDefaultRepository: DetailPageRepository {
    
    func getMovieDetailData(movieID: Int) -> Observable<DetailMovieModel> {
        return self.remote.movieDetail(id: movieID)
            .map { movieDetailResponse in
                DetailMapper.mapMovieDetailResponseToEntity(movieResponse: movieDetailResponse)
            }
            .flatMap { movieEntity in
                self.local.setMovieDetailData(movieDetail: movieEntity)
            }
            .flatMap { _ in
                self.local.getMovieDetailData(movieID: movieID).map { entity in
                    DetailMapper.mapMovieDetailEntityToDomainModel(movieEntity: entity)
                }
            }
    }
    
}
