//
//  UserManager.swift
//  Sorting Hat
//
//  Created by Phunsup S. on 14/3/2567 BE.
//

import Foundation

protocol UserManagerDelegate {
    func didUpdateUser(user: UserModel)
}

struct UserManager{
    let userURL = "https://randomuser.me/api/?results="
    var delegate: UserManagerDelegate?
    
    var qForJson = 0
    
    var wantuser:[String] = []
    
    mutating func fetchUser(quality: String){
        let urlString = userURL + quality
        self.qForJson = Int(quality) ?? 0
        performRequest(urlString: urlString)
    }
    //ใช้api
    func performRequest(urlString: String){
        // 1.สร้าง url
        if let url = URL(string: urlString){
            // 2.สร้าง urlsession
            let session = URLSession(configuration: .default)
            // 3.ให้งาน
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                if let responseData = data {
                    // Call the parseJSON method with the received data
                    if let user = self.parseJSON(userData: responseData){
                        delegate?.didUpdateUser(user: user)
                    }
                }
            }
            // 4.start the task
            task.resume()
        }
    }
    
    func parseJSON(userData: Data) -> UserModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(UserData.self, from: userData)
            var wantuser: [String] = [] // Declare wantuser as a local variable
            
            for i in 0..<qForJson {
                wantuser.append(decodedData.results[i].name.first)
            }
            
            let user = UserModel(userName: wantuser)
            return user
        } catch {
            print(error)
            return nil
        }
    }
}
