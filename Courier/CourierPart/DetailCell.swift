//
//  DetailCell.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/23.
//

import SwiftUI
import MapKit
struct DetailCell: View {
    
    @Environment(\.presentationMode) var presentationMode

    @State var region = MKCoordinateRegion(center: .init(latitude: 39.084019, longitude: 117.708599), latitudinalMeters: 10000, longitudinalMeters: 10000)
    var item: Courier

    var body: some View {
        
        NavigationView {
            VStack{
                Map(coordinateRegion: self.$region)
                    .frame(height:200)
                    .padding(.top)
                VStack{
                    HStack{
                        Text("收件人:" + "User_name")
                        Spacer()
                        Text("收件地址:" + "point")
                    }
                    .padding()
                    HStack{
                        Text("取件码:" + "\(item.PickCode)")
                        Spacer()
                        Text("快递单号:" + "xxx")
                    }
                    .padding()
                    HStack{
                        Text("快递公司:" + "\(item.CourierCompany)")
                        Spacer()
                        Text("预约时间:" + "\(item.CellDate)")
                    }
                    .padding()
                    HStack{
                        Text("负责人名称:" + "xxx")
                        Spacer()
                        Text("负责人电话:" + "xxx")
                    }
                    .padding()
                    Spacer()
                }
            }
            .navigationBarItems(trailing: Button("返回"){
                self.presentationMode.wrappedValue.dismiss()
            })
        }
        
        
    }
}

struct DetailCell_Previews: PreviewProvider {
    static var previews: some View {
        DetailCell(item: CourierItems().couriers[0])
    }
}
