//
//  ViewController.swift
//  Statistics App
//
//  Created by Abhi Shukul on 9/20/19.
//  Copyright © 2019 Abhi Shukul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MenuTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func AddQData(_ sender: Any) {
        MenuTitle.text = "Q-data"
    }
    
    @IBAction func AddTwoWay(_ sender: Any) {
        MenuTitle.text = "Two-way"
    }
    
}

