//
//  ViewController.swift
//  Window-Shopper
//
//  Created by Benjamin Jakob on 24.10.17.
//  Copyright © 2017 BenJakob. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var wageTxt: CurrencyTextField!
    @IBOutlet weak var priceTxt: CurrencyTextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calcButton: UIButton = {
            let btn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
            btn.backgroundColor = .orange
            btn.setTitle("Calculate", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.addTarget(self, action: #selector(calculate), for: .touchUpInside)
            return btn
        }()
        
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
        wageTxt.inputAccessoryView = calcButton
        priceTxt.inputAccessoryView = calcButton
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc private func calculate() {
        guard let wageTxt = wageTxt.text, let priceTxt = priceTxt.text else { return }
        guard let wage = Double(wageTxt), let price = Double(priceTxt)  else { return }
        resultLabel.text = String(Wage.getHours(forWage: wage, andPrice: price))
        resultLabel.isHidden = false
        hoursLabel.isHidden = false
        
        dismissKeyboard()
    }
    
    @IBAction func clearCalculatorPressed(_ sender: Any) {
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
        
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

