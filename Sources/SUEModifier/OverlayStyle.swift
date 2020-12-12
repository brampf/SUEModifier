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


struct OverlayStyle : ViewModifier {
    
    var title : String?
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 1){
            if title != nil {
                Text(title!).bold()
                    .foregroundColor(.gray)
            }
            HStack(alignment: .top){
                content
                    .foregroundColor(.gray)
            }
        }.padding(5)
            .background(Color.white.cornerRadius(10).opacity(0.8))
            .padding()
        
    }
    
}

extension View {

    public func overlayStyle(_ title: String? = nil) -> some View {
        return self.modifier(OverlayStyle(title: title))
    }
    
}


#if DEBUG
struct OverlayStyle_Previews: PreviewProvider {
    
    class Demo : ObservableObject {
        @Published var test: String = "Hello World"
    }
    
    @State static var hidden : Bool? = true
    
    static var previews: some View {
        Group{
            Rectangle().foregroundColor(.gray)
                .overlay(Text("Bonjour!").overlayStyle())
            Rectangle().foregroundColor(.gray)
                .overlay(Text("Bonjour!").overlayStyle("Français"))
        }
    }
}
#endif
