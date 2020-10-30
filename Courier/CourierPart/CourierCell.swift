//
//  CourierCell.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/8.
//

import SwiftUI

struct CourierCell: View {
    @ObservedObject var items:CourierItems
    
    @State var isShowing = false
    
    var body: some View {
        VStack {
            List{
                ForEach(items.couriers){ courier in
                    HStack{
                        VStack{
                            Text(courier.CourierCompany)
                                .bold()
                                .padding(.top, 4)
                            Text(courier.PickCode)
                                .foregroundColor(Color.gray)
                                .padding(.bottom, 8)
                        }
                        .padding(.leading,10)
                        
                        Spacer()
                        Text(courier.CellDate)
                            .foregroundColor(Color.gray)
                        
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 15)
                    .onTapGesture{
                        isShowing.toggle()
                    }
                    .popover(isPresented: $isShowing){
                        DetailCell(item: courier)
                    }
                }
                .onDelete(perform: removeItems)
                .background(Color.white)
            }
    }
        
}
    func removeItems(at offsets: IndexSet){
        items.couriers.remove(atOffsets: offsets)
    }
}

struct CourierCell_Previews: PreviewProvider {
    static var previews: some View {
        CourierCell(items: CourierItems())
    }
}
