//
//  SongDetailViewController.swift
//  songsListApp
//
//  Created by Arpit Verma on 11/07/21.
//

import UIKit

class SongDetailViewController: UIViewController {
    
    //Outlests And Variables
    @IBOutlet weak var _tableView : UITableView!
    var songObj : Results?
    
    enum CellsType: Int, CaseIterable {
            case DetailsHeader = 0
            case Description
            
            static let numberOfCells = allValues(CellsType.self)
            
            func classType() -> SongDetailBaseTVC.Type {
                switch self {
                case .DetailsHeader:
                    return SongDetailHeaderTVC.self
                case .Description:
                    return SongDescriptionTVC.self
                }
            }
        }
    
    //Functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let _ = songObj{
            _tableView.reloadData()
        }
    }

}

//MARK:- UITABLEVIEW DELEGATES AND DATASOURCES
extension SongDetailViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellsType.numberOfCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CellsType.numberOfCells[indexPath.row].classType().identifier()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) else {
            return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellType = CellsType.numberOfCells[indexPath.row]
        switch cellType {
        case .DetailsHeader:
            (cell as! SongDetailHeaderTVC).songObj = songObj
        case .Description:
            (cell as! SongDescriptionTVC).songObj = songObj
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = CellsType.numberOfCells[indexPath.row]
        switch cellType {
        case .DetailsHeader:
            return 310.0
        case .Description:
            var rowheight : CGFloat = 80.0
            if let songObj = songObj{
                if let desc = songObj.longDescription{
                    let height = desc.sizeOfString(width: tableView.bounds.size.width - 20, font: UIFont.systemFont(ofSize: 12.0)).height
                    rowheight += height
                }
            }
            return rowheight
        }
    }
}
