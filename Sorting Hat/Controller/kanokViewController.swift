//
//  kanokViewController.swift
//  Sorting Hat
//
//  Created by Phunsup S. on 14/3/2567 BE.
//

import UIKit

class kanokViewController: UIViewController {

    var kanok:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension kanokViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        kanok.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellKa = tableView.dequeueReusableCell(withIdentifier: "cellKa", for: indexPath)
        cellKa.textLabel?.text = kanok[indexPath.row]
        return cellKa
    }
    
    
}
