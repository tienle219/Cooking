//
//  MainController.swift
//  Cooking
//
//  Created by Tien Le on 11/19/18.
//  Copyright © 2018 Tienle. All rights reserved.
//

import UIKit
import SQLite
import ImageSlideshow
class MainController: BaseController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var collectionViewKho: UICollectionView!
    @IBOutlet weak var collectionViewCanh: UICollectionView!
    @IBOutlet weak var collectionViewCXao: UICollectionView!
    @IBOutlet weak var collectionViewBanh: UICollectionView!
//    @IBOutlet weak var bannerView: ImageSlideshow!
    
    @IBOutlet weak var iconkho: UIImageView!
    @IBOutlet weak var iconcanh: UIImageView!
    @IBOutlet weak var iconxao: UIImageView!
    @IBOutlet weak var iconbanh: UIImageView!
    @IBOutlet weak var bannerView: ImageSlideshow!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    var arrMonKho: [Dish] = []
    var arrMonCanh: [Dish] = []
    var arrMonChienXao: [Dish] = []
    var arrMonBanh: [Dish] = []
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    let img = [ImageSource(image: UIImage(named: "kho")!),ImageSource(image: UIImage(named: "canh")!),ImageSource(image: UIImage(named: "banh")!)]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.iconkho.setImageColor(color: UIColor.white)
        self.iconcanh.setImageColor(color: UIColor.white)
        self.iconxao.setImageColor(color: UIColor.white)
        self.iconbanh.setImageColor(color: UIColor.white)
        self.title = "Trang Chủ"
        self.Register()
        self.getData()
        self.activityIndicatorView.startAnimating()
        self.imageBanner()
        // Do any additional setup after loading the view.
//        self.view.addSubview(bannerView)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func imageBanner(){
        bannerView.slideshowInterval = 2.0
        bannerView.pageIndicatorPosition = .init(horizontal: .center, vertical: .bottom)
        bannerView.contentScaleMode = UIView.ContentMode.scaleAspectFill
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        bannerView.pageIndicator = pageControl
        bannerView.activityIndicator = DefaultActivityIndicator()
//        bannerView.currentPageChanged = { page in
//            print("current page:", page)
//        }
        bannerView.setImageInputs(img)
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap))
        bannerView.addGestureRecognizer(recognizer)
    }
    @objc func didTap() {
        bannerView.presentFullScreenController(from: self)
//
//        let fullScreenController = bannerView.presentFullScreenController(from: self)
//        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    func Register(){
        self.collectionViewKho.delegate = self
        self.collectionViewKho.dataSource = self
        self.collectionViewCanh.delegate = self
        self.collectionViewCanh.dataSource = self
        self.collectionViewBanh.delegate = self
        self.collectionViewBanh.dataSource = self
        self.collectionViewCXao.delegate = self
        self.collectionViewCXao.dataSource = self
        self.collectionViewKho.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionView")
        self.collectionViewBanh.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionView")
        self.collectionViewCXao.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionView")
        self.collectionViewCanh.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionView")
    }
    func getData(){
        ConnecDB.share().getDataToDB(completionHandle: {
            (result) in
            guard let result = result else {return}
            for item in result {
                if (item._id == 1){
                    self.arrMonKho.append(item)
                }else if (item._id == 2){
                    self.arrMonCanh.append(item)
                }else if (item._id == 3){
                    self.arrMonChienXao.append(item)
                }else if (item._id == 4){
                    self.arrMonBanh.append(item)
                }
            }
        })
    }
}
extension MainController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == collectionViewKho){
            return arrMonKho.count
        }else if(collectionView == collectionViewCanh){
            return arrMonCanh.count
        }else if(collectionView == collectionViewCXao){
            return arrMonChienXao.count
        }else{
            return arrMonBanh.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as! CollectionViewCell
        if (collectionView == collectionViewKho){
            cell.updateContent(dish: arrMonKho[indexPath.row])
        }else if (collectionView == collectionViewCanh){
            cell.updateContent(dish: arrMonCanh[indexPath.row])
        }else if (collectionView == collectionViewCXao){
            cell.updateContent(dish: arrMonChienXao[indexPath.row])
        }else{
            cell.updateContent(dish: arrMonBanh[indexPath.row])
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if (collectionView == collectionViewKho){
            let view = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
            self.navigationController?.pushViewController(view, animated: false)
            view.arr = self.arrMonKho[indexPath.row]
        }else if (collectionView == collectionViewCanh){
            let view = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
            self.navigationController?.pushViewController(view, animated: false)
            view.arr = self.arrMonCanh[indexPath.row]
        }else if (collectionView == collectionViewCXao){
            let view = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
            self.navigationController?.pushViewController(view, animated: false)
            view.arr = self.arrMonChienXao[indexPath.row]
        }else{
            let view = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
            self.navigationController?.pushViewController(view, animated: false)
            view.arr = self.arrMonBanh[indexPath.row]
        }
    }
    
}
extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
