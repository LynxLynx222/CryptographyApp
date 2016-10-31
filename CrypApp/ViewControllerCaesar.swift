//
//  ViewControllerCaesar.swift
//  CrypApp
//
//  Created by Ondrej Andrysek on 06/10/2016.
//  Copyright © 2016 Ondrej Andrysek. All rights reserved.
//

import UIKit

class ViewControllerCaesar: UIViewController {
    @IBOutlet weak var TextToCipher: UILabel!
    @IBOutlet weak var textStepCounter: UILabel!
    @IBOutlet weak var textField: UITextField!

    var stepCounter : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tap to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //change text while typing, reset step counter
    @IBAction func textFieldChanged(sender: AnyObject) {
        TextToCipher.text = textField.text
        stepCounter = 0
        textStepCounter.text = String(stepCounter)
    }

    @IBAction func ButtonTappedBack(sender: AnyObject) {
        let text : String = TextToCipher.text!
        var textChanged : String = ""
        if text != ""{
            //for every letter in text
            for letter in (text.characters){
                //convert letter to ordinal value
                let ord = String(letter).unicodeScalars
                var number = ord[ord.startIndex].value
                
                //if the letter is B-Z or b-z, shift it one letter back
                if ((number >= 66 && number <= 90) || (number >= 98 && number <= 122)){
                    number -= 1
                }
                //if the letter is A, shift it to Z
                else if(number == 65){
                    number = 90
                }
                //if the letter is a, shift it to z
                else if(number == 97){
                    number = 122
                }
                //append character, letters are shiffted other characters are not
                textChanged.append(Character(UnicodeScalar(number)))
            }
        }
        //count how many steps are you shifting
        if (stepCounter != -25)
        {
            stepCounter -= 1
        }
        else{
            stepCounter = 0
        }
        TextToCipher.text = textChanged
        textStepCounter.text = String(stepCounter)
    }
    @IBAction func ButtonTappedForward(sender: AnyObject) {
        let text : String = TextToCipher.text!
        var textChanged : String = ""
        if text != ""{
            //for every letter in text
            for letter in (text.characters){
                //convert letter to ordinal value
                let ord = String(letter).unicodeScalars
                var number = ord[ord.startIndex].value
                
                //if the letter is A-Y or a-y, shift it one letter forward
                if ((number >= 65 && number <= 89) || (number >= 97 && number <= 121)){
                    number += 1
                }
                //if the letter is Z, shift it to A
                else if(number == 90){
                    number = 65
                }
                //if the letter is z, shift it to A
                else if(number == 122){
                    number = 97
                }
                //append character, letters are shiffted other characters are not
                textChanged.append(Character(UnicodeScalar(number)))
            }
        }
        //count how many steps are you shifting
        if (stepCounter != 25)
        {
            stepCounter += 1
        }
        else{
            stepCounter = 0
        }
        TextToCipher.text = textChanged
        textStepCounter.text = String(stepCounter)
    }


}
