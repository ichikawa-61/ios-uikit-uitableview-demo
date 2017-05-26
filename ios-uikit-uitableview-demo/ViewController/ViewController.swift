//
//  ViewController.swift
//  ios-uikit-uitableview-demo
//
//  Created by Manami Ichikawa on 5/25/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let country = ["文化遺産","自然遺産"];
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as! TableViewCell
        cell.setupTableViewCell(with: country[indexPath.row], indexPath: indexPath)
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //選択を外す
        tableView.deselectRow(at: indexPath, animated: true)
        
        if(indexPath.row == 0){
            guard let secondVC = UIStoryboard(name: "SecondViewController", bundle: nil).instantiateInitialViewController() else { return }
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}



