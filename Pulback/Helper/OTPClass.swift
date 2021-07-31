//
//  OTPClass.swift
//  Pulback
//
//  Created by Mac user on 30/07/21.
//

import UIKit


class OTPTextField: UITextField {
    var previousTextField: UITextField?
    var nextTextFiled: UITextField?
    override func deleteBackward() {
        text = ""
        previousTextField?.becomeFirstResponder()
    }
}



class OTPVClass: UIStackView {
 
    var textFieldArray = [OTPTextField]()
    var numberOfOTPdigit = 4
    var fieldText = ""
     
    override init(frame: CGRect) {
        super.init(frame: frame)
         
        setupStackView()
        setTextFields()
    }
     
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
        setTextFields()
    }
     
    //To setup stackview
    private func setupStackView() {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .center
        self.distribution = .fillEqually
        self.spacing = 15
    }
     
    //To setup text fields
    private func setTextFields() {
        for i in 0..<numberOfOTPdigit {
            let field = OTPTextField()
         
            let bottomView = UIView()
            bottomView.backgroundColor = .black
            
            textFieldArray.append(field)
            addArrangedSubview(field)
            field.font = .systemFont(ofSize: 22, weight: .medium)
            field.delegate = self
            field.backgroundColor = .white
            field.addSubview(bottomView)
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            bottomView.heightAnchor.constraint(equalToConstant: 2).isActive = true
            bottomView.leftAnchor.constraint(equalTo: field.leftAnchor, constant: 0).isActive = true
            bottomView.rightAnchor.constraint(equalTo: field.rightAnchor, constant: 0).isActive = true
            bottomView.bottomAnchor.constraint(equalTo: field.bottomAnchor, constant: 0).isActive = true
            field.textAlignment = .center
    
             
            i != 0 ? (field.previousTextField = textFieldArray[i-1]) : ()
            i != 0 ? (textFieldArray[i-1].nextTextFiled = textFieldArray[i]) : ()
        }
    }
}
 
extension OTPVClass: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let field = textField as? OTPTextField else {
            return true
        }
        
        if !string.isEmpty {
            field.text = string
            fieldText.append(string)
            field.resignFirstResponder()
            field.nextTextFiled?.becomeFirstResponder()
            return true
        }
        return true
    }
}
