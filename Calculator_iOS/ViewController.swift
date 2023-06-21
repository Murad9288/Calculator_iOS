//
//  ViewController.swift
//  Calculator_iOS
//
//  Created by Md Murad Hossain on 15/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlet Properties -
    @IBOutlet weak var calDisplayLabel: UITextField!
    @IBOutlet weak var calDisplayResultLabel: UITextField!
    
    // MARK: - Local Properties -

    var displayWord : String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAll()
    }
    
    // MARK: - Private Method -

    func clearAll() {
        displayWord = ""
        calDisplayLabel.text = "0"
        calDisplayResultLabel.text = ""
    }
    
    func validInput() ->Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in displayWord {
            if specialCharacter(char: char) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if index == 0 {
                return false
            }
            
            if(index == displayWord.count - 1) {
                return false
            }
            
            if previous != -1 {
                if(index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool {
        if char == "*" {
            return true
        }
        if char == "/" {
            return true
        }
        if char == "+" {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func equalAction(_ sender: UIButton) {
        if validInput() {
            let checkedWorkingsForPercent = displayWord.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calDisplayResultLabel.text = "= \(resultString)"
        } else {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func disPlayButtonAdd(value: String) {
        displayWord = displayWord + value
        calDisplayLabel.text = displayWord
    }
   
    
    // MARK: - All Action Method -

    @IBAction func allClearAction(_ sender: UIButton) {
        clearAll()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        if !displayWord.isEmpty {
            displayWord.removeLast()
            calDisplayLabel.text = displayWord
        }
    }
    
    @IBAction func percentAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "%")
    }
    
    @IBAction func divideAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "/")

    }
    
    @IBAction func multipleAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "*")

    }
    
    @IBAction func minusAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "-")

    }
    
    @IBAction func plusActionButton(_ sender: UIButton) {
        disPlayButtonAdd(value: "+")

    }
    
    @IBAction func dotAction(_ sender: UIButton) {
        disPlayButtonAdd(value: ".")

    }
    
    @IBAction func zeroAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "0")

    }
    
    @IBAction func threeAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "3")

    }
    
    @IBAction func twoAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "2")

    }
    
    @IBAction func oneAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "1")

    }
    
    @IBAction func fourAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "4")

    }
    
    @IBAction func fiveAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "5")

    }
    
    @IBAction func sixAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "6")

    }
    
    @IBAction func sevenAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "7")

    }
    
    @IBAction func eightAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "8")

    }
    
    @IBAction func nineAction(_ sender: UIButton) {
        disPlayButtonAdd(value: "9")

    }
}
