//
//  SimpleTableViewController.swift
//  20240523TableView
//
//  Created by 이찬호 on 5/23/24.
//

import UIKit

class SimpleTableViewController: UITableViewController {

    var list = ["iOS", "iPadOS", "watchOS", "기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //1. 셀의 갯수(필수)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    //2. 셀의 높이 iphone기본 값은 44
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //3. 셀의 디자인 및 데이터 처리(필수)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //3-1. 어떤 셀을 쓸 지 결정
        let cell = tableView.dequeueReusableCell(withIdentifier: "스토리보드싫다")!
        cell.imageView?.image = UIImage(systemName: "star.fill")
        cell.textLabel?.text = "청년취업사관학교"
        cell.textLabel?.textColor = .brown
        cell.textLabel?.font = .boldSystemFont(ofSize: 30)
        
        cell.detailTextLabel?.text = "ios앱개발"
        cell.detailTextLabel?.textColor = .lightGray
        cell.detailTextLabel?.font = .boldSystemFont(ofSize: 20)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "iOS"
            cell.textLabel?.textColor = .red
        }
        else if indexPath.row == 1 {
            cell.textLabel?.text = "iPadOS"
            cell.textLabel?.textColor = .green
        }
        else if indexPath.row == 2 {
            cell.textLabel?.text = "watchOS"
        }
        else {
            cell.textLabel?.text = "기타"
        }
                
        
        
        return cell
    }
}
