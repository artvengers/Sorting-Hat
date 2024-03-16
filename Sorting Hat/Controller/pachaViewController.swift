//
//  pachaViewController.swift
//  Sorting Hat
//
//  Created by Phunsup S. on 14/3/2567 BE.
//

import UIKit

class pachaViewController: UIViewController {

    var pacha:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

extension pachaViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pacha.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellPa = tableView.dequeueReusableCell(withIdentifier: "cellPa", for: indexPath)
        cellPa.textLabel?.text = pacha[indexPath.row]
        return cellPa
    }
    
    
}

