//
//  HomePageDefaultRepository.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomePageRepository {
    func getDataMovie(category: CategoryMovie) -> Observable<[MovieListModel]>
}

class HomePageDefaultRepository {
    
    typealias instance = (HomePageLocalDataSource, HomePageRemoteDataSource) -> HomePageDefaultRepository
    
    private var remote: HomePageRemoteDataSource
    private var local: HomePageLocalDataSource
    private var nowPlayingCache = BehaviorRelay<[MovieListModel]>(value: [])
    private var popularCache = BehaviorRelay<[MovieListModel]>(value: [])
    private var topRatedCache = BehaviorRelay<[MovieListModel]>(value: [])
    private var upcomingCache = BehaviorRelay<[MovieListModel]>(value: [])
    
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
        switch category {
        case .nowPlaying:
           if !nowPlayingCache.value.isEmpty {
               return nowPlayingCache.asObservable()
           }
        case .popular:
           if !popularCache.value.isEmpty {
               return popularCache.asObservable()
           }
        case .topRated:
           if !topRatedCache.value.isEmpty {
               return topRatedCache.asObservable()
           }
        case .upcoming:
           if !upcomingCache.value.isEmpty {
               return upcomingCache.asObservable()
           }
        }
        return self.remote.getDataMovie(category: category)
            .map { response in
                HomeMapper.mapMovieDataResponseToEntity(movieResponse: response)
            }
            .flatMap { entities in
                self.local.addMovieData(from: entities, category: category)
            }
            .flatMap { _ in
                self.local.getMovieData(category: category)
                    .map { entities in
                        let models = HomeMapper.mapMovieDataEntityToDomainModel(movieEntity: entities)
                        switch category {
                        case .nowPlaying:
                            self.nowPlayingCache.accept(models)
                        case .popular:
                            self.popularCache.accept(models)
                        case .topRated:
                            self.topRatedCache.accept(models)
                        case .upcoming:
                            self.upcomingCache.accept(models)
                        }
                        return models
                    }
            }
        
    }
    
}

