//
//  ViewController.swift
//  mathApp
//
//  Created by 曾曜澤 on 2022/6/8.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var firstView: UIView!
    @IBOutlet weak var questionNumLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var num1Label: UILabel!
    @IBOutlet weak var num2Label: UILabel!
    @IBOutlet var ChooseButton: [UIButton]!
    @IBOutlet var endView: UIView!
    @IBOutlet weak var resultPic: UIImageView!
    @IBOutlet weak var yourScoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    //設定變數
    var num1 = Int.random(in: 1...100)
    var num2 = Int.random(in: 1...100)
    var doubleNum = 0
    var symbolsArray = ["➕", "➖", "✖️", "➗"]
    var options:[Int] = []
    var option1 = 0
    var option2 = 1
    var answer = 0
    var index = 1
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstView.isHidden = false
        endView.isHidden = true
        randomQuestion()
    }
    
    func randomQuestion() {
        symbolsArray.shuffle()
        option1 = Int.random(in: 1...300)
        option2 = Int.random(in: 1...300)
        options = [option1,option2]
        
        if symbolsArray[0] == "➕" {
            symbolLabel.text = symbolsArray[0]
            num1 = Int.random(in: 1...199)
            num2 = Int.random(in: 1...99)
            answer = num1 + num2
        } else if symbolsArray[1] == "➖" {
            symbolLabel.text = symbolsArray[1]
            num1 = Int.random(in: 150...499)
            num2 = Int.random(in: 19...149)
            answer = num1 - num2
        } else if symbolsArray[2] == "✖️" {
            symbolLabel.text = symbolsArray[2]
            num1 = Int.random(in: 1...20)
            num2 = Int.random(in: 1...25)
            answer = num1 * num2
        } else if symbolsArray[3] == "➗" {
            symbolLabel.text = symbolsArray[3]
            num2 = Int.random(in: 1...17)
            doubleNum = Int.random(in: 1...12)
            num1 = num2 * doubleNum
            answer = num1 / num2
        }
        options.append(answer)
        options.shuffle()
        for i in 0...2 {
            ChooseButton[i].setTitle(String(options[i]), for: UIControl.State.normal)
        }
        num1Label.text = "\(num1)"
        num2Label.text = "\(num2)"
    }
    @IBAction func selectAnswer(_ sender: UIButton) {
        index += 1
        questionNumLabel.text = "\(index)/10"
        
        if sender.currentTitle == String(answer){
            score = score + 10
            randomQuestion()
        } else {
            score += 0
            randomQuestion()
        }
        if index == 11 {
            index = 10
            endView.isHidden = false
            yourScoreLabel.text = "Your Score: \(score)"
            if score == 0 {
                resultLabel.text = "Too bad..."
                resultPic.image = UIImage(named: "0")
            } else if score <= 15 {
                resultLabel.text = "Uh..."
                resultPic.image = UIImage(named: "10")
            } else if score <= 30 {
                resultLabel.text = "Mmmh..."
                resultPic.image = UIImage(named: "20")
            } else if score <= 45 {
                resultLabel.text = "Work harder!!"
                resultPic.image = UIImage(named: "40")
            } else if score <= 55 {
                resultLabel.text = "Not bad~"
                resultPic.image = UIImage(named: "50")
            } else if score <= 75 {
                resultLabel.text = "Good!"
                resultPic.image = UIImage(named: "60")
            } else if score <= 95 {
                resultLabel.text = "Great!!"
                resultPic.image = UIImage(named: "80")
            } else {
                resultLabel.text = "Perfect Awesome!"
                resultPic.image = UIImage(named: "100")
            }
        }
        randomQuestion()
        scoreLabel.text = "\(score)"
    }
    @IBAction func start(_ sender: Any) {
        firstView.isHidden = true
        randomQuestion()
    }
    @IBAction func again(_ sender: Any) {
        endView.isHidden = true
        index = 1
        score = 0
        randomQuestion()
        questionNumLabel.text = "\(index)/10"
        scoreLabel.text = "\(score)"
    }
    
}

