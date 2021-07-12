//
//  SongDetailHeaderTVC.swift
//  songsListApp
//
//  Created by Arpit Verma on 11/07/21.
//

import UIKit

class SongDetailHeaderTVC: SongDetailBaseTVC {

    @IBOutlet private weak var _imageView : UIImageView!
    @IBOutlet private weak var _trackNameLbl : UILabel!
    @IBOutlet private weak var _artistNameLbl : UILabel!
    @IBOutlet private weak var _runningTimeLbl : UILabel!
    @IBOutlet private weak var _trackTypeLbl : UILabel!
    @IBOutlet private weak var _rentBuyLbl : UILabel!
    @IBOutlet private weak var _countryLbl : UILabel!
    @IBOutlet private weak var _primeGenreNameLbl : UILabel!
    
    var songObj :Results?{
        didSet{
            initialise()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _imageView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func initialise() {
        if let  data = songObj{
            _artistNameLbl.text = data.artistName ?? " - "
            _trackNameLbl.text = data.trackName ?? " - "
            _trackTypeLbl.text = "Track Type: " + "\(data.kind ?? "- ")"
            if let milliSec = data.trackTimeMillis{
                _runningTimeLbl.text = milliSec.secondsMinutesSeconds()
            }else{
                _runningTimeLbl.text = "0:0"
            }
            if let url = data.artworkUrl100{
                _imageView.imageFromServerURL(urlString: url, PlaceHolderImage: #imageLiteral(resourceName: "music_placeholder"))
            }
            _primeGenreNameLbl.text = data.primaryGenreName ?? "-"
            _countryLbl.text = data.country ?? "-"
            _rentBuyLbl.text = "Rent \(data.trackRentalPrice ?? 0) \(data.currency ?? "") | Buy \(data.collectionPrice ?? 0) \(data.currency ?? "")"
        }
    }
}

//MARK:- Table Cell Base Class For Providing Common Functionality for all cells
class SongDetailBaseTVC : UITableViewCell{
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func initialise(){
        
    }
    
    static func identifier() -> String {
        let myName = String(describing: self)
        return myName
    }
}
