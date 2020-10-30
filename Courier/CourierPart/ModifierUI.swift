//
//  ModifierUI.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/5.
//

import SwiftUI

struct Cilp:ViewModifier{
    
    let LineWidth: CGFloat = 4
    let CornerRadius: CGFloat = 20
    
    func body(content :Content) -> some View{
        content
            //剪切方法
            .overlay(RoundedRectangle(cornerRadius: CornerRadius).stroke(Color.green,lineWidth: LineWidth))
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius))
            .padding()

        //  .background(RoundedRectangle(cornerRadius: 20).stroke(Color.orange,lineWidth: 3))

    }
}

struct FontDesign:ViewModifier {
    func body(content: Content) -> some View {
        content
            .accentColor(Color.orange)
            .font(.system(.body, design: .rounded))
            .foregroundColor(.white)
            .keyboardType(.decimalPad)
    }
}

extension View{
    
    func fontDesign() -> some View {
        self.modifier(FontDesign())
    }
    
    func cilp() -> some View {
        self.modifier(Cilp())
    }
}
