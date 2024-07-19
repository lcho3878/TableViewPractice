//
//  FoodViewController.swift
//  20240523TableView
//
//  Created by 이찬호 on 5/27/24.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    private let list = RestaurantList().restaurantArray
    private var filteredList: [Restaurant] = []

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var foodTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let left = UIBarButtonItem(title: "한식만", style: .plain, target: self, action: #selector(leftBarButtonClicked))
        let all = UIBarButtonItem(title: "전체보기", style: .plain, target: self, action: #selector(allBarButtonClicked))

        navigationItem.leftBarButtonItems = [all, left]
        
        filteredList = list
        
        foodTableView.rowHeight = 120
        foodTableView.delegate = self
        foodTableView.dataSource = self
        foodTableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodTableViewCell")
        
//        searchBar.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as! FoodTableViewCell
        
        let data = filteredList[indexPath.row]
        cell.configureCell(data)

        return cell
    }
    
    @objc func leftBarButtonClicked() {
//        var kFood = [Restaurant]()
//        for item in list {
//            if item.category == "한식"{
//                kFood.append(item)
//            }
//        }
        filteredList = list.filter { $0.category == "한식"}
        foodTableView.reloadData()
    }
    
    @objc func allBarButtonClicked() {
        filteredList = list
        foodTableView.reloadData()
        showAlert()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let keyword = searchBar.text!
        guard keyword != "" else {
            filteredList = list
            foodTableView.reloadData()
            return
        }
        filteredList = list.filter{ $0.name.contains(keyword) || $0.category.contains(keyword)}
        foodTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText != "" else {
            filteredList = list
            foodTableView.reloadData()
            return
        }
        filteredList = list.filter{ $0.name.contains(searchText) || $0.category.contains(searchText) }
        foodTableView.reloadData()
    }

}
