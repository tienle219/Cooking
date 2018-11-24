//
//  MonBanhController.swift
//  Cooking
//
//  Created by Tien Le on 11/19/18.
//  Copyright © 2018 Tienle. All rights reserved.
//

import UIKit
import SQLite
class MonBanhController: BaseController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var arrbanh: [Dish] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Món Bánh"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "DishTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.getData()
        self.tableView.separatorStyle = .none
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    func getData(){
        ConnecDB.share().getDataToDB(completionHandle: {
            (result) in
            guard let result = result else {return}
            for item in result {
                if (item._id == 4){
                    self.arrbanh.append(item)
                }
            }
        })
    }
    
    
}
extension MonBanhController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrbanh.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DishTableViewCell
        cell.updateContentCell(dish: arrbanh[indexPath.row])
        //        cell.bgimage.image = UIImage(named: "kho")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        view.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(view, animated: false)
        view.arr = self.arrbanh[indexPath.row]
    }
}

