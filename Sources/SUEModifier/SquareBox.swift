/*
 
 Copyright (c) <2020>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
 */

import SwiftUI

struct BoxedView : View {

    @Binding var content : CGImage
    
    init(_ image: Binding<CGImage>){
        self._content = image
    }
    
    var aspectRatio : Ratio {

        let ratio = CGFloat(content.width) / CGFloat(content.height)
        
        switch ratio {
        case let x where x == 1:
            return .square
        case let x where x < 1:
            return .landscape
        case let x where x > 1:
            return .portrait
        default:
            return .square
        }
    }
    
    var body: some View {
        
            VStack(spacing: 0){
                if self.aspectRatio == .landscape{
                    Spacer()
                }
                HStack(spacing: 0){
                    if self.aspectRatio == .portrait {
                        Spacer()
                    }
                    Image(decorative: content, scale: 1)
                        .resizable()
                    if self.aspectRatio == .portrait {
                        Spacer()
                    }
                }
                if self.aspectRatio == .landscape{
                    Spacer()
                }
            }.aspectRatio(1, contentMode: .fit)
    }
}

enum Ratio : Int {
    case landscape
    case square
    case portrait
}


#if DEBUG
struct Boxed_Previews: PreviewProvider {

    static var previews: some View {
        Group{
            Image(systemName: "rectangle").frame(width: 100, height: 50).box()
            Image(systemName: "rectangle.portrait").box()
            Image(systemName: "sqare").box()
        }
    }
}
#endif
