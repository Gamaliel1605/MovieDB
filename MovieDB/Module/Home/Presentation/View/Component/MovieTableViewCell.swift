//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 16/07/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleCategoryMovie: UILabel!
    @IBOutlet weak var colView: UICollectionView!
    
    static let ID = "MovieTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    private func setupView() {
        colView.delegate = self
        colView.dataSource = self
        colView.register(CardMovieCollectionViewCell.nib(), forCellWithReuseIdentifier: CardMovieCollectionViewCell.ID)
    }
    
}

extension MovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colView.dequeueReusableCell(withReuseIdentifier: CardMovieCollectionViewCell.ID, for: indexPath) as! CardMovieCollectionViewCell
        
        return cell
    }
    
}
