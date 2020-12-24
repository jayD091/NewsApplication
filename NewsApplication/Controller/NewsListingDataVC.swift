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
    
    var articleData = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerXibs(identifiers: [NewsListingDataTVC.nameOfClass])
        tableView.delegate = self
        tableView.dataSource = self
        ArticleService.getArticleListing(success: { (response) in
            print(response)
            self.articleData = response
            self.tableView.reloadData()
        }) { (error) in
            print(error.debugDescription)
        }
    }
    
}

extension NewsListingDataVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewsListingDataTVC.classIdentifier, for: indexPath) as? NewsListingDataTVC {
            cell.configData(data: self.articleData[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NewsDetailVC") as? NewsDetailVC
        vc?.articleData = self.articleData[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
