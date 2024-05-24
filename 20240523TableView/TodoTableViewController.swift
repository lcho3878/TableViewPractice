//
//  TodoTableViewCell.swift
//  20240523TableView
//
//  Created by 이찬호 on 5/24/24.
//

import UIKit

class TodoTableViewController: UITableViewController {

    
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    var list: [String] = ["장보기", "영화보기", "과제하기", "잠자기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell")!
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        let content = addTextField.text!
        guard content.count > 1 else { return }
        addTextField.text = ""
        list.append(content)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
}
