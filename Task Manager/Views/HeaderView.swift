//
//  HeaderView.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 12/05/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let color: Color
    let angle: Double
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: angle))
                
                VStack{
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .bold()
                    
                    Text(subTitle)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }.padding(.top, 40)
            }
            .frame(width: UIScreen.main.bounds.width * 4,
                   height: 400)
            .offset(y: -100)
            
            Spacer()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Task Manager", subTitle: "Get things done", color: .pink, angle: 15)
    }
}
