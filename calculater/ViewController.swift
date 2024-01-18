//
//  ViewController.swift
//  calculater
//
//  Created by Agit on 15.01.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calculatorWorking: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
    
    var working:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    func clearAll(){
        working = ""
        calculatorResult.text = ""
        calculatorWorking.text = ""
    }
    
    @IBAction func equalsTap(_ sender: Any) {
        if (validInput()){
            let checkedWorkingsForPercent = working.replacingOccurrences(of: "%", with: "*0.01")
            print(checkedWorkingsForPercent)
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResult.text = resultString
        }
        else{
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "okay", style: .default))
            self.present(alert, animated: true)
        }
    }
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in working{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        var previous: Int = -1
        for index in funcCharIndexes {
            if (index == 0)
            {
                return false
            }
            if(index == working.count - 1)
            {
                return false
            }
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    func specialCharacter (char: Character) -> Bool
    {
        if (char == "*"){
            return true
        }
        if (char == "/"){
            return true
        }
        if (char == "+"){
            return true
        }
        return false
    }
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)
        }
    }
   
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    @IBAction func backTap(_ sender: Any) {
        if(!working.isEmpty){
            working.removeLast()
            calculatorWorking.text = working
        }
    }
    func addWorkings(value:String){
        working += value
        calculatorWorking.text = working
    }
    
    @IBAction func percenTap(_ sender: Any) {
        addWorkings(value: "%")
    }
    @IBAction func divideTap(_ sender: Any) {
        addWorkings(value: "/")
    }
    @IBAction func timesTap(_ sender: Any) {
        addWorkings(value: "*")
    }
    @IBAction func minusTap(_ sender: Any) {
        addWorkings(value: "-")
    }
    @IBAction func plusTap(_ sender: Any) {
        addWorkings(value: "+")
    }
    @IBAction func decimalTap(_ sender: Any) {
        addWorkings(value: ".")
    }
    @IBAction func zeroTap(_ sender: Any) {
        addWorkings(value: "0")
    }
    @IBAction func oneTap(_ sender: Any) {
        addWorkings(value: "1")
    }
    @IBAction func twoTap(_ sender: Any) {
        addWorkings(value: "2")
    }
    @IBAction func treeTap(_ sender: Any) {
        addWorkings(value: "3")
    }
    @IBAction func fourTap(_ sender: Any) {
        addWorkings(value: "4")
    }
    @IBAction func fiveTap(_ sender: Any) {
        addWorkings(value: "5")
    }
    @IBAction func sixTap(_ sender: Any) {
        addWorkings(value: "6")
    }
    @IBAction func sevenTap(_ sender: Any) {
        addWorkings(value: "7")
    }
    @IBAction func eightTap(_ sender: Any) {
        addWorkings(value: "8")
    }
    @IBAction func nineTap(_ sender: Any) {
        addWorkings(value: "9")
    }
    

}

