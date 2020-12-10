//
//  ContentVC.swift
//  RifluxyssTask
//
//  Created by Velozion Mac on 03/July/2019A.
//

import UIKit

class ContentVC: UIViewController {
    @IBOutlet weak var contentCV: UICollectionView!
    let contentArray = [
        ["title":"Infographic Name", "image": "contentImg3"],
        ["title":"Lens Name", "image": "contentImg1"],
        ["title":"Lens Name", "image": "contentImg1"],
        ["title":"Infographic Name", "image": "contentImg2"],
        ["title":"Infographic Name", "image": "contentImg5"],
        ["title":"Lens Name", "image": "contentImg4"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        contentCV.register(UINib(nibName: "ContentCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ContentCollectionCell")
    }
}

extension ContentVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCollectionCell", for: indexPath) as! ContentCollectionCell
        cell.contentImg.image = UIImage(named: contentArray[indexPath.row]["image"]!)
        cell.contentLbl.text = contentArray[indexPath.row]["title"]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height : CGFloat
        if indexPath.item % 2 == 0 {
            height = 300
        } else {
            height = 280
        }
        let yourWidth = collectionView.bounds.width/2.0
        return CGSize(width: yourWidth, height: height)
    }
}
