//
//  TabView.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/5.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var couriers = CourierItems()
    @ObservedObject var user = UserItems()


    var body: some View {
            TabView {
                CourierView(items: self.couriers).tabItem {
                    Image(systemName: "cube.box")
                    Text("快递")
                }.tag(1)
                MallsView().tabItem {
                    Image(systemName: "cart")
                    Text("商城")
                }.tag(2)
                UserView(items: self.user).tabItem {
                    Image(systemName: "person")
                    Text("用户")
                }.tag(3)
            
        }
        
    }
    
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
