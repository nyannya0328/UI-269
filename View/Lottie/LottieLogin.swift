//
//  LottieLogin.swift
//  UI-269
//
//  Created by nyannyan0328 on 2021/07/25.
//

import SwiftUI
import Lottie

struct LottieLogin: View {
    @State var show = false
    @State var phnor = ""
    var body: some View {
        VStack{
            
            
              
            AnimationLottieView(show: $show)
            .scaleEffect(0.6)
               // .background(Color("c1"))
                .frame(height: UIScreen.main.bounds.height / 3)
                .padding(.bottom,70)
            
            HStack{
                
                VStack{
                    
                    
                    Text("**Login Enter your PhNo**")
                        .font(.title)
                        .foregroundColor(.blue)
                    
                    
                    HStack{
                        
                        
                        Text("+1")
                            .font(.title2.italic())
                        
                        TextField("", text: $phnor)
                            .font(.system(size: 20, weight: .light))
                        
                    }
                    Divider()
                        .background(.orange)
                    
                    
                    Button {
                        
                    } label: {
                        Text("Verify ph No")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(.cyan,in: Capsule())
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                        
                    }
                    
                    
                    HStack{
                        
                        
                        Rectangle()
                            .stroke(.orange,lineWidth: 5)
                            .frame(height: 1)
                        
                        Text("IN")
                        
                        Rectangle()
                            .stroke(.green,lineWidth: 5)
                            .frame(height: 1)
                    }
                    
                    
                    
                    
                    HStack {
                        HStack{
                            
                            
                            Button {
                                
                            } label: {
                                Image("google-symbol")
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 30, height: 30)
                                
                                Text("With Google")
                                    .font(.footnote.bold())
                                    .foregroundColor(.white)
                                
                            }

                            
                            
                            
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                    .background(.green,in: RoundedRectangle(cornerRadius: 15))
                        
                        
                        
                        HStack{
                            
                            
                            Button {
                                
                            } label: {
                                Image("email")
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 30, height: 30)
                                
                                Text("With Email")
                                    .font(.callout)
                                    .foregroundColor(.white)
                                    
                                
                            }

                            
                            
                            
                        }
                       
                        .padding(.vertical,10)
                        .padding(.horizontal,20)
                        .frame(maxWidth: .infinity)
                    .background(.green,in: RoundedRectangle(cornerRadius: 15))
                    }
                    
                 
                    

                    
                    
                    
                    
                    
                    
                    
                    
                }
                .padding()
                .background(.ultraThickMaterial,in: RoundedRectangle(cornerRadius: 10))
                .padding()
               // .frame(height: show ? nil : 0)
             .opacity(show ? 1 : 0)
              
            }
            
            
        }
       
      
        
    }
}

struct LottieLogin_Previews: PreviewProvider {
    static var previews: some View {
        LottieLogin()
    }
}

struct AnimationLottieView : UIViewRepresentable{
    
    
    let animation = AnimationView(name: "43905-emailing-laptop", bundle: .main)
    
    @Binding var show : Bool
    
func makeUIView(context: Context) -> AnimationView {
    
    animation.play { statas in
        if statas{
            
            withAnimation(.interpolatingSpring(mass: 0.5, stiffness: 0.6, damping: 0.7, initialVelocity: 1)){
                
                show.toggle()
            }
        }
    }
    
    return animation
    
    
           }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
    }
}
