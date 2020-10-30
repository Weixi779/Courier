//
//  UserItems.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/22.
//

import Foundation

class UserItems: ObservableObject {
    @Published var MyUser: User
    
    init(){
        self.MyUser = User.init(accounts: "123", password: "123", username: "123")
    }
}
