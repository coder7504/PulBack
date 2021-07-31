//
//  CircleProgressBar.swift
//  Pulback
//
//  Created by Mac user on 31/07/21.
//

import UIKit


class CircleProgressBarClass: UIView {
    
    private var progressLayer = CAShapeLayer()
    
    var isHide:Bool = true
    var lbl: UILabel = {
       var l = UILabel()
        l.font = .boldSystemFont(ofSize: 25)
        return l
    }()
    
    var btn: UIButton = {
        var b = UIButton()
        b.setImage(UIImage(named: "refresh"), for: .normal)
        b.tintColor = .systemRed
        b.backgroundColor = .white
        b.isHidden = true
        return b
    }()
    
    var time: TimeInterval = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
//        setLblText()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
//        setLblText()
    }
    
    
    func createCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width / 2 - 17, y: self.frame.size.height / 2 - 17), radius: 50, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        
   
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 7
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        layer.addSublayer(progressLayer)
        progressAnimation(duration: time)
        
        self.addSubview(lbl)
        lbl.text = "\(Int(time))"
        lbl.textColor = .systemRed
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        lbl.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        lbl.heightAnchor.constraint(equalToConstant: 50).isActive  = true
        lbl.widthAnchor.constraint(equalToConstant: 80).isActive  = true
        lbl.textAlignment = .center
        
        self.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        btn.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 110).isActive  = true
        btn.widthAnchor.constraint(equalToConstant: 110).isActive  = true
        btn.addTarget(self, action: #selector(refreshBtnTapped), for: .touchUpInside)
    }
    
    @objc func refreshBtnTapped(){
        lbl.text = "\(Int(time))"
        btn.isHidden = true
        progressAnimation(duration: time)
    }
    
    
    func progressAnimation(duration: TimeInterval) {
        time = duration
        setLblText()
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
    
    func setLblText(){
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] t in
            if time > 0 {
                time -= 1
            } else {
                t.invalidate()
                btn.isHidden = false
                time = 10
            }
            lbl.text = "\(Int(time))"
        })
    }
    
}
