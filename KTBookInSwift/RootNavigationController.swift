//
//  RootNavigationController.swift
//  KTBookInSwift
//
//  Created by suger on 2017/11/22.
//  Copyright © 2017年 diaoshihao. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0 {
            self.hidesBottomBarWhenPushed = true
            
            let backButton = UIBarButtonItem(image: UIImage.init(named: "icon_back"), style: .plain, target: self, action: #selector(self.backAction))
            backButton.tintColor = UIColor.black
            self.navigationItem.leftBarButtonItem = backButton
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func backAction() {
        self.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
