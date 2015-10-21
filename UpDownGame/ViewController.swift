//
//  ViewController.swift
//  UpDownGame
//
//  Created by Jaehwan Ji on 2015. 10. 20..
//  Copyright © 2015년 Jaehwan Ji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressCount: UIProgressView!
    @IBOutlet weak var progressTimer: UIProgressView!
    @IBOutlet weak var labelTimer: UILabel!
    
    //var countDownDuration: NSTimeInterval?
    var countNum = 10;
    var timer: NSTimer!

    var randomNumber = Int(arc4random_uniform(10)+1)
    var currentCount = 0
    var maxCount = 5
    
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var inputNumber: UITextField!
    
    func start() {
        
    }
    
    func countDown() {
        
    }
    
    func update() {
        labelTimer.text = String(countNum);
        countNum--;
        
        if countNum <= 0 {
            currentCount++
            if currentCount >= maxCount {
                let dialog = UIAlertController(title: "실 패", message: "정답은 \(randomNumber) 입니다!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "새로 시작", style: UIAlertActionStyle.Default) { (action) -> Void in print("OK 선택")
                self.randomNumber = Int(arc4random_uniform(10)+1)
                }
                dialog.addAction(okAction)
                self.presentViewController(dialog, animated: true, completion: nil)
                msg.text = "숫자를 입력해 주십시오."
                currentCount = 0

            }

            countNum = 10
            count.text = "\(currentCount) / \(maxCount)"

            //timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true);
        }
    }

    
    @IBAction func chooseGame(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            randomNumber = Int(arc4random_uniform(10)+1)
            maxCount = 5
        } else if sender.selectedSegmentIndex == 1 {
            randomNumber = Int(arc4random_uniform(50)+1)
            maxCount = 8
        } else { // == 2
            randomNumber = Int(arc4random_uniform(100)+1)
            maxCount = 10
        }
        currentCount = 0
        count.text = "\(currentCount) / \(maxCount)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true);

        print("입력한 숫자 ", terminator:"")
        print(randomNumber)
    }
    
    @IBAction func enterNumber(sender: AnyObject) {

        
        let number = Int(inputNumber.text!) ?? 0

        if number == randomNumber {
            let dialog = UIAlertController(title: "성 공", message: "\(randomNumber), 정답입니다!", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "새로 시작", style: UIAlertActionStyle.Default) { (action) -> Void in print("OK 선택")
            self.randomNumber = Int(arc4random_uniform(10)+1)
            }
            dialog.addAction(okAction)
            self.presentViewController(dialog, animated: true, completion: nil)
            msg.text = "숫자를 입력해 주십시오."
            currentCount = 0
            
        } else if number < randomNumber {
            currentCount++
            if currentCount < maxCount {
                msg.text = "더 큰 숫자를 입력해주세요."
            }
            else {
                let dialog = UIAlertController(title: "실 패", message: "정답은 \(randomNumber) 입니다!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "새로 시작", style: UIAlertActionStyle.Default) { (action) -> Void in print("OK 선택")
                self.randomNumber = Int(arc4random_uniform(10)+1)
                }
                dialog.addAction(okAction)
                self.presentViewController(dialog, animated: true, completion: nil)
                msg.text = "숫자를 입력해 주십시오."
                currentCount = 0
            }
            
        } else {
            currentCount++
            if currentCount > maxCount {
                msg.text = "더 작은 숫자를 입력해주세요."
            }
            else {
                let dialog = UIAlertController(title: "실 패", message: "정답은 \(randomNumber) 입니다!", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "새로 시작", style: UIAlertActionStyle.Default) { (action) -> Void in print("OK 선택")
                self.randomNumber = Int(arc4random_uniform(10)+1)
                }
                dialog.addAction(okAction)
                self.presentViewController(dialog, animated: true, completion: nil)
                msg.text = "숫자를 입력해 주십시오."
                currentCount = 0
            }
        }
        count.text = "\(currentCount) / \(maxCount)"
        inputNumber.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("시작 ", terminator:"")
        print(randomNumber)

        // 타이머 생성
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

