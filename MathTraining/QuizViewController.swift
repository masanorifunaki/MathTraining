//
//  QuizViewController.swift
//  MathTraining
//
//  Created by 舟木正憲 on 2018/12/29.
//  Copyright © 2018 masanori. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    let total = 10 // 問題数
    var correct = 0 // 正解数
    var questionIndex = 0 // 問題の番号
    var answerIndex = 0 // 正解の番号

    @IBOutlet var leftNumberLabel: UILabel!
    @IBOutlet var centerNumberLabel: UILabel!
    @IBOutlet var rightNumberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setQuestion()
    }

    @IBAction func tapped(sender: UIButton) {
        if sender.tag - 1 == answerIndex {
            correct += 1
        }

        questionIndex += 1
        if questionIndex >= total {
            performSegue(withIdentifier: "QuizToResult", sender: nil)
        } else {
            setQuestion()
        }
    }

    func setQuestion() {
        let leftNum = Int(arc4random_uniform(10))
        var centerNum = Int(arc4random_uniform(10))

        answerIndex = Int(arc4random_uniform(4))

        switch answerIndex {
        case 0:
            rightNumberLabel.text = "\(leftNum + centerNum)"
        case 1:
            rightNumberLabel.text = "\(leftNum - centerNum)"
        case 2:
            rightNumberLabel.text = "\(leftNum * centerNum)"
        default:
            if centerNum == 0 {
                centerNum = 1
            }
             rightNumberLabel.text = "\(leftNum / centerNum)"
        }

        leftNumberLabel.text = "\(leftNum)"
        centerNumberLabel.text = "\(centerNum)"
    }
}
