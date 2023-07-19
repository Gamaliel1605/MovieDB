//
//  ListCategoryMovieTableViewCell.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import UIKit

protocol ListCategoryMovieTableViewCellDelegate {
    func onDidSelectItem(ID: Int)
}

class ListCategoryMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitleCategoryMovie: UILabel!
    @IBOutlet weak var colView: UICollectionView!
    
    static let ID = "ListCategoryMovieTableViewCell"
    private var movieList: [MovieListModel] = []
    var delegate: ListCategoryMovieTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ListCategoryMovieTableViewCell", bundle: nil)
    }
    
    private func setupView() {
        colView.delegate = self
        colView.dataSource = self
        colView.register(CardMovieCollectionViewCell.nib(), forCellWithReuseIdentifier: CardMovieCollectionViewCell.ID)
    }
    
    func setData(title: String, movie: [MovieListModel], delegate: ListCategoryMovieTableViewCellDelegate) {
        lblTitleCategoryMovie.text = title
        self.movieList = movie
        self.delegate = delegate
    }
    
    override func prepareForReuse() {
        DispatchQueue.main.async {
            self.colView.reloadData()
        }
    }
    
}

extension ListCategoryMovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colView.dequeueReusableCell(withReuseIdentifier: CardMovieCollectionViewCell.ID, for: indexPath) as! CardMovieCollectionViewCell
        cell.setData(data: movieList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.onDidSelectItem(ID: movieList[indexPath.row].id ?? 0)
    }
    
}
