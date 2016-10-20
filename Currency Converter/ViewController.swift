//
//  ViewController.swift
//  Currency Converter
//
//  Created by Daniel Baldwin on 7/30/16.
//  Copyright © 2016 Daniel Baldwin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var poundsLabel: UILabel!
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var yenLabel: UILabel!
    @IBOutlet weak var reaisLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var rates: ExchangeRates?

    // MARK: - Private Methods

    func fetchExchangeRates() {
        ExchangeRates.fetch({ (result, error) in
            if let exchangeRates = result {
                guard let inputText = self.textField.text else { return }
                guard let dollars = Double(inputText) else { return }
                self.populateLabels(exchangeRates, dollars:dollars)
            } else {
                // Handle error
            }
        })
    }
    
    func populateLabels(exchangeRates: ExchangeRates, dollars:Double) {
        
        guard let pounds = exchangeRates.pounds,
            euro = exchangeRates.euro,
            yen = exchangeRates.yen,
            reais = exchangeRates.reais else { return }
            poundsLabel.text = String(format:"%.2f", pounds * dollars)
            euroLabel.text = String(format:"%.2f", euro * dollars)
            yenLabel.text = String(format:"%.2f", yen * dollars)
            reaisLabel.text = String(format:"%.2f", reais * dollars)
    }
    
    // MARK: - Action Methods
    
    @IBAction func convertCurrencyTapped(sender: AnyObject) {
        if textField.text?.characters.count > 0 {
            fetchExchangeRates()
        } else {
            let alertController = UIAlertController.init(title: "No amount entered", message: "Please enter a dollar amount in the text field.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true) { }
        }
    }
    
    // MARK: UITextFieldDelegate Methods
    
    func textField(textFieldToChange: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // allow backspace
        if string.characters.count == 0 {
            return true
        }
        
        // allow numbers
        let characterSetAllowed = NSCharacterSet(charactersInString: "0123456789")
        if let _ = string.rangeOfCharacterFromSet(characterSetAllowed, options: .CaseInsensitiveSearch) {
            return true
        } else {
            return false
        }
    }
}

