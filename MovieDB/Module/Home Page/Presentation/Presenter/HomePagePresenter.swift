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
    var moviePopular: [MovieListModel] { get set }
    var numOfMoviePopular: Int { get }
    var movieTopRated: [MovieListModel] { get set }
    var numOfMovieTopRated: Int { get }
    var movieUpcoming: [MovieListModel] { get set }
    var numOfMovieUpcoming: Int { get }
    
    func getMovieNowPlaying()
    func getMoviePopular()
    func getMovieTopRated()
    func getMovieUpcoming()
    
    func viewDidLoad()
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
    
    var moviePopular: [MovieListModel] = []
    var numOfMoviePopular: Int {
        get {
            moviePopular.count
        }
    }
    
    var movieTopRated: [MovieListModel] = []
    var numOfMovieTopRated: Int {
        get {
            movieTopRated.count
        }
    }
    
    var movieUpcoming: [MovieListModel] = []
    var numOfMovieUpcoming: Int {
        get {
            movieUpcoming.count
        }
    }
    
    init(view: HomePageViewController, interactor: HomePageUseCase) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        getMovieNowPlaying()
        getMoviePopular()
        getMovieTopRated()
        getMovieUpcoming()
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
    
    func getMoviePopular() {
        interactor.getDataMovie(category: .popular)
            .subscribe { [weak self] data in
                self?.moviePopular = data
                DispatchQueue.main.async {
                    self?.view.tableView.reloadData()
                }
            } onError: { error in
                print("error fetch data \(error)")
            }.disposed(by: disposeBag)
    }
    
    func getMovieTopRated() {
        interactor.getDataMovie(category: .topRated)
            .subscribe { [weak self] data in
                self?.movieTopRated = data
                DispatchQueue.main.async {
                    self?.view.tableView.reloadData()
                }
            } onError: { error in
                print("error fetch data \(error)")
            }.disposed(by: disposeBag)
    }
    
    func getMovieUpcoming() {
        interactor.getDataMovie(category: .upcoming)
            .subscribe { [weak self] data in
                self?.movieUpcoming = data
                DispatchQueue.main.async {
                    self?.view.tableView.reloadData()
                }
            } onError: { error in
                print("error fetch data \(error)")
            }.disposed(by: disposeBag)
    }
}
