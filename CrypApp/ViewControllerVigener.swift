//
//  ViewControllerVigener.swift
//  CrypApp
//
//  Created by Ondrej Andrysek on 07/10/2016.
//  Copyright © 2016 Ondrej Andrysek. All rights reserved.
//

import UIKit

class ViewControllerVigener: UIViewController {
    @IBOutlet weak var textToEncrypt: UILabel!
    @IBOutlet weak var textFieldToEncrypt: UITextField!

    @IBOutlet weak var textFieldKey: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tap to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

extension ViewControllerVigener{
    
    @IBAction func buttonTappedEncrypt(sender: AnyObject) {
        
        shiftLetters(true)
        
    }
    @IBAction func buttonTappedDecrypt(sender: AnyObject) {
        
        shiftLetters(false)
        
    }
    
    //function to encrypt if in parameter is true, decrypt if in parameter is false
    func shiftLetters(encryption: Bool){
        let text = textFieldToEncrypt.text
        let key = textFieldKey.text
        
        //counter to count which letter of the key should be applied
        var counter = 0
        
        var encryptedText : String = ""
        for letter in (text?.characters)!{
            
            //convert text letter to ordinal value
            let ordTextLetter = String(letter).unicodeScalars
            var numberLetter = ordTextLetter[ordTextLetter.startIndex].value
            
            //convert key letter to ordinal value
            let ordKeyLetter = String(key![counter]).unicodeScalars
            let numberKey = ordKeyLetter[ordKeyLetter.startIndex].value
            
            //if the letter is between a and z, shift it by the ordinal number of the key
            if (numberLetter >= 97 && numberLetter <= 122){
                switch encryption{
                case true: numberLetter += numberKey - 97
                case false : numberLetter -= numberKey - 97
                }
                //if the letter is beyond z, start from a
                if(numberLetter > 122){
                    numberLetter -= 26
                }
                    //if the letter is beyond a, start from z
                else if(numberLetter < 97)
                {
                    numberLetter += 26
                }
                encryptedText.append(Character(UnicodeScalar(numberLetter)))
            }
                //if the letter is between a and z, shift it by the ordinal number of the key
            else if(numberLetter >= 65 && numberLetter <= 90){
                switch encryption{
                case true: numberLetter += numberKey - 65
                case false : numberLetter -= numberKey - 65
                }
                //if the letter is beyond Z, start from A
                if(numberLetter > 90){
                    numberLetter -= 26
                }
                    //if the letter is beyond Z, start from a
                else if(numberLetter < 65)
                {
                    numberLetter += 26
                }
                encryptedText.append(Character(UnicodeScalar(numberLetter)))
            }
            else{
                encryptedText.append(Character(UnicodeScalar(numberLetter)))
            }
            
            //increase the counter by 1, if the counter is higher than key length, reset it
            counter += 1
            if(counter == key?.characters.count){
                counter = 0
            }
            
        }
        textToEncrypt.text = encryptedText
    }
}

extension String{
    subscript (i:Int) -> Character{
        return self[self.startIndex.advancedBy(i)]
    }
}
