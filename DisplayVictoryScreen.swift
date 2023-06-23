//
//  DisplayVictoryScreen.swift
//  Dominant Darts
//
//  Created by Luke Lambert on 1/25/23.
//

import Foundation
import SwiftUI


struct DisplayVictoryScreen: View{
    
    @Binding var numberOfDartsSelected: Int
    @Binding var victoryScreen: Bool
    @Binding var turnScore: Int
    
    var body: some View{
        
        NavigationView{
            ZStack{
                scoreDisplayThrower.color
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Text(scoreDisplayThrower.name + " Wins the Leg")
                    .font(.system(size: 70))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    Text("Darts in Leg " + String(currThrower.getCurrLegDartsThrown()))
                    .font(.system(size: 45))
                    .foregroundColor(Color.white)
                    Text("Average " + String(currThrower.getLegAverage()))
                    .font(.system(size: 45))
                    .foregroundColor(Color.white)
                    
                    NavigationLink(destination: GameView()){
                        Text("new game").font(.system(size: 43))
                            .frame(width: UIScreen.main.bounds.width / 1.7, height:  UIScreen.main.bounds.height / 11)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(18)
                    }
                    
                    Button( action: {
                     
                        currThrower.undo(dartsThrownInTurn: numberOfDartsSelected)
                        victoryScreen = false
                        
                    }) {
                        Text("Undo")
                            .font(.system(size: 43))
                            .frame(width: buttonWidth() * 1.75, height: buttonWidth())
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(18)
                    }


                }
                
                

            }
        }
        

        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
}
