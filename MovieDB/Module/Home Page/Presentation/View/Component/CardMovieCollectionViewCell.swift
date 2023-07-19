//
//  CardMovieCollectionViewCell.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import UIKit
import AlamofireImage

class CardMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgCardMovie: UIImageView!
    @IBOutlet weak var lblTitleMovie: UILabel!
    
    static let ID = "CardMovieCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CardMovieCollectionViewCell", bundle: nil)
    }
    
    private func setupView() {
        imgCardMovie.layer.cornerRadius = 5
    }
    
    func setData(data: MovieListModel) {
        lblTitleMovie.text = data.title
        let url = "https://image.tmdb.org/t/p/w500"
        if let urlPath = URL(string: url.appending(data.image ?? "")) {
            DispatchQueue.main.async {
                self.imgCardMovie.af.setImage(withURL: urlPath)
            }
        }
    }

}
