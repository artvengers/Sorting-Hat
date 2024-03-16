//
//  ViewController.swift
//  Sorting Hat
//
//  Created by Phunsup S. on 12/3/2567 BE.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UserManagerDelegate,ResultDelegate {
    
    var useQ = 0
    
    var adviceQ = 0
    
    var allUser:[String] = []
    
    var userManager = UserManager()
    
    var delegate: UserManagerDelegate?
    
    var inschool: [String] = []

    var pacha:[String] = []

    var kanok:[String] = []

    var bu: [String] = []
    
    ///
    var isWantRandom = true
    
    var isFirsttime = true
    
    var pressTime = 0
    
    var isFinish = false
    ///

    @IBOutlet weak var textf: UITextField!

    @IBOutlet weak var testUI: UIView!
    
    @IBOutlet weak var wantrandomLabel: UIButton!
    
    @IBOutlet weak var wantinputLabel: UIButton!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    @IBOutlet weak var randombuttonLabel: UIButton!
    
    @IBOutlet weak var resetbuttonLabel: UIButton!
    
    @IBOutlet weak var resetlabelView: UIView!
    
    @IBOutlet weak var resetbuttonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textf.delegate = self
        userManager.delegate = self
        testUI.layer.cornerRadius = 32
        wantinputLabel.layer.cornerRadius = 15
        wantrandomLabel.layer.cornerRadius = 15
        resetlabelView.layer.cornerRadius = 5
        hideresetLabel()
        resetbuttonView.layer.cornerRadius = 20
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        resetAll()
    }
    
    @IBOutlet weak var resetLabel: UILabel!
    
    
    func goback() {
        resetAll()
    }
    
    func resetAll(){
        
        self.useQ = 0
        
        self.allUser = []
        
        self.inschool = []
        
        self.pacha = []
        
        self.kanok = []
        
        self.bu = []
        
        self.useQ = 0
        
        self.adviceQ = 0
        
        wantrandomLabel.backgroundColor = UIColor.green
        wantinputLabel.backgroundColor = UIColor.systemGray
        randombuttonLabel.setTitle("สุ่มจำนวนคน", for: .normal)
        randombuttonLabel.tintColor = UIColor(red: 0.56, green: 0.16, blue: 0.15, alpha: 1.0)
        
        self.isWantRandom = true
        
        self.isFirsttime = true
        
        self.pressTime = 0
        
        self.isFinish = false
        
        hideresetLabel()
        
        adviceLabel.text = "ใส่จำนวนคน"
        
    }
    
    
    // เมื่อ EndEditing แล้ว ให้ทำอะไร
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(isWantRandom == false){
            inputMode()
        }else{
            if let q = textf.text{
                userManager.fetchUser(quality: q)
            }
        }
        textf.text = ""

    }
    // ถ้าไม่ใส่อะไรในช่องค้นหาจะไม่ให้หยุดการทำงานขของคีบอด
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textf.text != ""){
                return true
        }else {
            textf.placeholder = "ใส่ตามคำแนะนำ"
            return false
        }
    }
    
    @IBAction func wantrandomButton(_ sender: UIButton) {
        wantrandomLabel.backgroundColor = UIColor.green
        wantinputLabel.backgroundColor = UIColor.systemGray
        randombuttonLabel.setTitle("สุ่มจำนวนคน", for: .normal)
        randombuttonLabel.tintColor = UIColor(red: 0.56, green: 0.16, blue: 0.15, alpha: 1.0)
        isWantRandom = true
    }
    
    
    @IBAction func wantinputButton(_ sender: UIButton) {
        wantinputLabel.backgroundColor = UIColor.green
        wantrandomLabel.backgroundColor = UIColor.gray
        randombuttonLabel.setTitle("ไม่พร้อมใช้งาน", for: .normal)
        randombuttonLabel.tintColor = UIColor.white
        isWantRandom = false
    }
    
    //กดที่ปุ่มหลังกรอกจำนวน
    @IBAction func submitButton(_ sender: UIButton) {
        if(isFinish == false){
            if(isWantRandom == false){
                inputMode()
            }else{
                let q = Int(textf.text ?? "0") ?? 0
                useQ = q
                isFinish = true
                showresetLabel()
                textf.endEditing(true)
            }
            textf.text = ""
        }
        textf.text = ""
    }
    @IBAction func randomButton(_ sender: UIButton) {
        
        if(isFinish == false){
            if(isWantRandom){
                let q = Int.random(in: 0...5000)
                useQ = q
                userManager.fetchUser(quality: String(q))
                isFinish = true
                showresetLabel()
            }
        }
    }
    
    //ส่งข้อมูลไปอีกหน้า
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAnswer" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.inschool = inschool
            destinationVC.pacha = pacha
            destinationVC.kanok = kanok
            destinationVC.bu = bu
            destinationVC.delegate = self
        }
    }
    
    func didUpdateUser(user: UserModel){
        allUser.append(contentsOf: user.userName)
        performActionAfterUserFetched()
    }
    
    func performActionAfterUserFetched() {
        sortLogic()
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "goToAnswer", sender: self)
        }
    }
    
    func sortLogic(){
        for i in 0..<useQ {
            let lengths = [inschool.count, pacha.count, kanok.count, bu.count]
            let minLength = lengths.min()
            
            if let minLength = minLength {
                if (inschool.count == minLength) {
                    inschool.append(allUser[i])
                } else if (pacha.count == minLength) {
                    pacha.append(allUser[i])
                } else if (kanok.count == minLength) {
                    kanok.append(allUser[i])
                } else if (bu.count == minLength) {
                    bu.append(allUser[i])
                }
            }
        }
    }

    func inputMode(){
            if(isFirsttime){
                let q = Int(textf.text ?? "0") ?? 0
                useQ = q
                adviceQ = q
                isFirsttime = false
                adviceLabel.text = "ใส่ชื่อจำนวน \(adviceQ) ครั้ง"
            }else{
                if(allUser == nil){
                    allUser[0] = textf.text!
                    adviceQ -= 1
                }else{
                    allUser.append(textf.text!)
                    adviceQ -= 1
                }
                adviceLabel.text = "ใส่ชื่อจำนวน \(adviceQ) ครั้ง"
                pressTime += 1
                if(pressTime == useQ){
                    isFinish = true
                    showresetLabel()
                    performActionAfterUserFetched()
                    adviceLabel.text = "ใส่จำนวนคน"
                }
            }
    }
    
    func showresetLabel(){
        resetLabel.text = "คัดสรรเสร็จสิ้นแล้วกดปุ่ม  Reset เพื่อเริ่มการทำงานใหม่"
        resetlabelView.backgroundColor = UIColor(red: 0.56, green: 0.16, blue: 0.15, alpha: 1.0)
    }
    func hideresetLabel(){
        resetlabelView.backgroundColor = UIColor.clear
        resetLabel.text = ""
    }
}
