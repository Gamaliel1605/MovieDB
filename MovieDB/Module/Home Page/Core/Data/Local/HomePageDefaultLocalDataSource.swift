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
    func addMovieData(from movieListData: [MovieListEntity]) -> Observable<Bool>
    func getMovieData() -> Observable<[MovieListEntity]>
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
    
    func addMovieData(from movieListData: [MovieListEntity]) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    if !movieListData.isEmpty {
                        try realm.write({
                            for movie in movieListData {
                                realm.add(movie, update: .all)
                            }
                        })
                    }
                    observer.onNext(true)
                    observer.onCompleted()
                } catch let error {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
    
    func getMovieData() -> Observable<[MovieListEntity]> {
        return Observable<[MovieListEntity]>.create { observer in
            if let realm = self.realm {
                let movieData: Results<MovieListEntity> = {
                    realm.objects(MovieListEntity.self)
                }()
                observer.onNext(movieData.toArray(ofType: MovieListEntity.self))
                observer.onCompleted()
            } else {
                observer.onError(RealmError.readError)
            }
            return Disposables.create()
        }
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
