//
//  Utilities.swift
//  songsListApp
//
//  Created by Arpit Verma on 12/07/21.
//

import Foundation
import UIKit


public func allValues<T: CaseIterable>(_:T.Type) -> Array<T> {
    return T.allCases as! Array<T>
}


extension String{
    func sizeOfString (width: CGFloat = CGFloat.greatestFiniteMagnitude, font : UIFont, height: CGFloat = CGFloat.greatestFiniteMagnitude, drawingOption: NSStringDrawingOptions = NSStringDrawingOptions.usesLineFragmentOrigin) -> CGSize {
        return (self as NSString).boundingRect(with: CGSize(width: width, height: height), options: drawingOption, attributes: [NSAttributedString.Key.font : font], context: nil).size
    }
}


extension UIImageView {

 public func imageFromServerURL(urlString: String, PlaceHolderImage:UIImage) {

        if self.image == nil{
              self.image = PlaceHolderImage
        }

        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        }).resume()
    }}

extension Int{
    func secondsMinutesSeconds () -> String {
      return "\((self % 3600) / 60) Mins \((self % 3600) % 60) Sec"
    }
}

extension UIView{
    func provideShadow(){
        let cardViewlayer = self.layer
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
        cardViewlayer.cornerRadius = 8.0
        cardViewlayer.masksToBounds = false
        cardViewlayer.shadowColor = UIColor.black.cgColor
        cardViewlayer.shadowOffset = CGSize(width: 0, height: 1)
        cardViewlayer.shadowRadius = 1
        cardViewlayer.shadowOpacity = 0.3
        
    }
}
