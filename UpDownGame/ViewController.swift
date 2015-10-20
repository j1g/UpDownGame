//
//  ViewController.swift
//  UpDownGame
//
//  Created by sdt5 on 2015. 10. 20..
//  Copyright © 2015년 khe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomNumber = Int(arc4random_uniform(10)+1)
    var currentCount = 0
    var maxCount = 5
    
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var inputNumber: UITextField!
    
    @IBAction func chooseGame(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            randomNumber = Int(arc4random_uniform(10)+1)
            currentCount = 0
            maxCount = 5
            count.text = "\(currentCount) / \(maxCount)"
        } else if sender.selectedSegmentIndex == 1 {
            randomNumber = Int(arc4random_uniform(50)+1)
            currentCount = 0
            maxCount = 8
            count.text = "\(currentCount) / \(maxCount)"
        } else { // == 2
            randomNumber = Int(arc4random_uniform(100)+1)
            currentCount = 0
            maxCount = 10
            count.text = "\(currentCount) / \(maxCount)"
        }
        print("입력한 숫자 ", terminator:"")
        print(randomNumber)
    }
    
    @IBAction func enterNumber(sender: AnyObject) {
        let number = Int(inputNumber.text!) ?? 0

        if number == randomNumber {
            let dialog = UIAlertController(title: "성 공", message: "\(randomNumber), 정답입니다!", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "새로 시작", style: UIAlertActionStyle.Default) { (action) -> Void in print("OK 선택")
            }
            dialog.addAction(okAction)
            self.presentViewController(dialog, animated: true, completion: nil)
            msg.text = "숫자를 입력해 주십시오."
            currentCount = 0
            count.text = "\(currentCount) / \(maxCount)"
        } else if number < randomNumber {
            if currentCount < maxCount {
                msg.text = "더 큰 숫자를 입력해주세요."
                currentCount++
            }
            else {
                let dialog = UIAlertController(title: "실 패", message: "정답은 \(randomNumber) 입니다!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "새로 시작", style: UIAlertActionStyle.Default) { (action) -> Void in print("OK 선택")
                }
                dialog.addAction(okAction)
                self.presentViewController(dialog, animated: true, completion: nil)
                msg.text = "숫자를 입력해 주십시오."
                currentCount = 0

            }
            count.text = "\(currentCount) / \(maxCount)"
        } else {
            if currentCount > maxCount {
                msg.text = "더 작은 숫자를 입력해주세요."
                currentCount++
            }
            else {
                let dialog = UIAlertController(title: "실 패", message: "정답은 \(randomNumber) 입니다!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "새로 시작", style: UIAlertActionStyle.Default) { (action) -> Void in print("OK 선택")
                }
                dialog.addAction(okAction)
                self.presentViewController(dialog, animated: true, completion: nil)
                msg.text = "숫자를 입력해 주십시오."
                currentCount = 0
            }
            count.text = "\(currentCount) / \(maxCount)"
        }
        inputNumber.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("시작 ", terminator:"")
        print(randomNumber)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

