//
//  HomePageInjection.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation
import RealmSwift

final class HomePageInjection {
    
    private func provideHomepageRepository() -> HomePageRepository {
        let realm = try! Realm()
        
        let local = HomePageDefaultLocalDataSource.sharedInstance(realm)
        let remote = HomePageDefaultRemoteDataSource.shared
        
        return HomePageDefaultRepository.sharedInstance(local as! HomePageLocalDataSource , remote as! HomePageRemoteDataSource )
    }
    
    func provideHomepageMovie() -> HomePageUseCase {
        let repository = provideHomepageRepository()
        return HomePageDefaultProtocol(repository: repository)
    }
}

