//
//  CollectionViewCell.swift
//  Cooking
//
//  Created by Tien Le on 11/19/18.
//  Copyright © 2018 Tienle. All rights reserved.
//

import UIKit
import SDWebImage
class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var frameView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        frameView.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }

    func updateContent(dish: Dish){
        let url = URL(string: dish._urlImg!)
        imgView.sd_setImage(with: url, placeholderImage: UIImage(named: "mn_home"))
//        DispatchQueue.global().async {
//            let data = try? Data(contentsOf: url!)
//            DispatchQueue.main.async {
//                self.imgView.image = UIImage(data: data!)
//            }
//        }
        lbName.text = dish.name
    }
}
