//
//  Couriers.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/5.
//

import Foundation

class CourierItems: ObservableObject{
    @Published var couriers: [Courier]{
        didSet{
            let encoder = JSONEncoder()
            if let encoder = try? encoder.encode(couriers) {
                UserDefaults.standard.set(encoder, forKey: "Courier")  //一旦改变 使用编码器
            }
        }
    }
    
    init() {
        if let courier = UserDefaults.standard.data(forKey: "Courier"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Courier].self, from: courier){
                self.couriers = decoded
                return
            }
        }
        self.couriers = [Courier].init()
    }
    
}
