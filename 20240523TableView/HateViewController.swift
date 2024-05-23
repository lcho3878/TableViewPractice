//
//  HateViewController.swift
//  20240523TableView
//
//  Created by 이찬호 on 5/23/24.
//

import UIKit

class HateViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hate \(#function)")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Hate \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Hate \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Hate \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Hate \(#function)")
    }
    
    
    @IBAction func hateButtonClicked(_ sender: UIButton) {
        let before = UserDefaults.standard.integer(forKey: "hate")
        let after = before + 1
        UserDefaults.standard.set(after, forKey: "hate")
    }


}
