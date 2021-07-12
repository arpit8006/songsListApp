//
//  SongDescriptionTVC.swift
//  songsListApp
//
//  Created by Arpit Verma on 11/07/21.
//

import UIKit

class SongDescriptionTVC: SongDetailBaseTVC {

    @IBOutlet private weak var _descriptionLbl : UILabel!
    var songObj : Results?{
        didSet{
            initialise()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func initialise() {
        if let data = songObj{
            _descriptionLbl.text = data.longDescription ?? "No Description"
        }
    }
}
