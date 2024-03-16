//
//  InViewController.swift
//  Sorting Hat
//
//  Created by Phunsup S. on 14/3/2567 BE.
//

import UIKit

class InViewController: UIViewController {
    
    var inschool:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    



}
extension InViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        inschool.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = inschool[indexPath.row]
        return cell
    }
    
    
}
