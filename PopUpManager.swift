//
//  PopUpManager.swift
//  Dominant Darts
//
//  Created by Luke Lambert on 1/25/23.
//

import Foundation





final class PopUpMangager: ObservableObject{
    
    @Published var askForNumberOfDarts: Bool = false
    @Published var numberOfDartsSelected: Int = 0
    @Published var minNumberOfDarts: Int = 0
    @Published var victoryScreen: Bool = false
    @Published var turnScore: Int = 0
    @Published var display: Int = 0
    
}

