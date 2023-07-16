//
//  CardMovieCollectionViewCell.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 16/07/23.
//

import UIKit

class CardMovieCollectionViewCell: UICollectionViewCell {
    
    static let ID = "CardMovieCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CardMovieCollectionViewCell", bundle: nil)
    }

}
