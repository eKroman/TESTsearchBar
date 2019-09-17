//
//  ViewController.swift
//  TESTsearchBar
//
//  Created by Edgar Kroman on 17/09/2019.
//  Copyright © 2019 Edgar Kroman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setUpNavigationBar()
    }

    func setUpNavigationBar() {
        let search = UISearchController(searchResultsController: nil)

        search.dimsBackgroundDuringPresentation = false
        search.searchResultsUpdater = self
        search.hidesNavigationBarDuringPresentation = false
        self.definesPresentationContext = true
        search.searchBar.isTranslucent = false
        
        self.navigationItem.searchController = search
        
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        print("Menu button pressed")
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.backgroundColor = UIColor.gray
        return cell
    }
    
    
}

extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        print(searchController.searchBar.text ?? "")
        
    }
}

