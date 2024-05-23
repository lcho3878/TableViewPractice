//
//  SettingTableViewController.swift
//  20240523TableView
//
//  Created by 이찬호 on 5/23/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    let list = ["전체 설정", "개인 설정", "기타"]
    let data = ["전체 설정": ["공지사항", "실험실", "버전 정보"],
                "개인 설정": ["개인/보안", "알림", "채팅", "멀티프로필"],
                "기타": ["고객센터/도움말"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = data[list[section]] else {
            return 0
        }
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "basicType") else {
            return UITableViewCell()
        }
        let section = indexPath.section
        let index = indexPath.row
        let headerTitle = list[section]
        let content = data[headerTitle]?[index]
    
        cell.textLabel?.text = content
        
        
        return cell
    }
}
