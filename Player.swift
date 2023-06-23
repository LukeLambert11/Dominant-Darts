//
//  Player.swift
//  DartCounter
//
//  Created by Luke Lambert on 1/20/23.
//

import Foundation
import SwiftUI


class Player {
    
    var name: String //player name
   private var currentLegData: LegData //currentLegData
    var pastLegData: [LegData] = [] //array of past legs
    private var countDownForAllGames: Int
    
    var legsWon: Int = 0 //legsWon Count
    var setWon: Int = 0 //setsWon Count
    var color: Color //player Color for their display box
    
    
    //intializer
    init(name: String, countDown: Int, color: Color){
        self.name = name
        self.color = color
        self.countDownForAllGames = countDown
        self.currentLegData = LegData(legCountDown: countDownForAllGames)

    }
    
    //current Leg CountDown
    func getCurrLegCountDown() -> Int{
        return currentLegData.legCountDown
    }

    //current Leg DartsThrown
    func getCurrLegDartsThrown() -> Int{
        return currentLegData.dartsThrown
    }
    
    //prior score
    func getPriorScore() -> Int{
        return currentLegData.pastScores.last ?? -1
    
    }
    
    //current Leg Average
    func getLegAverage() -> Float{
        return round(currentLegData.legAverage * 10) / 10.0
        //round(value * 10) / 10.0
    }
    
    //current Leg update data
    func updateLegData(turnScore: Int, dartsThrownInTurn: Int){
        currentLegData.updateLegData(turnScore: turnScore, dartsThrownInTurn: dartsThrownInTurn)
    }
    
    //undo prior throw
    func undo(dartsThrownInTurn: Int){
        currentLegData.undo(dartsThrownInTurn: dartsThrownInTurn)
    }
    
    func legFinish(){
        
        if currentLegData.legCountDown == 0 {
            legsWon += 1
        }
        
        pastLegData.append(currentLegData)
        currentLegData = LegData(legCountDown: countDownForAllGames)
        
    }
    
    
    
}


struct LegData{

    var dartsThrown: Int = 0
    var legAverage: Float = 0
    var pastScores: [Int] = []
    var legCountDown: Int
    var totalScoredInLeg: Int = 0
    var undoFinalThrow: Float = 0;
    
    init(legCountDown: Int){
        self.legCountDown = legCountDown
    }
    
    
    
    mutating func updateLegData(turnScore: Int, dartsThrownInTurn: Int){
        dartsThrown += dartsThrownInTurn
        pastScores.append(turnScore)
        legCountDown -= turnScore
        totalScoredInLeg += turnScore
        
        
        legAverage = Float(totalScoredInLeg * 3) / Float(dartsThrown)
        
        /*
        legAverage = legAverage + ((Float(turnScore) - legAverage)/Float(pastScores.count))
        
        if dartsThrownInTurn != 3{
            undoFinalThrow = legAverage
            legAverage = (Float(pastScores.count) * legAverage) / (Float(pastScores.count) - Float(3 - dartsThrownInTurn)/3.0 )
        }
       */
        
    }
    
    mutating func undo(dartsThrownInTurn: Int){
        dartsThrown -= dartsThrownInTurn
        totalScoredInLeg -= pastScores.last ?? 0
        legCountDown += pastScores.remove(at: pastScores.count - 1)

        if(pastScores.count > 1){
            legAverage = Float(totalScoredInLeg * 3) / Float(dartsThrown)
        }
        else{
            legAverage = 0
        }
        
        
        
        

        /*
        if(dartsThrownInTurn != 3){
            legAverage = undoFinalThrow
        }
        
        if(pastScores.count > 1){
            legAverage = (legAverage * Float(pastScores.count) - Float(pastScores.last ?? 0)) / Float(pastScores.count - 1)
        }
        else{
            legAverage = 0
        }*/
        
        
  
    }

    
}

/*
 
 
 average = average + ((value - average) / nValues)
 Subtract a value:

 average = (average * nValues - value) / (nValues - 1)
 
 */

