//
//  HomePageDefaultLocalDataSource.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import Foundation
import RxSwift
import RealmSwift

enum RealmError: Error {
    case readError
}

protocol HomePageLocalDataSource {
    func addMovieData(from movieListData: [MovieListEntity], category: CategoryMovie) -> Observable<Bool>
    func getMovieData(category: CategoryMovie) -> Observable<[MovieListEntity]>
}

class HomePageDefaultLocalDataSource {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> HomePageLocalDataSource = { realmDatabase in
        return HomePageDefaultLocalDataSource(realm: realmDatabase)
    }
}

extension HomePageDefaultLocalDataSource: HomePageLocalDataSource {
    
    func addMovieData(from movieListData: [MovieListEntity], category: CategoryMovie) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            do {
                let realm = try self.getRealmInstance(for: category)
                if !movieListData.isEmpty {
                    try realm.write {
                        for movie in movieListData {
                            realm.add(movie, update: .all)
                        }
                    }
                }
                observer.onNext(true)
                observer.onCompleted()
            } catch let error {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }
    
    func getMovieData(category: CategoryMovie) -> Observable<[MovieListEntity]> {
        return Observable<[MovieListEntity]>.create { observer in
            do {
                let realm = try self.getRealmInstance(for: category)
                let movieData: Results<MovieListEntity> = realm.objects(MovieListEntity.self)
                observer.onNext(movieData.toArray(ofType: MovieListEntity.self))
                observer.onCompleted()
            } catch {
                observer.onError(RealmError.readError)
            }
            return Disposables.create()
        }
    }
    
    private func getRealmInstance(for category: CategoryMovie) throws -> Realm {
            var config = Realm.Configuration()
            let filename = "\(category).realm"
            config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent(filename)
            return try Realm(configuration: config)
        }
    
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
      var array = [T]()
      for index in 0 ..< count {
        if let result = self[index] as? T {
          array.append(result)
        }
      }
      return array
    }
    
}
