//
//  TextInputComponentView.swift
//  frontend
//
//  Created by Ivan Frolov on 03.12.2024.
//

import SwiftUI

struct TextInputComponentView: View {
    
    var iconName: String
    var title: String
    @Binding var value: String
    
    var body: some View {
        HStack {
            Image(iconName)
            if title == "Password" {
                SecureField("\(title)", text: $value)
                    .font(.custom("Inter-Regular_Bold", size: 14))
                    .foregroundColor(.black)
            }
            else {
                TextField("\(title)", text: $value)
                    .font(.custom("Inter-Regular_Bold", size: 14))
                    .foregroundColor(.black)
            }
            
                
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .frame(height: 40, alignment: .center)
        .frame(maxWidth: .infinity)
        .border(Color("nonActiveColor"), width: 2)
        .cornerRadius(8)
        .padding(.horizontal, 40)
    }
}

struct TextInputComponentView_Previews: PreviewProvider {
    @State static var value = ""
    
    static var previews: some View {
        TextInputComponentView(iconName: "userIcon", title: "Username", value: $value)
            .previewLayout(.sizeThatFits)
    }
}
