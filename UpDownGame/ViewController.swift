//
//  ViewController.swift
//  UpDownGame
//
//  Created by sdt5 on 2015. 10. 20..
//  Copyright © 2015년 khe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //var count: Int = 0
    
    var randomNumber = Int(arc4random_uniform(10)+1)
    
    var currentCount = 0
    var maxCount = 10
    @IBAction func chooseGame(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            randomNumber = Int(arc4random_uniform(10)+1)
            maxCount = 5
        } else if sender.selectedSegmentIndex == 1 {
            randomNumber = Int(arc4random_uniform(50)+1)
            maxCount = 10
        } else { // == 2
            randomNumber = Int(arc4random_uniform(100)+1)
            maxCount = 15
        }
        print(randomNumber)
    }
    @IBOutlet weak var count: UILabel!
    
    
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var inputNumber: UITextField!

    
    @IBAction func enterNumber(sender: AnyObject) {
        let number = Int(inputNumber.text!) ?? 0

        if number == randomNumber {
            let dialog = UIAlertController(title: "성 공", message: "\(randomNumber), 정답입니다!", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "새로 시작", style: UIAlertActionStyle.Default) { (action) -> Void in print("OK 선택")
            }
            dialog.addAction(okAction)
            self.presentViewController(dialog, animated: true, completion: nil)
            currentCount = 0
        } else if number < randomNumber {
            if currentCount >= maxCount {
                let dialog = UIAlertController(title: "실 패", message: "정답은 \(randomNumber) 입니다!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "새로 시작", style: UIAlertActionStyle.Default) { (action) -> Void in print("OK 선택")
                }
                dialog.addAction(okAction)
                self.presentViewController(dialog, animated: true, completion: nil)
                msg.text = "숫자를 입력해 주십시오."
                currentCount = 0

            } else {
                msg.text = "UP!"
                currentCount++
            }
            count.text = "\(currentCount) / \(maxCount)"
        } else {
            if currentCount >= maxCount {
                let dialog = UIAlertController(title: "실 패", message: "정답은 \(randomNumber) 입니다!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "새로 시작", style: UIAlertActionStyle.Default) { (action) -> Void in print("OK 선택")
                }
                dialog.addAction(okAction)
                self.presentViewController(dialog, animated: true, completion: nil)
                msg.text = "숫자를 입력해 주십시오."
                currentCount = 0
            } else {
                msg.text = "DOWN!"
                currentCount++
            }
            count.text = "\(currentCount) / \(maxCount)"
        }
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

