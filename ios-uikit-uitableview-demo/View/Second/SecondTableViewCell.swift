//
//  SecondTableViewCell.swift
//  ios-uikit-uitableview-demo
//
//  Created by Manami Ichikawa on 5/26/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    var cellItem:SecondTableViewCellItem?{
    
        didSet {
            detailImage.image = cellItem?.image ??
            #imageLiteral(resourceName: "noImage")
            
            label.text = cellItem?.comment
            label.isHidden = (label.text?.characters.count == 0)
        }
    }
    
    static var identifier:String{
        get {
            return String(describing: self)
        }
    }
    
    static var nibName: String{
        
        get{
            return self.identifier
        }    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
