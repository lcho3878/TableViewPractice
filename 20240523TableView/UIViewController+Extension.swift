//
//  UIViewController+Extension.swift
//  20240523TableView
//
//  Created by 이찬호 on 5/27/24.
//
import UIKit

extension UIViewController {
    func setBackground() {
        view.backgroundColor = .lightGray
    }
    
    func showAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let open = UIAlertAction(title: "열기", style: .default)
        let delete = UIAlertAction(title: "삭제", style: .destructive)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        
        alert.addAction(delete)
        alert.addAction(cancel)
        alert.addAction(open)
        
        
        
        present(alert, animated: true)
    }
}

