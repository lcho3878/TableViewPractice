//
//  ShoppingTableViewController.swift
//  20240523TableView
//
//  Created by 이찬호 on 5/23/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    private var shopiingList: [Shoping] = []
    
    @IBOutlet var sectionBackgroundView: UIView!
    @IBOutlet var sectionView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopiingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as? ShoppingTableViewCell else {
            return UITableViewCell()
        }
        let index = indexPath.row
        cell.checkButton.tag = index
        cell.starButton.tag = index
        
        let shopping = shopiingList[index]
        
        cell.contentLabel.text = shopping.content
        let starImage = shopping.isStar ? "star.fill" : "star"
        let checkImage = shopping.isCheck ? "checkmark.message.fill" : "checkmark.message"
        cell.starButton.setImage(UIImage(systemName: starImage), for: .normal)
        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
        cell.checkButton.setImage(UIImage(systemName: checkImage), for: .normal)
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    private func configureUI() {
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.label, for: .normal)
        addButton.backgroundColor = .systemGray
        addButton.layer.cornerRadius = 5
        
        searchTextField.placeholder = "무엇을 구매하실 건가요?"
        searchTextField.backgroundColor = .clear
        searchTextField.borderStyle = .none
        
        sectionBackgroundView.layer.cornerRadius = 20
        sectionBackgroundView.backgroundColor = .systemGray4
        
        
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        let content = searchTextField.text!
        let shopping = Shoping(content: content, isStar: false, isCheck: false)
        shopiingList.append(shopping)
        tableView.reloadData()
    }
    
    @objc func starButtonClicked(_ sender: UIButton) {
        let index = sender.tag
        shopiingList[index].isStar.toggle()
        tableView.reloadData()
    }
    
    @objc func checkButtonClicked(_ sender: UIButton) {
        let index = sender.tag
        shopiingList[index].isCheck.toggle()
        tableView.reloadData()
    }
    
    

}
