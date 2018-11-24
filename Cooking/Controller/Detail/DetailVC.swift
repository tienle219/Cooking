//
//  DetailVC.swift
//  Cooking
//
//  Created by Tien Le on 11/22/18.
//  Copyright © 2018 Tienle. All rights reserved.
//

import UIKit
import SDWebImage
class DetailVC: BaseController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbContent: UITextView!
    var arr: Dish?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = arr?.name
        lbContent.text = arr?.cachlam
        lbContent.isEditable = false
        imgView.sd_setImage(with: URL(string: (arr?._urlImg)!), placeholderImage: UIImage(named: "mn_home"))
        // Do any additional setup after loading the view.
    }
}
