//
//  HomePageDefaultRemoteDataSource.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation
import Network
import RxSwift
import Alamofire

enum CategoryMovie {
    case nowPlaying
    case popular
    case topRated
    case upcoming
}

protocol HomePageRemoteDataSource {
    func getDataMovie(category: CategoryMovie) -> Observable<[MovieListDataResponse]>
}

class HomePageDefaultRemoteDataSource {
    
    static let shared: HomePageRemoteDataSource = HomePageDefaultRemoteDataSource()
    
    private let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OTU1YjAzZjBjMTg1NTBlOTc1YTYwNmU3NjU2ZDg5NCIsInN1YiI6IjYyMmUxMTgzOThmMWYxMDA3ODA1M2M3NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Il7s-gf6oZcy3OMRso3nldaILPLkFILf_HXz7RHhonQ"
    private let GET_MOVIE_LIST_NOW_PLAYING = "https://api.themoviedb.org/3/movie/now_playing"
}

extension HomePageDefaultRemoteDataSource: HomePageRemoteDataSource {
    
    func getDataMovie(category: CategoryMovie) -> Observable<[MovieListDataResponse]> {
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        switch category {
        case .nowPlaying:
            return Observable<[MovieListDataResponse]>.create { homeDataObserver in
                if let url = URL(string: self.GET_MOVIE_LIST_NOW_PLAYING) {
                    AF.request(url, headers: headers)
                        .validate()
                        .responseDecodable(of: MovieListResponse.self) { movieDataResponse in
                            switch movieDataResponse.result {
                            case .success(let movieResponse):
                                homeDataObserver.onNext(movieResponse.results)
                                homeDataObserver.onCompleted()
                                break
                            case .failure(let error):
                                homeDataObserver.onError(error)
                                break
                            }
                        }
                }
                return Disposables.create()
            }
        case .popular:
            break
        case .topRated:
            break
        case .upcoming:
            break
        }
        return Observable.just([])
    }
    
}
