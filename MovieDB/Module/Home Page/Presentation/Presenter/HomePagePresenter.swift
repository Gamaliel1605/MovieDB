//
//  HomePagePresenter.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation
import RxSwift
import UIKit

protocol HomePagePresenter {
    var movieNowPlaying: [MovieListModel] { get set }
    var numOfMovieNowPlaying: Int { get }
    
    func getMovieNowPlaying()
}

class HomePageDefaultPresenter: HomePagePresenter {
    
    private var view: HomePageViewController
    private var interactor: HomePageUseCase
    private var router = HomePageRouter()
    private var disposeBag = DisposeBag()
    
    var movieNowPlaying: [MovieListModel] = []
    var numOfMovieNowPlaying: Int {
        get {
            movieNowPlaying.count
        }
    }
    
    init(view: HomePageViewController, interactor: HomePageUseCase) {
        self.view = view
        self.interactor = interactor
    }
    
    func getMovieNowPlaying() {
        interactor.getDataMovie(category: .nowPlaying)
            .subscribe { [weak self] data in
                self?.movieNowPlaying = data
                DispatchQueue.main.async {
                    self?.view.tableView.reloadData()
                }
            } onError: { error in
                print("error fetch data \(error)")
            }.disposed(by: disposeBag)
    }
}
