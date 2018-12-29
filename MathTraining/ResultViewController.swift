//
//  ResultViewController.swift
//  MathTraining
//
//  Created by 舟木正憲 on 2018/12/29.
//  Copyright © 2018 masanori. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var result = 0.0

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = "\(round(result))%"
        if result < 50 {
            resultLabel.text = "PLEASE TRY AGAIN"
        } else if result < 80 {
            resultLabel.text = "NICE!"
        } else {
            resultLabel.text = "YOU ARE GREAT!"
        }
    }

}
