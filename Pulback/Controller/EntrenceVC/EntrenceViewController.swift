//
//  EntrenceViewController.swift
//  Pulback
//
//  Created by Mac user on 7/29/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import FlagPhoneNumber

class EntrenceViewController: UIViewController {
    
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var phoneTxtF: FPNTextField!{
        didSet {
            phoneTxtF.delegate = self
            phoneTxtF.layer.borderWidth = 1.5
            phoneTxtF.layer.borderColor = UIColor.black.cgColor
            phoneTxtF.layer.cornerRadius = 25
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTextField()
        
    }

    @IBAction func enterenceBtnTapped(_ sender: Any) {
        let vc = RegistrationViewController(nibName: "RegistrationViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    

    func setTextField(){
        navigationController?.navigationBar.isHidden = true
        phoneTxtF.flagButtonSize = CGSize(width: 60, height: 60)
        phoneTxtF.setFlag(key: .UZ)
        phoneTxtF.font = UIFont.boldSystemFont(ofSize: 18)
        phoneTxtF.placeholder = "90 123 45 67"
        underLineLabel(text: "Aгар PulBack дан аввал фойдаланмаган бўлсангиз мана бундинг бошланг", underlineText: "мана бундинг бошланг")
    }
  
    func underLineLabel(text: String, underlineText: String) {
        let textRange = NSRange(location: text.count-underlineText.count, length: underlineText.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: textRange)
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 17), range: textRange)
         helpLabel.attributedText = attributedText
        
        helpLabel.isUserInteractionEnabled = true
        helpLabel.lineBreakMode = .byWordWrapping
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tappedOnLabel(_:)))
        tapGesture.numberOfTouchesRequired = 1
        helpLabel.addGestureRecognizer(tapGesture)
        
    }
    
    //MARK: -- Label Tapped
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = helpLabel.text else { return }
        let numberRange = (text as NSString).range(of: "мана бундинг бошланг")
        
        if gesture.didTapAttributedTextInLabel(label: self.helpLabel, inRange: numberRange) {
            print("😂🤩 Label tapped")
        }
    }
    

}


extension EntrenceViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         textField.text!.count < 12
    }
}




