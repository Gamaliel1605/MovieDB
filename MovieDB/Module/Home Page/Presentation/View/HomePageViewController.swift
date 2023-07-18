//
//  HomePageViewController.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 18/07/23.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListCategoryMovieTableViewCell.nib(), forCellReuseIdentifier: ListCategoryMovieTableViewCell.ID)
    }

}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCategoryMovieTableViewCell.ID, for: indexPath) as! ListCategoryMovieTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
