//
//  SecondViewController.swift
//  ios-uikit-uitableview-demo
//
//  Created by Manami Ichikawa on 5/25/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {
    @IBOutlet weak var secondTableView: UITableView!
    
    fileprivate let dataSource = SecondTableViewProvider()
    fileprivate let refreshControl = UIRefreshControl()
    fileprivate var items: [SecondTableViewCellItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }


}

private extension SecondViewController{

    func setup(){
        
        registerNibs()
        
        setupTableViewAutomaticDimension()
        
        // ダミーデータをセット
        dataSource.set(items: dummyCellItems())
        
        // tableViewDataSourceを設定
        secondTableView.dataSource = dataSource
        secondTableView.delegate   = self
        
        setupRefreshControl()
        
    }
    
    func registerNibs(){
        let nib = UINib(nibName: SecondTableViewCell.nibName,bundle: Bundle.main)
        secondTableView.register(nib, forCellReuseIdentifier:SecondTableViewCell.identifier)
    }
    
    func setupTableViewAutomaticDimension(){
        secondTableView.estimatedRowHeight = 120
        secondTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func setupRefreshControl() {
        secondTableView.refreshControl = refreshControl
        // 文言設定
        refreshControl.attributedTitle = NSAttributedString(string: "Refresh")
        // アクション設定
        refreshControl.addTarget(self,
                                 action: .refresh,
                                 for: .valueChanged)
    }
    
    /// pull to refresh時のアクション
    @objc func refresh(sender: UIRefreshControl) {
        
        // クルクル開始
        refreshControl.beginRefreshing()
        print("beginRefreshing()後のリフレッシュ状態 = \(sender.isRefreshing)")
        
        // データ更新処理などをする（ここでは遅延処理で擬似的に更新している感じを出している）
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            print("ここでやりたい処理をする")
            // tableも更新する
            self.secondTableView.reloadData()
            // クルクルを止める
            self.refreshControl.endRefreshing()
            print("beginRefreshing()後のリフレッシュ状態 = \(sender.isRefreshing)")
        }
    }

}


    // MARK: - dummy data
private extension SecondViewController {
    func dummyCellItems() -> [SecondTableViewCellItem] {
        var items: [SecondTableViewCellItem] = []
        
        var item = SecondTableViewCellItem()
        
        item.comment = "インド"
        item.image = #imageLiteral(resourceName: "India")
        items.append(item)
        
        item.comment = "カンボジア"
        item.image = #imageLiteral(resourceName: "Cambodia")
        items.append(item)
        
        item.comment = "メキシコ"
        item.image = #imageLiteral(resourceName: "Mexico")
        items.append(item)
        
        item.comment = "ロシア"
        item.image = #imageLiteral(resourceName: "Russia")
        items.append(item)
        
        item.comment = "イタリア"
        item.image = #imageLiteral(resourceName: "Italy")
        items.append(item)
        
        return items
    }
}

private extension Selector {
    static let refresh = #selector(SecondViewController.refresh(sender:))
}

extension SecondViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}

