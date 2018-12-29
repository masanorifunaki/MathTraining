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

    // 次の画面の遷移時に実行される
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // resultVC は ResultViewController のサブクラス
        // 型を明記するため、as を使う
        // segue.destination は UIViewControllerの型を持っている
        if let resultVC = segue.destination as? ResultViewController {
            resultVC.result = Double(correct) / Double(total) * 100.0
        }
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
