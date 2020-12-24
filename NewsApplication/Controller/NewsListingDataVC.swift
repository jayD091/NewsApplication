//
//  NewsListingDataVC.swift
//  NewsApplication
//
//  Created by macbook on 24/12/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class NewsListingDataVC: BaseViewController {

    @IBOutlet weak var tableView: BaseTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerXibs(identifiers: [NewsListingDataTVC.nameOfClass])
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension NewsListingDataVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewsListingDataTVC.classIdentifier, for: indexPath) as? NewsListingDataTVC {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NewsDetailVC") as? NewsDetailVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
