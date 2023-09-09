/// Copyright (c) 2023 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ContentView: View {
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)
  
  var body: some View {
    
    VStack(spacing: 16) {
      Text("Color Picker")
        .font(.largeTitle)
        .bold()

      RoundedRectangle(cornerRadius: 0)
        .foregroundColor(foregroundColor)
        .border(Color.gray.opacity(0.5), width: 10)
      
      SliderView(title: "Red", value: $redColor)
        .tint(.red)
      SliderView(title: "Green", value: $greenColor)
        .tint(.green)
      SliderView(title: "Blue", value: $blueColor)
        .tint(.blue)
  
      SetColorButton(redColor: redColor, greenColor: greenColor, blueColor: blueColor, foregroundColor: $foregroundColor)
    }
    .padding(24)
    
  }
}

struct SliderView: View {
  var title: String
  @Binding var value: Double
  
  var body: some View {
    VStack {
      Text(title)
        .font(.title3)
      HStack {
        Slider(value: $value, in: 0...255)
        Text(String(Int(value.rounded())))
          .bold()
      }
    }
  }
}

struct SetColorButton: View {
  var redColor: Double
  var greenColor: Double
  var blueColor: Double
  @Binding var foregroundColor: Color
  
  var body: some View {
    Button("Set Color") {
      foregroundColor = Color(red: redColor / 255, green: greenColor / 255, blue: blueColor / 255)
    }
    .font(.headline)
    .bold()
    .foregroundColor(Color.white)
    .frame(height: 24)
    .padding()
    .background(Color.blue)
    .cornerRadius(16.0)
    .overlay(
      RoundedRectangle(cornerRadius: 16.0)
        .stroke(Color.white, lineWidth: 2)
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
      .previewDisplayName("Dark")
  }
}
