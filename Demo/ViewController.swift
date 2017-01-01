//
//  ViewController.swift
//  Demo
//
//  Created by Suguru Kishimoto on 9/25/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import UIKit
import Once

class ViewController: UIViewController {
    
    @IBOutlet private weak var button: UIButton!
    
    lazy var buttonFirstTap: OnceClosure = Once.execute {
        print("[First] tapped!!")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonDidTap() {
        buttonFirstTap?()
        print("tapped!!")
    }

}

