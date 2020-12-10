//
//  FinalBannerTableCell.swift
//  RifluxyssTask
//
//  Created by Velozion Mac on 03/July/2019A.
//

import UIKit

class FinalBannerTableCell: UITableViewCell {

    @IBOutlet weak var finalBannerCV: UICollectionView!
    var finalBannerArray = [
        ["title":"Facebook Post", "image": "finalImg1"],
        ["title":"Instagram post", "image": "finalImg2"],
        ["title":"Facebook story", "image": "finalImg3"],
        ["title":"Facebook Post", "image": "finalImg1"],
        ["title":"Instagram post", "image": "finalImg2"],
        ["title":"Facebook story", "image": "finalImg3"]]
    override func awakeFromNib() {
        super.awakeFromNib()
        finalBannerCV.delegate = self
        finalBannerCV.dataSource = self
        finalBannerCV.register(UINib(nibName: "FinalBannerCollectionCell", bundle: nil), forCellWithReuseIdentifier: "FinalBannerCollectionCell")
    }    
}

extension FinalBannerTableCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return finalBannerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FinalBannerCollectionCell", for: indexPath) as! FinalBannerCollectionCell
        cell.finalBannerImage.image = UIImage(named: finalBannerArray[indexPath.row]["image"]!)
        cell.finalBannerLbl.text = finalBannerArray[indexPath.row]["title"]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: frame.width / 3, height: collectionView.frame.height)
    }
}
