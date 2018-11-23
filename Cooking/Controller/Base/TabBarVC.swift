//
//  TabBarVC.swift
//  Cooking
//
//  Created by Tien Le on 11/19/18.
//  Copyright © 2018 Tienle. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = self.tabBar
        self.delegate = self
        let item1 = tabbar.items![0]
        let item2 = tabbar.items![1]
        let item3 = tabbar.items![2]
        let item4 = tabbar.items![3]
        let item5 = tabbar.items![4]
        item1.image = UIImage(named: "ic_home")
        item2.image = UIImage(named: "mn_kho")
        item3.image = UIImage(named: "mn_canh")
        item4.image = UIImage(named: "mn_xao")
        item5.image = UIImage(named: "mn_banh")
        item1.title = "Trang Chủ"
        item2.title = "Món Kho"
        item3.title = "Món Canh"
        item4.title = "Món Chiên Xào"
        item5.title = "Món Bánh"
        // Do any additional setup after loading the view.
    }

}
