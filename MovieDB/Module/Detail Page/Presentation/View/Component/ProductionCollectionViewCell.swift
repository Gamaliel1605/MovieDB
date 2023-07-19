//
//  ProductionCollectionViewCell.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 19/07/23.
//

import UIKit
import AlamofireImage

class ProductionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgProduction: UIImageView!
    @IBOutlet weak var lblNameProduction: UILabel!
    
    static let ID = "ProductionCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ProductionCollectionViewCell", bundle: nil)
    }
    
    func setData(image: String, name: String) {
        let url = "https://image.tmdb.org/t/p/w500"
        if let urlPath = URL(string: url.appending(image)) {
            DispatchQueue.main.async {
                self.imgProduction.af.setImage(withURL: urlPath)
            }
        }
        lblNameProduction.text = name
    }
    
    override func prepareForReuse() {
        self.imgProduction.image = nil
        self.lblNameProduction.text = ""
    }

}
