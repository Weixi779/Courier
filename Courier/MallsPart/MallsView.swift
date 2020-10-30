//
//  MallsView.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/5.
//

import SwiftUI

struct MallsView: View {
    let backGroundColor:Color = Color(red: 87/255, green: 255/255, blue: 37/255)

    @State var test: String = ""
    var body: some View {
        VStack {
            VStack{
                VStack{
                    backGroundColor
                    }
                    .frame(height: 50)
                    .edgesIgnoringSafeArea(.top)
                HStack{
                    HStack{
                        Image("search_icon")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        TextField("查找商品", text: $test)
                        .font(Font.system(size: 14))
                        .foregroundColor(Color.gray)
                        Spacer()
                        }
                        .background(
                            Color.white
                            .cornerRadius(5)
                        )
                        .frame(height: 50)
                    Image("scan_icon")
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                }
                .padding(.leading, 20)
                .background(backGroundColor)
                .padding(.top, -56)
            }
            Spacer()
        }
        
    }
}

struct MallsView_Previews: PreviewProvider {
    static var previews: some View {
        MallsView()
    }
}
