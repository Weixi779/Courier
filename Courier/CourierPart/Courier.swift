//
//  Courier.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/5.
//

import Foundation

struct Courier: Codable, Identifiable {
    let id = UUID()
    var CourierCompany: String
    
    var PickDate: Date
    var PickCode: String
    
    var CellDate: String
}
