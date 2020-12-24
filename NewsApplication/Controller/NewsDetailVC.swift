//
//  NewsDetailVC.swift
//  NewsApplication
//
//  Created by macbook on 24/12/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class NewsDetailVC: BaseViewController {

    @IBOutlet weak var tableView: BaseTableView!
    
    var articleData = Article()
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        tableView.registerXibs(identifiers: [NewDetailDataTVC.classIdentifier])
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func buttonBackAction(_ sender: UIButton) {
        actionBack()
    }
    
}

extension NewsDetailVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewDetailDataTVC.nameOfClass, for: indexPath) as? NewDetailDataTVC {
            cell.configData(data: articleData)
            return cell
        }
        return UITableViewCell()
    }
}
