//
//  ContentView.swift
//  Shared
//
//  Created by Hamza Oban on 24.03.2022.
//
import SwiftUI

struct ContentView: View {
    @State var fahrenheitvalue:String="212"
    @State var IsVisible = false
    let numberFormatter:NumberFormatter={
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumIntegerDigits = 0
        numberFormatter.maximumIntegerDigits = 2
        return numberFormatter
    }()
    
    func convertToCelsius()-> String{
        
        if let value = Double(fahrenheitvalue){
            
            let fahrenheit = Measurement<UnitTemperature>(value: value,unit: .fahrenheit)
            let celsiusValue = fahrenheit.converted(to : .celsius)
            return numberFormatter.string(from:NSNumber(value: celsiusValue.value)) ??
                "???"
        }
        else{
            return "???"
        }
        
        
    }
    
    var body: some View {
        VStack{
            TextField("CONVERSION_TEXT_FIELD_PLACEHOLDER",text: $fahrenheitvalue).font(Font.system(size: 64))
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
            Text("CONVERSION_FAHRENHEIT")
            Text("CONVERSION_IS_ACTUALLY").foregroundColor(.gray)
            Text(convertToCelsius())
                .font(Font.system(size: 64)
)
            Text("CONVERSION_DEGREES_CELCIUS")
            Spacer()
        }.font(.title)
            .opacity(IsVisible ? 1.0 : 0.0)
            .offset(x: 0, y: IsVisible ? 0 : 20)
            .animation(.easeIn(duration: 4.0))
            .foregroundColor(.orange)
            
            .onAppear{
                self.IsVisible = true
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
