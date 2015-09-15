//
//  ViewController.swift
//  SimonTest
//
//  Created by Jeff Shepherd on 9/1/15.
//  Copyright © 2015 Jeff Shepherd. All rights reserved.
//

import UIKit
//import Foundation

class ViewController: UIViewController {
    
    //************OUTLETS & ACTIONS
    @IBOutlet weak var CorrectBtn: UILabel! //not a button. need to relabel.
    @IBOutlet weak var sequenceLabel: UILabel!
    
    @IBAction func _SimonBtn(sender: AnyObject) {
        checkNumber(1)
    }
    
    @IBAction func two_SimonBtn(sender: AnyObject) {
        checkNumber(2)
    }
    
    @IBAction func three_SimonBtn(sender: AnyObject) {
        checkNumber(3)
    }
    
    @IBAction func four_SimonBtn(sender: AnyObject) {
        checkNumber(4)
    }
    
    /* ************MAIN SECTION************ */
    var randomNumbers = [Int]()
    var sequence = [Int]()
    var n = 0
    
    func initializeGame(){
        n = 0
        randomNumbers.removeAll()
        randomNumbers.append(Int(arc4random_uniform(4))+1)
        showSequence()
    }
    
    func checkNumber(num:Int){
        if num == randomNumbers[n]{
            n++
            if n == 6 {
                CorrectBtn.text = "You've won! Play again."
                initializeGame()
            } else if n == randomNumbers.count {
                CorrectBtn.text = "" //clear status message
                n = 0
                randomNumbers.append(Int(arc4random_uniform(4))+1)
                showSequence()
            }
        } else {
            CorrectBtn.text = "Wrong. Start Over."
            initializeGame()
        }
    }
    
    func showSequence(){
        var str = "Sequence --> "
        for numbers in randomNumbers{
            str = str + String(numbers) + " "
        }
        sequenceLabel.text = str
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeGame()
        
    }
    
    func testFunc(){
        print("The test worked")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

