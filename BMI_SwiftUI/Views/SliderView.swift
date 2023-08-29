//
//  Progress.swift
//  BMI_SwiftUI
//
//  Created by hyunkyu yoon on 2023/08/29.
//

import SwiftUI

struct SliderView: View {
  
  @Binding var value: Float
  var label: String
  var minValue: Float
  var maxValue: Float
  var unit: String
  
  var body: some View {
    VStack(spacing: 30) {
      
      HStack {
        Text(label)
          .font(.system(size: 15, weight: .medium, design: .none))
        Spacer()
        Text("\(String(format: "%.1f", value )) \(unit)")
          .font(.system(size: 15, weight: .medium, design: .none))
      }
      
      CustomSlider(value: $value, minValue: minValue, maxValue: maxValue)
              .frame(width: 370)
      
    }
    .padding()
  }
}


struct CustomSlider: UIViewRepresentable {
  @Binding var value: Float
  let minValue : Float
  let maxValue : Float
  
  func makeUIView(context: Context) -> UISlider {
    let slider = UISlider(frame: .zero)
    slider.thumbTintColor = UIColor(named: "deep_purple")?.withAlphaComponent(0.5)
      // 핸들 색상 설정
    slider.minimumValue = minValue // 최소값 설정
    slider.maximumValue = maxValue // 최대값 설정
    slider.minimumTrackTintColor = UIColor(named: "light_purple")
    slider.maximumTrackTintColor = UIColor.gray
    slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
    return slider
  }
  
  func updateUIView(_ uiView: UISlider, context: Context) {
    uiView.value = value
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: NSObject {
    var parent: CustomSlider
    
    init(_ parent: CustomSlider) {
      self.parent = parent
    }
    
    @objc func valueChanged(_ sender: UISlider) {
      parent.value = sender.value
    }
  }
}


struct SliderView_Previews: PreviewProvider {
  static var previews: some View {
    SliderView(value: .constant(150.0), label: "Height", minValue: 100, maxValue: 200, unit: "Cm")
  }
}
