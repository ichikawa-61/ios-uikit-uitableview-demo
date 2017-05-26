//
//  SecondTableViewProvider.swift
//  ios-uikit-uitableview-demo
//
//  Created by Manami Ichikawa on 5/26/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

import UIKit

final class SecondTableViewProvider: NSObject {
    var items: [SecondTableViewCellItem] = []
    
    func set(items: [SecondTableViewCellItem]){
        self.items = items
    }
    
    func append(item: SecondTableViewCellItem){
        items.append(item)
    }
}

extension SecondTableViewProvider: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section: \(section)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath) as! SecondTableViewCell
        cell.cellItem = items[indexPath.row]
        
        cell.selectionStyle = .none
        
        return cell
    }


}
