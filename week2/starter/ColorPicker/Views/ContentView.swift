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
  @State private var redColor = Constants.General.initialRed
  @State private var greenColor = Constants.General.initialGreen
  @State private var blueColor = Constants.General.initialBlue
  @State private var foregroundColor = Color(
    red: Constants.General.initialRed / 255,
    green: Constants.General.initialGreen / 255,
    blue: Constants.General.initialBlue / 255
  )
  @Environment (\.verticalSizeClass) private var verticalSizeClass
  
  var body: some View {
    if verticalSizeClass == .compact {
      HStack(spacing: Constants.Spacing.regular) {
        InnerContentView(
          redColorValue: $redColor,
          greenColorValue: $greenColor,
          blueColorValue: $blueColor,
          foregroundColor: $foregroundColor
        )
      }
      .padding(Constants.Spacing.large)
    } else {
      VStack(spacing: Constants.Spacing.regular) {
        InnerContentView(
          redColorValue: $redColor,
          greenColorValue: $greenColor,
          blueColorValue: $blueColor,
          foregroundColor: $foregroundColor
        )
      }
      .padding(Constants.Spacing.large)
    }
  }
}

private struct InnerContentView: View {
  @Binding var redColorValue: Double
  @Binding var greenColorValue: Double
  @Binding var blueColorValue: Double
  @Binding var foregroundColor: Color
  
  var body: some View {
    VStack {
      TitleView(title: "Color Picker")
      
      ColorDisplayView(color: foregroundColor)
    }
    VStack {
      SliderView(title: "Red", value: $redColorValue)
        .tint(.red)
      SliderView(title: "Green", value: $greenColorValue)
        .tint(.green)
      SliderView(title: "Blue", value: $blueColorValue)
        .tint(.blue)
      
      SetColorButton(
        redColor: redColorValue,
        greenColor: greenColorValue,
        blueColor: blueColorValue,
        foregroundColor: $foregroundColor
      )
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDisplayName("Portrait")
    ContentView()
      .preferredColorScheme(.dark)
      .previewDisplayName("Dark")
    ContentView()
      .previewInterfaceOrientation(.landscapeLeft)
      .previewDisplayName("Landscape")
  }
}
