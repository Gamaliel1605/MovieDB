//
//  HomePageDefaultRepository.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation
import RxSwift

protocol HomePageRepository {
    func getDataMovie(category: CategoryMovie) -> Observable<[MovieListModel]>
}

class HomePageDefaultRepository {
    
    typealias instance = (HomePageLocalDataSource, HomePageRemoteDataSource) -> HomePageDefaultRepository
    
    private var remote: HomePageRemoteDataSource
    private var local: HomePageLocalDataSource
    
    private init(remote: HomePageRemoteDataSource, local: HomePageLocalDataSource) {
        self.remote = remote
        self.local = local
    }
    
    static let sharedInstance: instance = { localRepo, remoteRepo in
        return HomePageDefaultRepository(remote: remoteRepo, local: localRepo)
    }
}

extension HomePageDefaultRepository: HomePageRepository {
    func getDataMovie(category: CategoryMovie) -> Observable<[MovieListModel]> {
        return self.remote.getDataMovie(category: category)
            .map({ response in
                HomeMapper.mapMovieDataResponseToEntity(movieResponse: response)
            })
            .flatMap { entities in
                self.local.addMovieData(from: entities)
            }
            .flatMap { _ in
                self.local.getMovieData()
                    .map { entities in
                        HomeMapper.mapMovieDataEntityToDomainModel(movieEntity: entities)
                    }
            }
    }
    
}

