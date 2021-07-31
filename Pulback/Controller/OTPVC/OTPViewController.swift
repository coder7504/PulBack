//
//  OTPViewController.swift
//  Pulback
//
//  Created by Mac user on 30/07/21.
//

import UIKit

class OTPViewController: UIViewController {

    @IBOutlet weak var confirmBtnTapped: RedButton!
 
    
    @IBOutlet weak var stackView: OTPVClass!
    @IBOutlet weak var progressView: CircleProgressBarClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmBtnTapped.setTitle("Тасдиқлаш", for: .normal)
        
    }


    @IBAction func backBtnTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        print(stackView.fieldText)
    }

    
}
