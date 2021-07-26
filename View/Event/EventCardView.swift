//
//  EventCardView.swift
//  UI-269
//
//  Created by nyannyan0328 on 2021/07/25.
//

import SwiftUI

struct EventCardView: View {
    var events : Event
    @Binding var pinchValue : CGFloat
    var body: some View {
        HStack{
            
            Text(getdate())
                .font(.title3.weight(.semibold))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            
            
            HStack(spacing:20){
                
                Capsule()
                    .fill(events.color)
                    .frame(width: 2)
                
                VStack(alignment:.leading){
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        
                        Text(events.title)
                            .font(.footnote)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                        
                        Text(events.date)
                            .font(.caption)
                    }
                    .frame(height: 80)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(
                    
                        Button(action: {
                        
                    }, label: {
                        
                        Image(systemName: "chevron.right")
                        .font(.title)
                            .padding(.trailing,10)
                    })
                        
                        ,alignment: .trailing
                    )
                    
                    
                    VStack(alignment:.leading,spacing:10){
                        
                        
                        
                        Text("A")
                            .lineLimit(1)
                        
                        Text("A")
                            .lineLimit(1)
                        
                        Text("A")
                            .lineLimit(1)
                        
                        HStack(spacing:-10){
                            
                            
                            ForEach(1...3,id:\.self){index in
                                
                                
                                Image("p\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                    .padding(.leading,5)
                                    .offset(x: -getimageoffset())
                            }
                            
                            
                        
                        }
                        
                        
                        
                    }
                    .frame(height: getMaxSize(), alignment: .top)
                    .opacity(getopa())
                    
                   
                    
                }
                Spacer(minLength: 0)
                
                
                
                
            }
            .padding()
            .frame(height: 100 + getMaxSize())
            .clipped()
            .background(.white,in: RoundedRectangle(cornerRadius: 10))
            
            
        }
        
    }
    
    func getdate()->String{
        
        events.date.replacingOccurrences(of: " ", with: "\n")
    }
    
    func getMaxSize()->CGFloat{
        
        
        let progress = pinchValue * 40
        
        return progress
    }
    
    func getopa()->CGFloat{
        
        let progress = getMaxSize() / 180
        
        return progress
    }
    
    func getimageoffset()->CGFloat{
        
        let progress = getMaxSize() / 180
        
        return progress * 20
    }
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
