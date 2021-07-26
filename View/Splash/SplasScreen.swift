//
//  SplasScreen.swift
//  UI-269
//
//  Created by nyannyan0328 on 2021/07/25.
//

import SwiftUI

var colors : [Color] = [.red,.blue,.orange,Color("c1")]

struct SplasScreen<Content : View,TitleView : View,LogoView : View,NavButton : View>: View {
    
    var content : Content
    var titleView : TitleView
    var logoView : LogoView
    var imageSize : CGSize
    
    var navButton : NavButton
    
    init(imageSize : CGSize,@ViewBuilder content : @escaping()->Content,@ViewBuilder titleView : @escaping()->TitleView,@ViewBuilder logoView : @escaping()->LogoView,@ViewBuilder navButton : @escaping()->NavButton){
        
        
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
        self.imageSize = imageSize
        self.navButton = navButton()
    }
    
    @State var titleAnimation = false
    @State var endAnimation = false
    
    @State var showNaV = false
    
    
    
    
    
    @Namespace var animation
    var body: some View {
        VStack(spacing:0){
            
            
            ZStack{
                colors.randomElement()
                
                    .background(Color("c1"))
                    .overlay(
                    
                        ZStack{
                        
                        titleView
                            .scaleEffect(endAnimation ? 0.5 : 1)
                            .offset(y: titleAnimation ? 0 : 110)
                        
                        if !endAnimation{
                            
                            logoView
                                .matchedGeometryEffect(id: "LOGO", in: animation)
                                .frame(width: imageSize.width, height: imageSize.height)
                        }
                        
                        
                        
                    }
                    
                    )
                    .overlay(
                        
                        
                        HStack{
                            
                            navButton
                                .opacity(showNaV ? 1 : 0)
                                .padding(.leading,20)
                            
                            
                            Spacer()
                            
                            
                            if endAnimation{
                                
                                logoView
                                    .matchedGeometryEffect(id: "LOGO", in: animation)
                                    .frame(width: 50, height: 50)
                            }
                        }
                        .padding(.bottom)
                        
                    
                    
                    
                    
                    )
                    
                
                
             
                
                
                  
               
                
                
                
                
                
                
                
                  
                
            }
            .frame(height: endAnimation ? 60 : nil)
            .zIndex(1)
            content
                .frame(height: endAnimation ? nil : 0)
                .zIndex(0)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                withAnimation(.spring()){
                    
                    titleAnimation.toggle()
                    
                }
                
                
               
                    
                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 1, blendDuration: 1)){
                    
                    endAnimation.toggle()
                    
                }
                
                withAnimation{
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                        
                        
                        withAnimation{
                            
                            showNaV.toggle()
                        }
                    }
                }
                
                
            }
        }
    }
    
}

struct SplasScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
