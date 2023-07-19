//
//  HomePageRouter.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation
import UIKit

class HomePageRouter {
    
    static func createModule() -> HomePageViewController {
        let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
        let interactor = HomePageInjection.init().provideHomepageMovie()
        let presenter = HomePageDefaultPresenter(view: controller, interactor: interactor)
        
        controller.presenter = presenter
        
        return controller
    }
    
    func goToDetailPage(movieID: Int, controller: UIViewController) {
        let detailController = DetailPageRouter.createModule(movieID: movieID)
        controller.navigationController?.pushViewController(detailController, animated: true)
    }
    
}
