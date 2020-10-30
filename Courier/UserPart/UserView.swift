//
//  UserView.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/5.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var items:UserItems
    
    let backGroundColor:Color = Color(red: 87/255, green: 255/255, blue: 37/255)
    
    let settingName1 = ["我的圈子","我的收藏","我的通知","帮助与反馈"]
    let settingName2 = ["版本更新","即刻合伙人"]
    
    var body: some View {
        VStack{
            VStack{
                backGroundColor
            }
            .frame(height: 50)
            .edgesIgnoringSafeArea(.top)
            VStack{
                HStack{
                    Spacer()
                    Image("setting_icon")
                    .padding(.horizontal, 15)
                    .padding(.vertical, 15)
                }
                Spacer()
            }
            .frame(height: 100)
            .background(backGroundColor)
            .padding(.top, -70)
            
            VStack{
                HStack(alignment: .center){
                    CircleImage(imgName:"avatar")
                    .padding(.horizontal, 15)
                    VStack(alignment: .leading){
                        Text("User_Name")
                        HStack{
                            Image("coins")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("99999")
                        }
                    }
                    .padding(.horizontal, -10)
                    Spacer()
                }
                .frame(height: 100)
                .background(Color.white
                    .cornerRadius(10, antialiased: true))
                .shadow(radius: 5)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                
                VStack {
                    List{
                        ForEach(settingName1, id:\.self){ name in
                            NavigationLink(destination: SwiftUIView()){
                                Text("\(name)")
                                    .foregroundColor(.black)
                            }
                        }
                        HStack{
                            Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255)
                        }
                        .padding(.horizontal,-20)
                        .padding(.top,-10)
                        .padding(.bottom,-10)
                        ForEach(settingName2, id:\.self){ name in
                            NavigationLink(destination: SwiftUIView()){
                                Text("\(name)")
                            }
                        }
                    
                    }
                    
                }

                }
                .padding(.top, -60)
        }
        //.edgesIgnoringSafeArea(.top)
        .background(Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255))
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(items: UserItems())
    }
}
