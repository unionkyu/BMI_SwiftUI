//
//  ContentView.swift
//  BMI_SwiftUI
//
//  Created by hyunkyu yoon on 2023/08/29.
//

import SwiftUI

struct ContentView: View {
  
  @State private var height : Float = 150.0
  @State private var weight : Float = 80.0
  
    var body: some View {
      ZStack {
        
        Image("calculate_background")
          .resizable()
          .edgesIgnoringSafeArea(.all)
         
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 4) {
              Text("CALCULATE")
              Text("YOUR BMI")
            }
            .font(.system(size: 40, weight: .bold, design: .default))
            .foregroundColor(Color("dark_gray"))
            .padding(.trailing, 110)
            
            Spacer()
            
          SliderView(value: $height, label: "Height", minValue: 100, maxValue: 200, unit: "Cm")
          SliderView(value: $weight, label: "Weight", minValue: 0, maxValue: 160, unit: "Kg")
          
          
          Button {
            // BMI 계산 및 결과페이지 전달
          } label: {
            Text("CALCULATE")
              .font(.title)
              .fontWeight(.bold)
              .foregroundColor(.white)
              .padding(.horizontal, 100)
              .padding(.vertical, 10)
              .background(Color("deep_purple"))
              .cornerRadius(15)
          }
          .padding()
         

            
        }
      }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
