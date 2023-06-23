//
//  NumberOfDartsToFinishView.swift
//  Dominant Darts
//
//  Created by Luke Lambert on 1/25/23.
//

import Foundation
import SwiftUI


struct PopUpView: View {
    
    let buttons: [dartsToFinishButtons] = [
        .one, .two, .three
    ]
    
    
    @Binding var minNumberOfDarts: Int
    @Binding var numberOfDartsSelected: Int
    @Binding var askForNumberOfDarts: Bool
    @Binding var victoryScreen: Bool
    @Binding var turnScore: Int
    @Binding var display: Int
    
    var body: some View{
        
        ZStack{
            Color.red.edgesIgnoringSafeArea(.all)


            VStack{
                HStack{
                    Text("Number of darts thrown").font(.system(size: 46))
                        .bold()
                         .foregroundColor(.black)
                }.multilineTextAlignment(.center)
                HStack{
                    
                    if minNumberOfDarts == 1{
                        
                        Button( action: {
                            recieveButton(dartsToFinishButton: buttons[0])
                        }) {
                            Text(String(buttons[0].value))
                                .font(.system(size: 43))
                                .frame(width: UIScreen.main.bounds.width / 3.2, height:  UIScreen.main.bounds.height / 11)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(18)
                        }
                    }
                        
                        Button( action: {
                            recieveButton(dartsToFinishButton: buttons[1])
                        }) {
                            Text(String(buttons[1].value))
                                .font(.system(size: 43))
                                .frame(width: UIScreen.main.bounds.width / 3.2, height:  UIScreen.main.bounds.height / 11)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(18)
                        }
                        
                        Button( action: {
                            recieveButton(dartsToFinishButton: buttons[2])
                        }) {
                            Text(String(buttons[2].value))
                                .font(.system(size: 43))
                                .frame(width: UIScreen.main.bounds.width / 3.2, height:  UIScreen.main.bounds.height / 11)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(18)
                        }
                        
                        
                }
                Button( action: {
                        askForNumberOfDarts = false
                }) {
                    Text("return")
                        .font(.system(size: 43))
                        .frame(width: UIScreen.main.bounds.width / 3, height:  UIScreen.main.bounds.height / 11)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(18)
                }

            }
            

        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2.44)
        
    }
    
    func recieveButton(dartsToFinishButton: dartsToFinishButtons){
        numberOfDartsSelected = dartsToFinishButton.value
        askForNumberOfDarts = false
        victoryScreen = true
        currThrower.updateLegData(turnScore: turnScore, dartsThrownInTurn: numberOfDartsSelected)
        scoreDisplayThrower = currThrower

        
        currBeingTyped = 0
        display = currBeingTyped
    }
    
    
    
}


enum dartsToFinishButtons: String{
    
    case one, two, three
    
    var value: Int{
        switch self{
        case .one: return 1
        case .two: return 2
        case .three: return 3
        }
    }
}

