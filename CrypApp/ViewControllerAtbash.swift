//
//  ViewControllerAtbash.swift
//  CrypApp
//
//  Created by Ondrej Andrysek on 06/10/2016.
//  Copyright © 2016 Ondrej Andrysek. All rights reserved.
//

import UIKit

class ViewControllerAtbash: UIViewController {
    
    @IBOutlet weak var textToEncrypt: UILabel!
    @IBOutlet weak var textFieldToChange: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tap to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func ButtonTapped(sender: AnyObject) {
        let text = textFieldToChange.text
        var encryptedText : String = ""
        
        for letter in (text?.characters)!{
            
            //convert letter to ordinal value
            let ord = String(letter).unicodeScalars
            var number = ord[ord.startIndex].value
    
            //if the letter is between a and z, turn it into opposite letter, then append it
            if (number >= 97 && number <= 122){
                number = 219 - number
                encryptedText.append(Character(UnicodeScalar(number)))
            }
                //if the letter is between A and Z, turn it into opposite letter, then append it
            else if(number >= 65 && number <= 90){
                number = 155 - number
                encryptedText.append(Character(UnicodeScalar(number)))
            }
            else{
                encryptedText.append(Character(UnicodeScalar(number)))
            }
            
        }
        textToEncrypt.text = encryptedText
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
