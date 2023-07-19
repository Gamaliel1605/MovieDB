//
//  HomePageUseCase.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation
import RxSwift

protocol HomePageUseCase {
    func getDataMovie(category: CategoryMovie) -> Observable<[MovieListModel]>
}

class HomePageDefaultProtocol: HomePageUseCase {
    
    private let repository: HomePageRepository
    
    init(repository: HomePageRepository) {
        self.repository = repository
    }
    
    func getDataMovie(category: CategoryMovie) -> Observable<[MovieListModel]> {
        return repository.getDataMovie(category: category)
    }
}
