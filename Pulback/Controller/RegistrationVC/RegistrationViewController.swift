//
//  RegistrationViewController.swift
//  Pulback
//
//  Created by Mac user on 29/07/21.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var logInBtnOutlet: RedButton!
    @IBOutlet weak var checkBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBtnOutlet.setImage(UIImage(named: "unCheck"), for: .normal)
        logInBtnOutlet.setTitle("Рўйҳатдан ўтиш", for: .normal)
    }


    @IBAction func checkButtonTapped(_ sender: Any) {
        if checkBtnOutlet.currentImage == UIImage(named: "unCheck") {
            checkBtnOutlet.setImage(UIImage(named: "check"), for: .normal)
        }else {
            checkBtnOutlet.setImage(UIImage(named: "unCheck"), for: .normal)
        }
    }
    
    @IBAction func logInButtonTapped(_ sender: Any) {
        let vc = OTPViewController(nibName: "OTPViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
