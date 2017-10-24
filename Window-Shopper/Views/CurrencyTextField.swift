//
//  CurrencyTextField.swift
//  Window-Shopper
//
//  Created by Benjamin Jakob on 24.10.17.
//  Copyright © 2017 BenJakob. All rights reserved.
//

import UIKit

@IBDesignable
class CurrencyTextField: UITextField {
    
    override func prepareForInterfaceBuilder() {
        setupViews()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5.0
        textAlignment = .center
        textColor = .white
        
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: UIColor.white])
            attributedPlaceholder = place
        }
        
        let currencyLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .lightGray
            label.textAlignment = .center
            label.textColor = .gray
            label.layer.cornerRadius = 5.0
            label.clipsToBounds = true
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        currencyLabel.text = formatter.currencySymbol
        
        addSubview(currencyLabel)
        NSLayoutConstraint.activate([
            currencyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            currencyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            currencyLabel.widthAnchor.constraint(equalToConstant: 20),
            currencyLabel.heightAnchor.constraint(equalToConstant: 20),
            ])
    }
}
