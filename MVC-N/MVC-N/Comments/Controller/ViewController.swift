//
//  ViewController.swift
//  MVC-N
//
//  Created by Admin on 10/04/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CommentNetworkService.getComments { (response) in
            self.comments = response.comments
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentCell
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        return cell
    }
}
