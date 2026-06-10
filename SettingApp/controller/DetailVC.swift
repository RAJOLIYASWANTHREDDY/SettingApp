//
//  DetailVC.swift
//  SettingApp
//
//  Created by yaswanth reddy on 6/1/26.
//

import UIKit

var isInternetAvailable = false
var objNetworkManager: NetworkProtocol?

class DetailVC: UIViewController {

    @IBOutlet weak var settings: UITableView!
    
    let sections: [[Setting]] = [
            [
                Setting(title: "About", iconName: "questionmark.square"),
                Setting(title: "Screen Capture", iconName: "camera.viewfinder")
            ],
            [
                Setting(title: "AutoFill & Passwords", iconName: "key.fill"),
                Setting(title: "Dictionary", iconName: "book.closed.fill"),
                Setting(title: "Fonts", iconName: "textformat"),
                Setting(title: "Keyboard", iconName: "keyboard"),
                Setting(title: "Language & Region", iconName: "globe")
            ],
            [
                Setting(title: "VPN & Device Management", iconName: "gearshape.fill")
            ]
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settings.dataSource = self
        settings.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func applyCornersToGeneralCell(_ cell: GeneralHeaderCell) {
        let radius: CGFloat = 24
        
        let view = cell.cardView
        view?.layer.cornerRadius = 20

        view?.layer.cornerRadius = radius
        view?.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner,
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
        cell.clipsToBounds = true
    }

    func applyCornersToSettingsCell(_ cell: SettingsOptionCell, at indexPath: IndexPath) {
        let rowCount = sections[indexPath.section - 1].count
        let radius: CGFloat = 24
        
        let view = cell.cardView
        view?.layer.cornerRadius = 20

        view?.layer.cornerRadius = 0
        view?.layer.maskedCorners = []
        view?.clipsToBounds = true

        if rowCount == 1 {
            // Only one cell in section: all corners
            view?.layer.cornerRadius = radius
            view?.layer.maskedCorners = [
                .layerMinXMinYCorner,
                .layerMaxXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMaxXMaxYCorner
            ]
        } else if indexPath.row == 0 {
            // First cell: top corners
            view?.layer.cornerRadius = radius
            view?.layer.maskedCorners = [
                .layerMinXMinYCorner,
                .layerMaxXMinYCorner
            ]
        } else if indexPath.row == rowCount - 1 {
            // Last cell: bottom corners
            view?.layer.cornerRadius = radius
            view?.layer.maskedCorners = [
                .layerMinXMaxYCorner,
                .layerMaxXMaxYCorner
            ]
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count + 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return 1
        }

        return sections[section - 1].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "GeneralHeaderCell",
                for: indexPath
            ) as! GeneralHeaderCell
            
            cell.cardView.layer.cornerRadius = 20
            
            applyCornersToGeneralCell(cell)

            return cell
        }

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "SettingsOptionCell",
            for: indexPath
        ) as! SettingsOptionCell

        let item = sections[indexPath.section - 1][indexPath.row]
        cell.configure(with: item)
        
        applyCornersToSettingsCell(cell, at: indexPath)

        return cell
    }
}

extension DetailVC: UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        if section == 0 {
            return 20
        }

        return 20
    }


    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }


}

extension DetailVC: NetworkProtocol{
    func getDataFromServer(for url: String) -> [Setting?] {
        if isInternetAvailable {
            objNetworkManager = NetworkManager.sharedInstance
        }
        else {
            objNetworkManager = MockNetworkManager.sharedInstance
        }
        return objNetworkManager?.getDataFromServer(for: "www.nwt.com") ?? []
    }
}
    
    
