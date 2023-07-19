//
//  MovieListTests.swift
//  MovieDBTests
//
//  Created by Carlos Gamaliel on 19/07/23.
//

import XCTest
@testable import MovieDB

final class MovieListTests: XCTestCase {

    func testMovieListNowPlayingEmpty() throws {
        let interactor = MovieListEmptyDataMockInteractor()
        let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
        let presenter = HomePageDefaultPresenter(view: controller, interactor: interactor)
        
        controller.loadView()
        presenter.getMovieNowPlaying()
        
        XCTAssertEqual(presenter.movieNowPlaying.count, 0)
    }
    
    func testMovieListNowPlayingHasData() throws {
        let interactor = MovieListHasDataMockInteractor()
        let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
        let presenter = HomePageDefaultPresenter(view: controller, interactor: interactor)
        
        controller.loadView()
        presenter.getMovieNowPlaying()
        
        XCTAssertNotEqual(presenter.movieNowPlaying.count, 0)
    }
    
    func testMovieListTopRatedEmpty() throws {
        let interactor = MovieListEmptyDataMockInteractor()
        let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
        let presenter = HomePageDefaultPresenter(view: controller, interactor: interactor)
        
        controller.loadView()
        presenter.getMovieTopRated()
        
        XCTAssertEqual(presenter.movieTopRated.count, 0)
    }
    
    func testMovieListTopRatedHasData() throws {
        let interactor = MovieListHasDataMockInteractor()
        let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
        let presenter = HomePageDefaultPresenter(view: controller, interactor: interactor)
        
        controller.loadView()
        presenter.getMovieTopRated()
        
        XCTAssertNotEqual(presenter.movieTopRated.count, 0)
    }
    
    func testMovieListPopularEmpty() throws {
        let interactor = MovieListEmptyDataMockInteractor()
        let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
        let presenter = HomePageDefaultPresenter(view: controller, interactor: interactor)
        
        controller.loadView()
        presenter.getMoviePopular()
        
        XCTAssertEqual(presenter.moviePopular.count, 0)
    }
    
    func testMovieListPopularHasData() throws {
        let interactor = MovieListHasDataMockInteractor()
        let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
        let presenter = HomePageDefaultPresenter(view: controller, interactor: interactor)
        
        controller.loadView()
        presenter.getMoviePopular()
        
        XCTAssertNotEqual(presenter.moviePopular.count, 0)
    }
    
    func testMovieListUpcomingEmpty() throws {
        let interactor = MovieListEmptyDataMockInteractor()
        let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
        let presenter = HomePageDefaultPresenter(view: controller, interactor: interactor)
        
        controller.loadView()
        presenter.getMovieUpcoming()
        
        XCTAssertEqual(presenter.movieUpcoming.count, 0)
    }
    
    func testMovieListUpcomingHasData() throws {
        let interactor = MovieListHasDataMockInteractor()
        let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
        let presenter = HomePageDefaultPresenter(view: controller, interactor: interactor)
        
        controller.loadView()
        presenter.getMovieUpcoming()
        
        XCTAssertNotEqual(presenter.movieUpcoming.count, 0)
    }

}
