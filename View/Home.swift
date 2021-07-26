//
//  Home.swift
//  UI-269
//
//  Created by nyannyan0328 on 2021/07/25.
//

import SwiftUI

struct Home: View {
    @State var selected = "Home"
    @Namespace var animation
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack{
            
            
            HStack(spacing:0){
                
                
                ForEach(["Home","Animation","Drag"],id:\.self){index in
                    
                    
                    TabButton(title: index, selected: $selected, animation: animation)
                    
                    
                    
                }
                
                
                
                
                
                
            }
            .padding(.top,10)
            
            
            switch selected{
                
                
                
            case "Home" : ScrollMain()
                
            case "Animation" :
                
                
             
                    
                 
                    
                 EventMain()
                       
                   
                  
                
                
           
            case "Drag" : LottieLogin()
                
            default : Text("")
            }
          
            
            
        }
        .background(.quaternary)
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TabButton : View{
    
    var title : String
    @Binding var selected : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button {
            
            withAnimation{
                
                selected = title
            }
            
        } label: {
            
            VStack{
                
                Text(title)
                    .font(.footnote.bold())
                    .foregroundColor(.secondary)
                
                ZStack{
                    
                    
                    if selected == title{
                        
                        
                        Capsule()
                            .fill(.green)
                            .frame(height: 3.8)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                    
                    else{
                        
                        Capsule()
                            .fill(.clear)
                            .frame(height: 3.8)
                        
                        
                        
                    }
                }
            }
            .frame(maxWidth: .infinity)
            
        }
        
        
        
    }
}


struct ScrollMain : View{
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            
            
            VStack(spacing:15){
                
                
                ForEach(1...6,id:\.self){index in
                    
                    
                    
                    Image("p\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .cornerRadius(15)
                }
                
                
                
                
                
            }
            .padding(15)
            
            
        }
        
        
        
    }
}
