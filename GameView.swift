//
//  ContentView.swift
//  DartCounter
//
//  Created by Luke Lambert on 1/20/23.
//

import SwiftUI
import Popovers

struct GameView: View {
    
    @ObservedObject var popUpManager = PopUpMangager()
    
        
    @State var showScoreScreen: Bool = false //need to check if this is needed
    @State var invalidInput: Bool = false

    

    
    // current Thrower
    @State var currThrowerName = currThrower.name
    @State var currThrowerDartsThrown = currThrower.getCurrLegDartsThrown()
    @State var currThrowerCountDown = currThrower.getCurrLegCountDown()
    @State var currThrowerPrevious = currThrower.getPriorScore()
    @State var currThrowerLegAvg = currThrower.getLegAverage()
    @State var currThrowerColorVar = currThrower.color

    
    //next Thrower
    @State var nextThrowerName = nextThrower.name
    @State var nextThrowerDartsThrown = nextThrower.getCurrLegDartsThrown()
    @State var nextThrowerCountDown = nextThrower.getCurrLegCountDown()
    @State var nextThrowerPrevious = nextThrower.getPriorScore()
    @State var nextThrowerLegAvg = nextThrower.getLegAverage()
    @State var nextThrowerColorVar = nextThrower.color
    


    
    let buttons: [[ScoreButtons]] = [
        [.one, .two, .three],
        [.four, .five, .six],
        [.seven, .eight, .nine],
        [.undo, .zero, .ok]

        
        
    ]
    
    var body: some View {
        
        //background color
        ZStack{
            Color.gray.edgesIgnoringSafeArea(.all)
            //the orange top player who is to throw
            VStack {
                
                //name; average; darts thrown
                HStack{
                    Text(self.currThrowerName)
                        .font(.system(size: 20))
                    .foregroundColor(.white)
                    Spacer()
                    Text("avg: " + String(currThrowerLegAvg))
                        .font(.system(size: 20))
                    .foregroundColor(.white)
                    Text("darts in leg: " + String(self.currThrowerDartsThrown))
                        .font(.system(size: 20))
                    .foregroundColor(.white)
                    
                }
                
                // scoreCountDown; prevThrowScore
                HStack{
                    Text(String(self.currThrowerCountDown))
                        .bold()
                        .font(.system(size: 52))
                    .foregroundColor(.white)
                    Spacer()
                    
                    
                    if currThrowerPrevious != -1{
                        Text("prev: " + String(currThrowerPrevious))
                            .font(.system(size: 20))
                        .foregroundColor(.white)
                        
                    }
                    }
               
                //Checkout
                HStack{
                    
                    let currThrowerCheckout = checkOutText(currScoreCountDown: self.currThrowerCountDown)
                    
                    if currThrowerCheckout != ""{
                        Text("Checkout").font(.system(size:20))
                            .foregroundColor(.white)
                        Text(currThrowerCheckout)
                            .bold()
                            .font(.system(size:30))
                            .foregroundColor(.white)
                        Spacer()
                    }
                  
                    
             
                }
                
                
            }.padding()
                .frame(width: UIScreen.main.bounds.width * 0.92,             height: UIScreen.main.bounds.height * 0.175)
                .background(currThrowerColorVar).cornerRadius(18).offset(y: UIScreen.main.bounds.height / -2.85)
           
            
            //the black botton player who is to throw after
            VStack {
                
                //name; average; darts thrown
                HStack{
                    Text(self.nextThrowerName)
                        .font(.system(size: 20))
                    .foregroundColor(.white)
                    Spacer()
                    Text("avg: " + String(nextThrowerLegAvg))
                        .font(.system(size: 20))
                    .foregroundColor(.white)
                    Text("darts in leg: " + String(self.nextThrowerDartsThrown))
                        .font(.system(size: 20))
                    .foregroundColor(.white)
                    
                }
                
                // scoreCountDown; prevThrowScore
                HStack{
                    Text(String(self.nextThrowerCountDown))
                        .bold()
                        .font(.system(size: 52))
                    .foregroundColor(.white)
                    Spacer()
                    
                    
                    if nextThrowerPrevious != -1{
                        Text("prev: " + String(nextThrowerPrevious))
                            .font(.system(size: 20))
                        .foregroundColor(.white)
                        
                    }
                    
                }
                
                //Checkout
                HStack{
                    
                    let nextThrowerCheckout = checkOutText(currScoreCountDown: self.nextThrowerCountDown)
                    
                    if nextThrowerCheckout != ""{
                        Text("Checkout").font(.system(size:20))
                            .foregroundColor(.white)
                        Text(nextThrowerCheckout)
                            .bold()
                            .font(.system(size:30))
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                
                
                }.padding()
                .frame(width: UIScreen.main.bounds.width * 0.92,             height: UIScreen.main.bounds.height * 0.175)
                .background(nextThrowerColorVar).cornerRadius(18).offset(y: UIScreen.main.bounds.height / -6.1)
                
           
            
            //keypad and current typing
            VStack (spacing: 5){
                
                Spacer()
                
                //current typing score box
                HStack{
                    
                    Text(whatToDisplay(invalidInput: invalidInput))
                        .font(.system(size: whatToDisplayFontSize(invalidInput: invalidInput)))
                        .foregroundColor(whatToDisplayColor(invalidInput: invalidInput))
                }.frame(   width: UIScreen.main.bounds.width / 2.5, height:  UIScreen.main.bounds.height / 11)
                    .background(Color.black)
                    .cornerRadius(18)
                    .padding(8)
                    
         
                
                
                
                    //creating the buttons
                    ForEach(buttons, id: \.self){ row in
                        HStack(spacing: 5){
                        
                            ForEach(row, id: \.self){ button in
                                
                                Button( action: {
                                    recieveInput(scoreButtons: button)
                                }) {
                                    Text(button.title)
                                        .font(.system(size: 43))
                                        .frame(width: UIScreen.main.bounds.width / 3.2, height:  UIScreen.main.bounds.height / 11)
                                        .foregroundColor(.white)
                                        .background(Color.black)
                                        .cornerRadius(18)
                                }


                                
                              
                        }
                        
                        }
                    
                   
                    
                }
            }.padding()

        }.fullScreenCover(isPresented: $showScoreScreen, content: {
           DisplayScore()
        })
        
        
        .fullScreenCover(isPresented: $popUpManager.victoryScreen, content: {
            DisplayVictoryScreen(numberOfDartsSelected: self.$popUpManager.numberOfDartsSelected, victoryScreen:  $popUpManager.victoryScreen, turnScore: self.$popUpManager.turnScore)
         })
        
        .overlay(alignment: .bottom){
            
            if self.popUpManager.askForNumberOfDarts{
                PopUpView(minNumberOfDarts: self.$popUpManager.minNumberOfDarts, numberOfDartsSelected: self.$popUpManager.numberOfDartsSelected, askForNumberOfDarts: self.$popUpManager.askForNumberOfDarts, victoryScreen: self.$popUpManager.victoryScreen, turnScore: self.$popUpManager.turnScore,
                          display: self.$popUpManager.display)
            }
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)


    }
    
 
    
    func recieveInput(scoreButtons: ScoreButtons){

        switch scoreButtons{
            
        
        case .ok:
            swap(value: currBeingTyped)
            
            
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            
            //illegal imputs from 181-189
            if currBeingTyped == 0{
                currBeingTyped = scoreButtons.value
                
                //if u enter 0 same as ok with 0 
                if(currBeingTyped == 0){
                    swap(value: 0)
                }
                
                //for limiting the ok when at 0 ex 10 left 2 entered
                if(currBeingTyped * 10 > currThrower.getCurrLegCountDown() || currBeingTyped == currThrower.getCurrLegCountDown()){
                    swap(value: currBeingTyped)
                }
                
                popUpManager.display = currBeingTyped
                break
            }
            
            if currBeingTyped == 18{
                if scoreButtons.value == 0{

                }
                else{
                    self.invalidInput = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.1){
                        self.invalidInput = false
                    }
                    currBeingTyped = 0
                    popUpManager.display = currBeingTyped
                    return
                }
            }
            
            //illegal imputs 169 168 166 165 163 162
            if(currBeingTyped == 16){
                if scoreButtons.value == 0 || scoreButtons.value == 1 || scoreButtons.value == 4 || scoreButtons.value == 7{
                    
                }
                else{
                    self.invalidInput = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.1){
                        self.invalidInput = false
                    }
                    currBeingTyped = 0
                    popUpManager.display = currBeingTyped
                    return

                }
            }
            
            //illegal imputs 159
            if(currBeingTyped == 15 && scoreButtons.value == 9){
                self.invalidInput = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.1){
                    self.invalidInput = false
                }
                currBeingTyped = 0
                popUpManager.display = currBeingTyped
                return

            }
            
            
            currBeingTyped *= 10
            currBeingTyped += scoreButtons.value
            
            
            
            
            popUpManager.display = currBeingTyped

            
            if(currBeingTyped > 18){
                swap(value: currBeingTyped)
            }
            
            //for limiting the ok ex 120 left type in 13
            if(currBeingTyped * 10 > currThrower.getCurrLegCountDown() || currBeingTyped == currThrower.getCurrLegCountDown()){
                swap(value: currBeingTyped)
            }
            
            
        
        case .undo:

            //backspace Case
            
            if currBeingTyped != 0{
                currBeingTyped = currBeingTyped / 10
                popUpManager.display = currBeingTyped
            }
            else if nextThrowerDartsThrown == 0{
                break
            }
            else{
                undoScoreEntered()
                
            }
            
            
            
            
        }
            
    }
    
    func swap(value: Int){
        //for a bug where swap gets called twice
        if popUpManager.victoryScreen == true{
            return
        }
      //  self.display = 0
     //   currBeingTyped = 0

        var throwTurn = value
        
        let countDown = currThrower.getCurrLegCountDown()
        
        
        if throwTurn > countDown || throwTurn == countDown - 1{
            throwTurn = 0
        }
        
        if throwTurn == countDown
            && minNumberDartsCheckout(checkout: throwTurn) == 0 {
            throwTurn = 0
        }
        
    
    
        
        if(countDown - throwTurn == 0){
            
            let dartsForCheckoutTemp: Int = minNumberDartsCheckout(checkout: throwTurn)
            
            if dartsForCheckoutTemp == 2 || dartsForCheckoutTemp == 1 {
                
                popUpManager.minNumberOfDarts = dartsForCheckoutTemp
                popUpManager.askForNumberOfDarts = true
                popUpManager.turnScore = throwTurn
                
                
            }
            else{
                //a three dart checkout
                popUpManager.turnScore = throwTurn

                //causing function to be called twice
               currThrower.updateLegData(turnScore: popUpManager.turnScore, dartsThrownInTurn: 3)
                    scoreDisplayThrower = currThrower
                
                
                //resetting the current typing box
                popUpManager.display = 0
                currBeingTyped = 0
                
                popUpManager.numberOfDartsSelected = 3
                popUpManager.victoryScreen = true
            }
            

            
        }
        else{
            
            //resetting the current typing box
            popUpManager.display = 0
            currBeingTyped = 0
            
            currThrower.updateLegData(turnScore: throwTurn, dartsThrownInTurn: 3)
            scoreDisplayThrower = currThrower
            
            self.showScoreScreen = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3){
                self.showScoreScreen = false
            }
            
            let temp = currThrower
            currThrower = nextThrower
            nextThrower = temp
            
        
            //update the variables
            
            updateScoringViewData()
        }
        


    }

    func updateScoringViewData(){
        
        //current thrower
        currThrowerName = currThrower.name
        currThrowerDartsThrown = currThrower.getCurrLegDartsThrown()
        currThrowerCountDown = currThrower.getCurrLegCountDown()
        currThrowerLegAvg = currThrower.getLegAverage()
        currThrowerPrevious = currThrower.getPriorScore()
        currThrowerColorVar = currThrower.color

        
        //next Thrower
        nextThrowerName = nextThrower.name
        nextThrowerDartsThrown = nextThrower.getCurrLegDartsThrown()
        nextThrowerCountDown = nextThrower.getCurrLegCountDown()
        nextThrowerLegAvg = nextThrower.getLegAverage()
        nextThrowerPrevious = nextThrower.getPriorScore()
        nextThrowerColorVar = nextThrower.color

    }
    
    func undoScoreEntered(){
        let temp = currThrower
        currThrower = nextThrower
        nextThrower = temp
        currThrower.undo(dartsThrownInTurn: 3)
        updateScoringViewData()
    }
    
    func whatToDisplay(invalidInput: Bool) -> String{
        
        if !invalidInput{
            return String(popUpManager.display)
        }
        
        return "Invalid Input"
        
        
    }
    
    func whatToDisplayFontSize(invalidInput: Bool) -> CGFloat{
        
        if !invalidInput{
            return 50.0
        }
        
        return 25.0
        
     
        
    }
    
    func whatToDisplayColor(invalidInput: Bool) -> Color{
        if !invalidInput{
            return Color.white
        }
        
        return Color.red
        
    }
    
    
    
    
    
}



struct DisplayScore: View{
    
    var body: some View{
        
        ZStack {
            scoreDisplayThrower.color
                .edgesIgnoringSafeArea(.all)
            

            
            VStack{
                Text(scoreDisplayThrower.name)
                .font(.system(size: 55))
                .foregroundColor(Color.white)
                .padding()
                Spacer()
                Text(String(scoreDisplayThrower.getPriorScore()))
                .font(.system(size: 150))
                .foregroundColor(Color.white)
            Text(String(scoreDisplayThrower.getCurrLegCountDown()))
                .font(.system(size: 50))
                .foregroundColor(Color.white)
                Spacer()
            }
           
            
        }
    }
    
    
    
    
    
}










//for preview
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}



//keyboard buttons
enum ScoreButtons: String{
    
    case zero, one, two, three, four, five, six, seven, eight, nine
    case ok, undo
    
    var title: String{
        switch self{
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .ok: return "Ok"
        case .undo: return "<-"

        }
    }
    
    
    var value: Int{
        switch self{
        case .zero: return 0
        case .one: return 1
        case .two: return 2
        case .three: return 3
        case .four: return 4
        case .five: return 5
        case .six: return 6
        case .seven: return 7
        case .eight: return 8
        case .nine: return 9
        case .ok: return -1
        case .undo: return -2
        }
        
    }
    
    
}



//screen width function
func buttonWidth() -> CGFloat{
    return (UIScreen.main.bounds.width * 0.72) / 4
}



//TODO: add the below to an enviormental object


let player1 = Player(name: "andy", countDown: 501, color: Color.orange)
let player2 = Player(name: "shauib", countDown: 501, color: Color.black)
var currThrower = player1
var nextThrower = player2
var scoreDisplayThrower = currThrower
var currBeingTyped: Int = 0

//Priority
//TODO: add a reset method for the start of a new leg (probably done with envionrmental object or a state var in a method)
    //TODO: move darts in leg down to the HStack with the score
        //TODO: add the full game average
            //TODO: remove the CHECKOUT
                //TODO: add the number of legs and sets won

//TODO: make a win condition class (maybe in the envionmental object above) that knows how many legs/set to win
//TODO: add the game settings to the SetUpGameView





//TODO: figure out how to save all time average and all time darts thrown

//TODO: make a method that fixes the font for iphone se


//NOTE: when setting the name for players maybe set a charcter limit so name doesnt go into average


