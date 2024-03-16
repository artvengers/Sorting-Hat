//
//  buViewController.swift
//  Sorting Hat
//
//  Created by Phunsup S. on 14/3/2567 BE.
//

import UIKit

class buViewController: UIViewController {

    var bu:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension buViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellBu = tableView.dequeueReusableCell(withIdentifier: "cellBu", for: indexPath)
        cellBu.textLabel?.text = bu[indexPath.row]
        return cellBu
    }
    
    
}
