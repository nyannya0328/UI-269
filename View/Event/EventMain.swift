//
//  EventMain.swift
//  UI-269
//
//  Created by nyannyan0328 on 2021/07/25.
//

import SwiftUI

struct EventMain: View {
    @State var pincValue : CGFloat = 0
    @State var lastPinch : CGFloat = 0
    
    @GestureState var startPinch : Bool = true
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing:15){
                
                
                ForEach(events){event in
                    
                    EventCardView(events: event, pinchValue: $pincValue)
                    
                    
                    
                }
            }
            .padding([.vertical,.leading])
        }
        .gesture(
        
            MagnificationGesture().updating($startPinch, body: { value, out, _ in
            
            
            out = true
        })
                .onChanged({ value in
            
           
            
            let delta = lastPinch + ((value - 1) > 0 ? (value - 1) : (value - 1) * 4.5)
            
            var absolute = delta > 0 ? delta : 0
            absolute = absolute  < 4.5 ? absolute : 4.5
            
            
            
            self.pincValue = absolute
            
        })
                .onEnded({ value in
            
            withAnimation(.easeInOut){
                
                
                if pincValue > 2.0{
                    
                    pincValue = 4.5
                    lastPinch = 4.5
                }
                
                else{
                    
                    pincValue = 0
                    lastPinch = 0
                    
                    
                }
            }
            
        })
        
        
        
        )
        
        
        
        .safeAreaInset(edge: .top, content: {
            
            HStack{
                
                Text("Events")
                    .font(.largeTitle.bold())
                
                Spacer(minLength: 0)
                
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.secondary)
                }

                
                
                
            }
            .padding()
            
            
        })
        .background(.ultraThickMaterial)
        
    }
}

struct EventMain_Previews: PreviewProvider {
    static var previews: some View {
        EventMain()
    }
}
