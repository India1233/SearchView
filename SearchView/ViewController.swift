//
//  ViewController.swift
//  SearchView
//
//  Created by Suresh Shiga on 25/11/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var filterArr = [Vehicle]()
    let searchcontroller = UISearchController(searchResultsController: nil)
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        addSearchBar()
    }


  private func  addSearchBar() {
    searchcontroller.searchResultsUpdater = self
    searchcontroller.dimsBackgroundDuringPresentation = false
    definesPresentationContext = true
    searchcontroller.searchBar.backgroundColor = .clear
    searchcontroller.searchBar.barTintColor = .white
    searchcontroller.searchBar.placeholder = "Search Friends"
    tableView.tableHeaderView = searchcontroller.searchBar
    }
    
    private func filterVehicle(for searchText: String) {
        filterArr = vehicleArr.filter({ (vehicle) -> Bool in
            return vehicle.name.lowercased().contains(searchText.lowercased())
        })
        self.tableView.reloadData()
    }
}


// MARK- TableView Extension

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchcontroller.isActive && searchcontroller.searchBar.text != "" {
            return filterArr.count
        }
        return vehicleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "FriendsListCell", bundle: nil), forCellReuseIdentifier: "FriendsListCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListCell", for: indexPath) as! FriendsListCell
        
        var vehicle:Vehicle
        
        if searchcontroller.isActive && searchcontroller.searchBar.text != "" {
            vehicle = filterArr[indexPath.row]
        } else {
            vehicle = vehicleArr[indexPath.row]
        }
        
        
        let title = vehicle.name
        let image = vehicle.image
        let checkMark = vehicle.checkmark
        
        cell.titleLabel.text = title
        cell.checkBoxImage.image = (checkMark == "Yes" ) ? UIImage(named: "CheckIcon")  :  UIImage(named: "UncheckIcon")
        cell.profileImage.image = UIImage(named: image)
        
        cell.checkBoxButton.tag = indexPath.row
        cell.checkBoxButton.addTarget(self, action: #selector(touchupInsideButton(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    // Adding Removing CheckBox
    @objc func touchupInsideButton(sender:UIButton) {
        let buttonpossition = sender.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: buttonpossition) {
            
            var checkMark = searchcontroller.isActive ? filterArr[indexPath .row].checkmark : vehicleArr[indexPath.row].checkmark
            
            if  checkMark ==  "Yes" {
               checkMark = "No"
            } else {
                checkMark = "Yes"
            }
            
            if searchcontroller.isActive {
                filterArr[indexPath.row].checkmark = checkMark
            } else {
                vehicleArr[indexPath.row].checkmark = checkMark
            }
            
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}


// MARK:- SearchViewController

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterVehicle(for: searchcontroller.searchBar.text ?? "")
    }
}
