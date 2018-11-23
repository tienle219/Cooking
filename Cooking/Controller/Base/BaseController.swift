//
//  BaseController.swift
//  Cooking
//
//  Created by Tien Le on 11/19/18.
//  Copyright © 2018 Tienle. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLeftMenuButton()
        // Do any additional setup after loading the view.
    }
    func setupLeftMenuButton() {
        let btnLeft = UIButton(type: .custom)
        btnLeft.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        if self != self.navigationController?.viewControllers[0] {
            btnLeft.setImage(UIImage.init(named: "ic_back"), for: .normal)
            btnLeft.addTarget(self, action: #selector(touchOnBack), for: .touchUpInside)
            btnLeft.contentHorizontalAlignment = .left
            let leftBarItem = UIBarButtonItem(customView: btnLeft)
            self.navigationItem.leftBarButtonItem = leftBarItem
        }else{
            self.setNavigationBarItem()
        }
    }
    @objc func touchOnBack() {
        self.navigationController!.popViewController(animated: true)
    }

}
extension BaseController{
    func setNavigationBarItem(){
        self.addLeftBarButtonWithImage(UIImage(named: "ic_menu")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
    }
}
