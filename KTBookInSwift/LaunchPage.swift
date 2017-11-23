//
//  LaunchPage.swift
//  KTBookInSwift
//
//  Created by suger on 2017/11/23.
//  Copyright © 2017年 diaoshihao. All rights reserved.
//

import UIKit

class LaunchPage {

    public func showPage() {
        UIApplication.shared.keyWindow?.addSubview(LaunchImageView.init(frame: UIScreen.main.bounds))
    }
    
}

class LaunchImageView: UIImageView {
    var timer = Timer()
    var timeout = 5
    
    let imageView = UIImageView(frame: UIScreen.main.bounds)
    
    let timeButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = frame
        self.image = UIImage(named: "1242x2208")
        self.isUserInteractionEnabled = true
        
        self.initSubviews()
        
        self.loadImage()
        
        self.starTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
    }
    
    func initSubviews() {
        let height = screenWidth * (275.0+115.0) / 1242.0
        imageView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight-height)
        imageView.isUserInteractionEnabled = true
        self.addSubview(imageView)
        
        timeButton.frame = CGRect(x: screenWidth-120.0, y: 40.0, width: 100.0, height: 30.0)
        timeButton.setTitle("跳过5s", for: .normal)
        timeButton.setTitleColor(UIColor.black, for: .normal)
        timeButton.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        timeButton.layer.cornerRadius = 15.0
        timeButton.clipsToBounds = true
        timeButton.addTarget(self, action: #selector(cancelTimer), for: .touchUpInside)
        self.addSubview(timeButton)
    }
    
    func starTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (time) in
            self.timeout -= 1
            self.timeButton.setTitle("跳过\(self.timeout)s", for: .normal)
            if self.timeout == 0 {
                self.cancelTimer()
            }
        })
    }
    
    func cancelTimer() {
        timer.invalidate()
        self.removeFromSuperview()
    }
    
    func loadImage() {
        Networking.shared.postRequest(url: api_adimg, parameters: [:], success: { (respone) in
            
        }) { (failure) in
            
        }
    }
}
