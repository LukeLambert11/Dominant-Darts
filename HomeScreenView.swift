//
//  HomeScreen.swift
//  Dominant Darts
//
//  Created by Luke Lambert on 1/25/23.
//

import SwiftUI

struct HomeScreenView: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray.edgesIgnoringSafeArea(.all)
                //the orange top player who is to throw
                VStack {
                    
                    
                    //name; average; darts thrown
                    HStack{
                        Text("Dominant Darts")
                            .font(.system(size: 50))
                            .foregroundColor(.black)
                        
                    }
                    
                    NavigationLink(destination: SetUpGameView()){
                        Text("new game").font(.system(size: 43))
                            .frame(width: UIScreen.main.bounds.width / 1.7, height:  UIScreen.main.bounds.height / 11)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(18)
                    }
                    

                    
                }.padding()
                
            }
        }
   

        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
