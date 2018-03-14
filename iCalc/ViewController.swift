//
//  ViewController.swift
//  iCalc
//
//  Created by SABARI on 14/03/18.
//  Copyright © 2018 com.ios.sabari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var operation = 0;

    @IBOutlet weak var display_textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clear_button(_ sender: UIButton) {
        display_textview.text = ""
    }
    
    @IBAction func calc_numbers(_ sender: Any) {
        
        if performingMath == true {
            display_textview.text = String((sender as AnyObject).tag-1)
            numberOnScreen = Double(display_textview.text!)!
            performingMath = false
        } else {
            display_textview.text = display_textview.text! + String((sender as AnyObject).tag-1)
            numberOnScreen = Double(display_textview.text!)!
        }
    }
    
    @IBAction func calc_operators(_ sender: Any) {
        
        if display_textview.text != "" && sender.tag !=11 && sender.tag != 16 {
            
            self.previousNumber = Double(self.self.display_textview.text!)!
            
            if (sender as AnyObject).tag == 12 { // Divide
                self.display_textview.text = "/";
            }
            
            if (sender as AnyObject).tag == 13 { // Multiply
                self.display_textview.text = "x";
            }
            
            if (sender as AnyObject).tag == 14 { // Subtract
                self.display_textview.text = "-";
            }
            
            if (sender as AnyObject).tag == 15 { // Add
                self.display_textview.text = "+";
            }
            
            self.operation = (sender as AnyObject).tag
            self.performingMath = true
        }
        
        else if sender.tag == 16 {
            
            if operation == 12 { // Divide
                display_textview.text = String(previousNumber / numberOnScreen)
            }
            
            else if operation == 13 { // Multiply
                display_textview.text = String(previousNumber * numberOnScreen)
            }
            
            else if operation == 14 { // Subtract
                display_textview.text = String(previousNumber - numberOnScreen)
            }
            
            else if operation == 15 { // Add
                display_textview.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11 {
            display_textview.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

