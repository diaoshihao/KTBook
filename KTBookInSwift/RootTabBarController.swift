//
//  RootTabBarController.swift
//  KTBookInSwift
//
//  Created by suger on 2017/11/22.
//  Copyright © 2017年 diaoshihao. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTabBar()
        self.setRootVC()
    }
    
    func setTabBar() {
        self.setValue(CustomTabBar(), forKey: "tabBar")
        
        let normalAttr = [NSFontAttributeName:font(11)]
        let seletedAttr = [NSFontAttributeName:font(11), NSForegroundColorAttributeName:rgbColor(r: 250, g: 100, b: 50)]
        
        let item = UITabBarItem.appearance()
        item.setTitleTextAttributes(normalAttr, for: .normal)
        item.setTitleTextAttributes(seletedAttr, for: .selected)
    }
    
    func setRootVC() {
        self .addChildVC(VC: HomeViewController(), title: "首页", image: "tab_icon_bookstore_nor", selectedImage: "tab_icon_bookstore_sel")
        self .addChildVC(VC: BookLibViewController(), title: "书库", image: "tab_icon_bookself_nor", selectedImage: "tab_icon_bookself_sel")
        self .addChildVC(VC: ReadingViewController(), title: "阅读会", image: "tab_icon_forum_nor", selectedImage: "tab_icon_forum_sel")
        self .addChildVC(VC: MineViewController(), title: "我的", image: "tab_icon_mine_nor", selectedImage: "tab_icon_mine_sel")
    }
    
    func addChildVC(VC: UIViewController, title: String, image: String, selectedImage: String) -> Void {
        VC.tabBarItem.title = title
        VC.tabBarItem.image = UIImage(named: image)
        VC.tabBarItem.selectedImage = UIImage(named: selectedImage)
        
        let Nav = RootNavigationController(rootViewController: VC)
        self.addChildViewController(Nav)
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
