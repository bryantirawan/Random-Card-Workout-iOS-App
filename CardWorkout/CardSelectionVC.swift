//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Bryant Irawan on 10/17/22.
//

import UIKit

class CardSelectionVC: UIViewController {
    
//IBoutlet give access to objects in code (eg. round corners)
    

    @IBOutlet var cardImageView: UIImageView!
    //    @IBOutlet var stopButton: UIButton!
//    @IBOutlet var rulesButton: UIButton!
//    @IBOutlet var restartButton: UIButton!
// You can do the outlets individually or add it into an outlet collection (then look at for loop below)
    @IBOutlet var buttons: [UIButton]!
    var timer: Timer!
    var cards: [UIImage] = Deck.allValues
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
       
        
//        stopButton.layer.cornerRadius = 8
//        rulesButton.layer.cornerRadius = 8
//        restartButton.layer.cornerRadius = 8
        
        for button in buttons {
            button.layer.cornerRadius = 8
        }
        
    }
    
    //always need something like this on views that will disappear. look up more info 
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    //objective c function that goes into selector above
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    //self is the view controller
    //selector is the function that runs each time during an interval. it is an objective c function
    
    //IBaction tells you what happens when object is pressed
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    

}
