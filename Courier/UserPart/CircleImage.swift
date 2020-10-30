//
//  CircleImage.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/23.
//

import SwiftUI

struct CircleImage: View {
    var imgName:String
    var body: some View {
        Image(imgName)
            .resizable()
            .frame(width: 75, height: 75)
            .clipShape(Circle())
            .overlay(
                
                Circle().stroke(Color.white, lineWidth: 1))
            
            .shadow(radius: 3)
    }
}

struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage(imgName:"avatar")
    }
}
