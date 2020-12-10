//
//  HomeVC.swift
//  RifluxyssTask
//
//  Created by Velozion Mac on 03/July/2019A.
//

import UIKit

class HomeVC: UIViewController, seeAllBtnTapped {

    @IBOutlet weak var contentTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTV.register(UINib(nibName: "TopBannerImageTableCell", bundle: nil), forCellReuseIdentifier: "TopBannerImageTableCell")
        contentTV.register(UINib(nibName: "SecondBannerTableCell", bundle: nil), forCellReuseIdentifier: "SecondBannerTableCell")
        contentTV.register(UINib(nibName: "ThirdBannerTableCell", bundle: nil), forCellReuseIdentifier: "ThirdBannerTableCell")
        contentTV.register(UINib(nibName: "FinalBannerTableCell", bundle: nil), forCellReuseIdentifier: "FinalBannerTableCell")
    }
    
    func navigate() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ContentVC") as! ContentVC
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 1
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopBannerImageTableCell", for: indexPath) as! TopBannerImageTableCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondBannerTableCell", for: indexPath) as! SecondBannerTableCell
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdBannerTableCell", for: indexPath) as! ThirdBannerTableCell
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FinalBannerTableCell", for: indexPath) as! FinalBannerTableCell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 190
        case 1:
            return 250
        case 2:
            return 250
        default:
            return 200
        }
    }
}


