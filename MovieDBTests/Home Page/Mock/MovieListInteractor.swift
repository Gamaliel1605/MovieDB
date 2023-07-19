//
//  MovieListInteractor.swift
//  MovieDBTests
//
//  Created by Carlos Gamaliel on 19/07/23.
//

import Foundation
import RxSwift
@testable import MovieDB

class MovieListEmptyDataMockInteractor: HomePageUseCase {
    func getDataMovie(category: CategoryMovie) -> Observable<[MovieListModel]> {
        return Observable.empty()
    }
}

class MovieListHasDataMockInteractor: HomePageUseCase {
    func getDataMovie(category: CategoryMovie) -> Observable<[MovieListModel]> {
        return Observable.just([MovieListModel()])
    }
}
