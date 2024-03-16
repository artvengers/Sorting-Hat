//
//  ResultViewController.swift
//  Sorting Hat
//
//  Created by Phunsup S. on 14/3/2567 BE.
//

import UIKit

protocol ResultDelegate: AnyObject {
    func goback()
}

class ResultViewController: UIViewController {
    
    var delegate: ResultDelegate?
    
    @IBOutlet weak var goBackLabel: UIButton!
    
    
    @IBOutlet weak var allUserLabel: UILabel!
    
    
    @IBOutlet weak var alluserView: UIView!
    
    var inschool: [String] = []

    var pacha:[String] = []

    var kanok:[String] = []

    var bu: [String] = []
    
    
    @IBOutlet weak var buMiniView: UIView!
    
    @IBOutlet weak var kanokMiniView: UIView!
    
    @IBOutlet weak var pachaMiniView: UIView!
    
    @IBOutlet weak var inMiniView: UIView!
    
    
    
    
    
    @IBOutlet weak var inMemberLabel: UILabel!
    
    @IBOutlet weak var pachaMemberLabel: UILabel!
    
    @IBOutlet weak var kanokMemberLabel: UILabel!
    
    @IBOutlet weak var buMemberLabel: UILabel!
    
    
    
    
    @IBAction func goinButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToIn", sender: self)
    }
    
    @IBAction func gopachaButton(_ sender: Any) {
        self.performSegue(withIdentifier: "goToPacha", sender: self)
    }
    
    @IBAction func gokanokButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToKanok", sender: self)
    }
    
    @IBAction func gobuButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToBu", sender: self)
    }
    
    @IBAction func goback(_ sender: Any) {
        delegate?.goback()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alluserView.layer.cornerRadius = 20
        
        goBackLabel.layer.cornerRadius = 32
        
        inMiniView.layer.cornerRadius = 32
        
        pachaMiniView.layer.cornerRadius = 32
        
        kanokMiniView.layer.cornerRadius = 32
        
        buMiniView.layer.cornerRadius = 32
        
        allUserLabel.layer.cornerRadius = 5
        
        inMemberLabel.text = "จำนวนคน: " + String(inschool.count)
        
        pachaMemberLabel.text = "จำนวนคน: " + String(pacha.count)
        
        kanokMemberLabel.text = "จำนวนคน: " + String(kanok.count)
        
        buMemberLabel.text = "จำนวนคน: " + String(bu.count)
        
        let allUser = inschool.count + pacha.count + kanok.count + bu.count
        
        allUserLabel.text = "จำนวนคนทั้งหมด: " + String(allUser)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToIn"){
            let destinationIn = segue.destination as! InViewController
            destinationIn.inschool = inschool
        }else if(segue.identifier == "goToPacha"){
            let destinationPa = segue.destination as! pachaViewController
            destinationPa.pacha = pacha
            
        }else if(segue.identifier == "goToKanok"){
            let destinationKa = segue.destination as! kanokViewController
            destinationKa.kanok = kanok
            
        }else if(segue.identifier == "goToBu"){
            let destinationBu = segue.destination as! buViewController
            destinationBu.bu = bu
            
        }
    }

}
