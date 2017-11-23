//
//  CustomTabBar.swift
//  KTBookInSwift
//
//  Created by suger on 2017/11/22.
//  Copyright © 2017年 diaoshihao. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {

    let middleButton = UIButton(type: .custom);
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        middleButton.setImage(UIImage.init(named: "tab_icon_plus_nor"), for: .normal)
        middleButton.size = (middleButton.currentImage?.size)!
        self.addSubview(middleButton)
        
        self.isTranslucent = false
        self.selectedItem?.setTitleTextAttributes([NSForegroundColorAttributeName:rgbColor(r: 250, g: 100, b: 50)], for: .selected)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = self.bounds.width
        let height = self.bounds.height
        
        middleButton.center = CGPoint(x: width*0.5, y: height*0.5)
        middleButton.y -= 5
        
        var index = 0;
        let itemWidth = width/5.0
        for view in self.subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!) {
                if index <= 1 {
                    view.x = CGFloat(index)*itemWidth
                } else {
                    view.x = CGFloat(index+1)*itemWidth
                }
                view.width = itemWidth
                index += 1
            }
        }
    }
}
