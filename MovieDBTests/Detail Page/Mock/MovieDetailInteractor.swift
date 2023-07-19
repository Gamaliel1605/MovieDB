//
//  MovieDetailInteractor.swift
//  MovieDBTests
//
//  Created by Carlos Gamaliel on 19/07/23.
//

import Foundation
import RxSwift
@testable import MovieDB

class MovieDetailEmptMockInteractor: DetailPageUseCase {
    
    func getMovieDetail(movieID: Int) -> Observable<DetailMovieModel> {
        return Observable.empty()
    }
    
}

class MovieDetailHasDataMockInteractor: DetailPageUseCase {
    
    func getMovieDetail(movieID: Int) -> Observable<DetailMovieModel> {
        return Observable.just(DetailMovieModel())
    }
}
