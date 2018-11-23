//
//  TableViewCell.swift
//  Cooking
//
//  Created by Tien Le on 11/21/18.
//  Copyright © 2018 Tienle. All rights reserved.
//

import UIKit
import SDWebImage
class DishTableViewCell: UITableViewCell {

    @IBOutlet weak var bgimage: UIImageView!
    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbconten: UILabel!
    //    @IBOutlet weak var lbContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        frameView.layer.cornerRadius = 5
        frameView.clipsToBounds = true
        imgView.layer.cornerRadius = imgView.frame.height/2
        imgView.layer.borderWidth = 1
        imgView.layer.borderColor = UIColor.lightGray.cgColor
        imgView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateContentCell(dish: Dish){
        let url = URL(string: dish._urlImg!)
        imgView.sd_setImage(with: url, placeholderImage: UIImage(named: "mn_home"))
//        DispatchQueue.global().async {
//            let data = try? Data(contentsOf: url!)
//            DispatchQueue.main.async {
//                self.imgView.image = UIImage(data: data!)
//            }
//        }
        lbName.text = dish.name
        lbconten.text = dish.cachlam?.replacingOccurrences(of: "\n", with: " ")
        
    }
    
}
