//
//  SecondBannerTableCell.swift
//  RifluxyssTask
//
//  Created by Velozion Mac on 03/July/2019A.
//

import UIKit

protocol seeAllBtnTapped {
    func navigate()
}
class SecondBannerTableCell: UITableViewCell {
    
    @IBOutlet weak var econdBannerCV: UICollectionView!
    @IBOutlet weak var secondBannerLabel: UILabel!
    @IBOutlet weak var seeAllBtn: UIButton!
    var delegate: seeAllBtnTapped?
    let secondContentArray = [
        ["title":"Top Infographic", "image": "bannerImg1"],
        ["title":"Most Papular Lens", "image": "bannerImg2"],
        ["title":"Relocation For Work", "image": "bannerImg3"],
        ["title":"4th of July", "image": "bannerImg4"],
        ["title":"Monthly Payment", "image": "bannerImg1"],
        ["title":"Buyer Estimate", "image": "bannerImg2"]]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        econdBannerCV.delegate = self
        econdBannerCV.dataSource = self
        econdBannerCV.register(UINib(nibName: "SecondBannerCollectionCell", bundle: nil), forCellWithReuseIdentifier: "SecondBannerCollectionCell")
    }
    
    @IBAction func seeAllBtnTapped(_ sender: Any) {
        self.delegate?.navigate()
    }
    
}

extension SecondBannerTableCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return secondContentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondBannerCollectionCell", for: indexPath) as! SecondBannerCollectionCell
        cell.secondBannerLabel.text = secondContentArray[indexPath.row]["title"]
        cell.secondBannerImage.image = UIImage(named: secondContentArray[indexPath.row]["image"]!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: frame.width/2, height: collectionView.frame.height)
    }
}
