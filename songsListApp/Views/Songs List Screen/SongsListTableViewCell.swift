//
//  SongsListTableViewCell.swift
//  songsListApp
//
//  Created by Arpit Verma on 11/07/21.
//

import UIKit

class SongsListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var view : UIView!
    @IBOutlet private weak var _imageView : UIImageView!
    @IBOutlet private weak var _trackNameLbl : UILabel!
    @IBOutlet private weak var _artistNameLbl : UILabel!
    @IBOutlet private weak var _runningTimeLbl : UILabel!
    @IBOutlet private weak var _trackTypeLbl : UILabel!
    
    var songObj : Results?{
        didSet{
            initialise()
        }
    }
    
    private func initialise(){
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
        }
    }
    
    static func identifier() -> String {
        let myName = String(describing: self)
        return myName
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.provideShadow()
        _imageView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

