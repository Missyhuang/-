//
//  ViewController.swift
//  numberCalculated
//
//  Created by Missy on 2018/5/6.
//  Copyright © 2018年 Missy. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController,UITextFieldDelegate {

    func textFieldShouldReturn(_ textField:UITextField)->Bool{
        textField.resignFirstResponder()
        return true
    }
    @IBOutlet weak var firstNumTextField: UITextField!
    @IBOutlet weak var secondNumTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBAction func calculatedSeg(_ sender: UISegmentedControl) {
        let number1:Double
        var number2:Double
        var total:Double
        number1 = Double(firstNumTextField.text!)!
        number2 = Double(secondNumTextField.text!)!
        if sender.selectedSegmentIndex == 0 {
            total = number1 + number2
        }
        else if sender.selectedSegmentIndex == 1 {
            //number1 = Double(firstNumTextField.text!)!
            //number2 = Double(secondNumTextField.text!)!
            total = number1 - number2
            //totalLabel.text = total.description
            
        }
        else if sender.selectedSegmentIndex == 2 {
            total = number1 * number2
        }
        else {
            total = number1 / number2
            //total = round(total * 100)/100//小數點第三位四捨五入
            total = floor(total * 100)/100//小數點第三位無條件捨去
            //total = ceil(total * 100)/100//小數點第三位無條件進位
        }
        totalLabel.text = total.description
        let speech = AVSpeechUtterance(string: totalLabel.text!)
        speech.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        let  synthesizer  =  AVSpeechSynthesizer()
        synthesizer.speak(speech)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

