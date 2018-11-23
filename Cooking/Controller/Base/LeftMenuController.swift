//
//  LeftMenuController.swift
//  Cooking
//
//  Created by Tien Le on 11/19/18.
//  Copyright © 2018 Tienle. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
enum LeftMenu: Int {
    case tabbar0 = 0
    case tabbar1
    case tabbar2
    case tabbar3
    case tabbar4
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}
class LeftMenuController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tabbarVC: TabBarVC!
    var mainVC: UIViewController!
    var monKhoVC: UIViewController!
    var monCanhVC: UIViewController!
    var monChienXaoVC: UIViewController!
    var monBanhVC: UIViewController!
    var arrContent : [[String : String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Register()
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setContenTable()
    }
    func Register(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        self.tabbarVC = (storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC)
        let mainvc = storyboard.instantiateViewController(withIdentifier: "MainController") as! MainController
        self.mainVC = UINavigationController(rootViewController: mainvc)
        let monkhovc = storyboard.instantiateViewController(withIdentifier: "MonKhoController") as! MonKhoController
        self.monKhoVC = UINavigationController(rootViewController: monkhovc)
        let moncanhvc = storyboard.instantiateViewController(withIdentifier: "MonCanhController") as! MonCanhController
        self.monCanhVC = UINavigationController(rootViewController: moncanhvc)
        let monchienxaovc = storyboard.instantiateViewController(withIdentifier: "MonChienXaoController") as! MonChienXaoController
        self.monChienXaoVC = UINavigationController(rootViewController: monchienxaovc)
        let monbanhvc = storyboard.instantiateViewController(withIdentifier: "MonBanhController") as! MonBanhController
        self.monBanhVC = UINavigationController(rootViewController: monbanhvc)
    }
    func setContenTable(){
        self.arrContent.removeAll()
        
        let home = ["icon" : "ic_home" , "content" : "Trang Chủ"] as [String : String]
        self.arrContent.append(home)
        let kho = ["icon" : "mn_kho" , "content" : "Món Kho"] as [String : String]
        self.arrContent.append(kho)
        let canh = ["icon" : "mn_canh" , "content" : "Món Canh"] as [String : String]
        self.arrContent.append(canh)
        let ran = ["icon" : "mn_xao" , "content" : "Món Chiên Xào"] as [String : String]
        self.arrContent.append(ran)
        let banh = ["icon" : "mn_banh" , "content" : "Món Bánh"] as [String : String]
        self.arrContent.append(banh)
        self.tableView.reloadData()
    }

}
extension LeftMenuController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrContent.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.imgView.image = UIImage(named: self.arrContent[indexPath.row]["icon"]!)
        cell.lbName.text = self.arrContent[indexPath.row]["content"]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            self.tabbarVC.selectedIndex = 0
            self.slideMenuController()?.changeMainViewController(tabbarVC, close: true)
        case 1:
            self.tabbarVC.selectedIndex = 1
            self.slideMenuController()?.changeMainViewController(tabbarVC, close: true)
        case 2:
            self.tabbarVC.selectedIndex = 2
            self.slideMenuController()?.changeMainViewController(tabbarVC, close: true)
        case 3:
            self.tabbarVC.selectedIndex = 3
            self.slideMenuController()?.changeMainViewController(tabbarVC, close: true)
        case 4:
            self.tabbarVC.selectedIndex = 4
            self.slideMenuController()?.changeMainViewController(tabbarVC, close: true)
        default:
            break
        }
    }
    
    
}
