//
//  GenreCollectionViewCell.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 19/07/23.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblGenre: UILabel!
    
    static let ID = "GenreCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "GenreCollectionViewCell", bundle: nil)
    }
    
    func setData(genre: String) {
        lblGenre.text = genre
    }
    
    override func prepareForReuse() {
        self.lblGenre.text = ""
    }

}
