//
//  DetailPageUseCase.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation
import RxSwift

protocol DetailPageUseCase {
    func getMovieDetail(movieID: Int) -> Observable<DetailMovieModel>
}

class DetailPageDefaultProtocol: DetailPageUseCase {
    
    let repository: DetailPageRepository
    init(repository: DetailPageRepository) {
        self.repository = repository
    }
    
    func getMovieDetail(movieID: Int) -> Observable<DetailMovieModel> {
        return self.repository.getMovieDetailData(movieID: movieID)
    }
    
}
