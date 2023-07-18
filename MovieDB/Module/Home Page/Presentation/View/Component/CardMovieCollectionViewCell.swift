//
//  CardMovieCollectionViewCell.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import UIKit

class CardMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgCardMovie: UIImageView!
    @IBOutlet weak var lblTitleMovie: UILabel!
    
    static let ID = "CardMovieCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CardMovieCollectionViewCell", bundle: nil)
    }

}
