//
//  RedButton.swift
//  Pulback
//
//  Created by Mac user on 29/07/21.
//

import UIKit

class RedButton: UIButton {
    
    var title: String?
    
    init() {
        super.init(frame: .zero)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        customInit()
    }
    
    
    func customInit(){
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 18)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = StaticValue.appRed
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 25
    }
    
    
}
