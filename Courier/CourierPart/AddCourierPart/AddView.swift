//
//  AddView.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/5.
//

import SwiftUI

struct AddView: View {
    @State var company = ""
    @State var date = Date()
    @State var code = ""
    @State var time = Date()
    @State var showingAlert = false
    
    @ObservedObject var courierItems: CourierItems
    @Environment(\.presentationMode) var presentationMode

    static let SectionCourierCompany = ["中通","顺风","圆通","邮政","韵达","申通"]
    var body: some View {
        NavigationView{
            Form{
                Picker("快递公司" , selection: $company){
                    ForEach(Self.SectionCourierCompany,id:\.self){
                        Text($0)
                    }
                }
                
                TextField("取货码", text: $code)
                    .keyboardType(.numbersAndPunctuation)

                
                DatePicker("取件日期", selection: $time)
                
            }
            .navigationBarTitle("来拿快递啦")
            .navigationBarItems(trailing: Button("保存"){
                self.showingAlert = IsEmpty()
                if(showingAlert == false){
                    let courier = Courier(CourierCompany: self.company, PickDate: self.date, PickCode: self.code ,CellDate: dateConverted(self.date))
                    self.courierItems.couriers.append(courier)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("信息确认"), message: Text("请填写具体数据"), dismissButton: .default(Text("好的")))
            }
            
        }
    }
    func IsEmpty() -> Bool {
        if company == "" || code == "" {
            return true
        }
        return false
    }
}
func dateConverted(_ date:Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd HH:mm"
    let convertedDate = dateFormatter.string(from: date)
    return convertedDate
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(courierItems: CourierItems())
    }
}



