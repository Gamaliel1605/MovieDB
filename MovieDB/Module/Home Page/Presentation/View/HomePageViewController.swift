//
//  HomePageViewController.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePagePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad()
    }
    
    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListCategoryMovieTableViewCell.nib(), forCellReuseIdentifier: ListCategoryMovieTableViewCell.ID)
    }

}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ListCategoryMovieTableViewCell.ID, for: indexPath) as! ListCategoryMovieTableViewCell
            cell.setData(title: "Now Playing", movie: presenter?.movieNowPlaying ?? [])
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ListCategoryMovieTableViewCell.ID, for: indexPath) as! ListCategoryMovieTableViewCell
            cell.setData(title: "Popular", movie: presenter?.moviePopular ?? [])
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ListCategoryMovieTableViewCell.ID, for: indexPath) as! ListCategoryMovieTableViewCell
            cell.setData(title: "Popular", movie: presenter?.movieTopRated ?? [])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ListCategoryMovieTableViewCell.ID, for: indexPath) as! ListCategoryMovieTableViewCell
            cell.setData(title: "Popular", movie: presenter?.movieUpcoming ?? [])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
