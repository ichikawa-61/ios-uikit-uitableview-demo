//
//  TableViewCell.swift
//  ios-uikit-uitableview-demo
//
//  Created by Manami Ichikawa on 5/25/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    func setupTableViewCell(with name: String, indexPath: IndexPath){
       
        countryNameLabel.text = name    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
