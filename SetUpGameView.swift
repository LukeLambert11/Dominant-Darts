//
//  SetUpGame.swift
//  Dominant Darts
//
//  Created by Luke Lambert on 1/25/23.
//

import SwiftUI

struct SetUpGameView: View {
    
    var body: some View {
        
       ZStack{
            Color.gray.edgesIgnoringSafeArea(.all)
            //the orange top player who is to throw
            VStack {
                
                HStack{
                    NavigationLink(destination: HomeScreenView()){
                        Text("H").font(.system(size: 43))
                            .frame(width: UIScreen.main.bounds.width / 6, height:  UIScreen.main.bounds.height / 13)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(18)
                    }
                    Spacer()
                }.offset(y: UIScreen.main.bounds.height / -3.5)
                
                //name; average; darts thrown
                HStack{
                    Text("Set Up Game")
                        .font(.system(size: 50))
                        .foregroundColor(.black)
                    
                }
                NavigationLink(destination: GameView()){
                    Text("game on").font(.system(size: 43))
                        .frame(width: UIScreen.main.bounds.width / 1.7, height:  UIScreen.main.bounds.height / 11)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(18)
                }

                
            }.padding()
            
        }
        
       .navigationBarBackButtonHidden(true)
       .navigationBarHidden(true)

    }
}


struct SetUpGame_Previews: PreviewProvider {
    static var previews: some View {
        SetUpGameView()
    }
}
