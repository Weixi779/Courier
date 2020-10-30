//
//  ContentView.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/5.
//

import SwiftUI
import SwiftUIPager

struct CourierView: View {
    @State private var showAddView = false
    
    @ObservedObject var items:CourierItems
        
    let backGroundColor:Color = Color(red: 87/255, green: 255/255, blue: 37/255)
//    LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .top, endPoint: .bottom)

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
                    Button(action: { showAddView.toggle() } ) {
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                    }
                    .padding(.vertical,15)
                    .padding(.horizontal,15)
                    .sheet(isPresented: $showAddView) {
                        AddView(courierItems: self.items)
                    }
                    
                }
                Spacer()
            }
            .frame(height: 70)
            .background(backGroundColor)
            .padding(.top, -70)
            
            VStack{
                TabViewDemo()
                    .cilp().shadow(radius: 20)
                    .padding(.horizontal,15)
                    .padding(.vertical,15)
                VStack{
                    CourierCell(items: self.items)
                }
                Spacer()
            }
            .padding(.top,-60)
        }
    }

}
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourierView(items: CourierItems())
    }
}


struct TabViewDemo: View {
    
    var images = ["guanggao_1","guanggao_2","guanggao_3","guanggao_4"]

    var body: some View {
        TabView{
            ForEach(images , id: \.self){ image in
                Image("\(image)")
                    .resizable()
                    .frame(height: 150)
                    .clipped()
            }
        }
        .tabViewStyle(PageTabViewStyle())
            .frame(height: 150, alignment: .topLeading)
    }
}
