//
//  DetailPageViewController.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import UIKit
import AlamofireImage

class DetailPageViewController: UIViewController {

    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var lblTitleMovie: UILabel!
    @IBOutlet weak var colViewGenre: UICollectionView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var colViewProduction: UICollectionView!
    
    var presenter: DetailPagePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad()
    }
    
    private func setupView() {
        colViewGenre.dataSource = self
        colViewGenre.delegate = self
        colViewGenre.register(GenreCollectionViewCell.nib(), forCellWithReuseIdentifier: GenreCollectionViewCell.ID)
        colViewProduction.dataSource = self
        colViewProduction.delegate = self
        colViewProduction.register(ProductionCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductionCollectionViewCell.ID)
    }
    
    func renderData() {
        guard let detail = presenter?.detailMovie else { return }
        lblTitleMovie.text = detail.title
        let url = "https://image.tmdb.org/t/p/w500"
        if let urlPath = URL(string: url.appending(detail.backgroundImage ?? "")) {
            DispatchQueue.main.async {
                self.imgDetail.af.setImage(withURL: urlPath)
            }
        }
        lblDescription.text = detail.descriptionMovie
    }

}

extension DetailPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.colViewGenre {
            return presenter?.numOfCategories ?? 0
        } else if collectionView == self.colViewProduction {
            return presenter?.numOfProduction ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.colViewGenre {
            let cell = colViewGenre.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.ID, for: indexPath) as! GenreCollectionViewCell
            guard let dataCategories = presenter?.detailMovie?.genres[indexPath.row] else {return UICollectionViewCell()}
            cell.setData(genre: dataCategories.name ?? "")
            return cell
        } else if collectionView == self.colViewProduction {
            let cell = colViewProduction.dequeueReusableCell(withReuseIdentifier: ProductionCollectionViewCell.ID, for: indexPath) as! ProductionCollectionViewCell
            guard let dataProduction = presenter?.detailMovie?.productions[indexPath.row] else {return UICollectionViewCell()}
            cell.setData(image: dataProduction.logo_path ?? "", name: dataProduction.name ?? "")
            return cell
        }
        return UICollectionViewCell()
    }
    
}

extension DetailPageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == colViewGenre {
            return CGSize(width: 100, height: 20)
        } else if collectionView == colViewProduction {
            return CGSize(width: 100, height: 100)
        }
        return CGSize(width: 0, height: 0)
    }
}
