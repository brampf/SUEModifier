//
//  SwiftUIView.swift
//  
//
//  Created by May on 27.08.20.
//

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
