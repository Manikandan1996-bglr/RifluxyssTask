//
//  ThirdBannerTableCell.swift
//  RifluxyssTask
//
//  Created by Velozion Mac on 03/July/2019A.
//

import UIKit

class ThirdBannerTableCell: UITableViewCell {

    @IBOutlet weak var thirdBannerCV: UICollectionView!
    @IBOutlet weak var seeAllBtn: UIButton!
    var delegate: seeAllBtnTapped?
    var thirdBannerArray = [
        ["title":"Top Infographic", "image": "bannerImg3"],
        ["title":"Most Papular Lens", "image": "bannerImg4"],
        ["title":"Relocation For Work", "image": "bannerImg3"],
        ["title":"4th of July", "image": "bannerImg4"],
        ["title":"Monthly Payment", "image": "bannerImg3"],
        ["title":"Buyer Estimate", "image": "bannerImg4"]]
    override func awakeFromNib() {
        super.awakeFromNib()
        thirdBannerCV.delegate = self
        thirdBannerCV.dataSource = self
        thirdBannerCV.register(UINib(nibName: "ThirdBannerCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ThirdBannerCollectionCell")
    }
    @IBAction func seeAllBtnTapped(_ sender: Any) {
        self.delegate?.navigate()
    }
}

extension ThirdBannerTableCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thirdBannerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdBannerCollectionCell", for: indexPath) as! ThirdBannerCollectionCell
        cell.thirdBannerImg.image = UIImage(named: thirdBannerArray[indexPath.row]["image"]!)
        cell.thirdBannerLbl.text = thirdBannerArray[indexPath.row]["title"]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize.init(width: frame.width / 2, height: collectionView.frame.height)
    }
}
