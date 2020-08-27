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

struct ObservingOverlay<O: ObservableObject, C: CustomDebugStringConvertible> : ViewModifier {
    
    @ObservedObject var observed : O
    let keyPath : KeyPath<O, C>
    var alignment : Alignment = .center
    
    func body(content: Content) -> some View {
        content.overlay(Text(self.observed[keyPath : keyPath].debugDescription).overlayStyle(), alignment: alignment)
    }
}



extension View {
    
    public func overlay<O: ObservableObject, C: CustomDebugStringConvertible>(_ observed : O, keyPath: KeyPath<O,C>, _ alignment: Alignment = .center) -> some View {
        
        return self.modifier(ObservingOverlay(observed: observed, keyPath: keyPath, alignment: alignment))
    }
}


#if DEBUG
struct OverlayModifier_Previews: PreviewProvider {
    
    class Demo : ObservableObject {
        @Published var test: String = "Hello World"
    }
    
    @State static var hidden : Bool? = true
    
    static var previews: some View {
        Group{
            Rectangle().foregroundColor(.gray)
                .overlay(Demo(), keyPath: \Demo.test)
        }
    }
}
#endif
