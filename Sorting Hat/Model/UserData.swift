//
//  UserData.swift
//  Sorting Hat
//
//  Created by Phunsup S. on 14/3/2567 BE.
//

import Foundation

struct UserData: Decodable{
    let results:[results]
}

struct name:Decodable{
    let first: String
}

struct results:Decodable{
    let name: name
}
