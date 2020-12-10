//
//  TopBannerImageTableCell.swift
//  RifluxyssTask
//
//  Created by Velozion Mac on 03/July/2019A.
//

import UIKit

class TopBannerImageTableCell: UITableViewCell {
    @IBOutlet weak var topBannerCV: UICollectionView!
    let imageArray = ["bannerImg5","bannerImg4","bannerImg5","bannerImg4","bannerImg4","bannerImg5"]
    override func awakeFromNib() {
        super.awakeFromNib()
        topBannerCV.delegate = self
        topBannerCV.dataSource = self
        topBannerCV.register(UINib(nibName: "TopBannerImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "TopBannerImageCollectionCell")
    }
}

extension TopBannerImageTableCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopBannerImageCollectionCell", for: indexPath) as! TopBannerImageCollectionCell
        cell.topBannerImage.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize.init(width: frame.width, height: collectionView.frame.height)
    }
}
