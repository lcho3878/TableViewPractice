//
//  SearchTableViewController.swift
//  20240523TableView
//
//  Created by 이찬호 on 5/24/24.
//

import UIKit

struct Travel{
    let country: String
    let money: Int
    var like: Bool
}

class SearchTableViewController: UITableViewController {

    var list = [Travel(country: "프랑스", money: 100300500, like: false),
                Travel(country: "일본", money: 123123, like: false),
                Travel(country: "영국", money: 12341234, like: true),
                Travel(country: "네덜란드", money: 141414, like: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        let travel = list[indexPath.row]
        cell.titleLabel.text = travel.country
        cell.titleLabel.font = .boldSystemFont(ofSize: 30)
        
        cell.subtitleLabel.text = travel.money.formatted()
        cell.subtitleLabel.font = .systemFont(ofSize: 14)
        cell.subtitleLabel.textColor = .darkGray
        
        let imagename = travel.like ? "heart" : "heart.fill"
        cell.likeButton.setImage(UIImage(systemName: imagename), for: .normal)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        cell.posterImageView.layer.cornerRadius = 10
        cell.posterImageView.backgroundColor = .lightGray
     
        return cell
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        let i = sender.tag
        list[i].like.toggle()
//        tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: i, section: 0)], with: .automatic)
    }

    

}
