//
//  SplashMain.swift
//  UI-269
//
//  Created by nyannyan0328 on 2021/07/25.
//

import SwiftUI

struct SplashMain: View {
    var body: some View {
        SplasScreen(imageSize:CGSize(width: 200, height: 200)) {
            
            Home()
            
        } titleView: {
            
            Text("Chatty")
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(.primary)
            
        } logoView: {
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            
        } navButton: {
            
            
            Image("pro")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            
            
            
            
        }
        

    }
}

struct SplashMain_Previews: PreviewProvider {
    static var previews: some View {
        SplashMain()
    }
}
