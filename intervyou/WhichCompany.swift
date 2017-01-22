//
//  WhichCompany.swift
//  intervyou
//
//  Created by Brian Shih on 1/21/17.
//  Copyright © 2017 BrianShih. All rights reserved.
//

import UIKit

class WhichCompany: UIViewController {
    
    var whichCompanyChosen = ""
    
    @IBAction func IBMButton(_ sender: Any) {
        whichCompanyChosen = "IBM"
        self.performSegue(withIdentifier: "toInterview", sender: Any?.self)
    }
    let IBMQuestions = ["Tell me about a time when you had to present complex programming problem to a person that doesn’t understand technical jargon. How did you ensure that the other person understood you?",
                        "Tell me about a situation when you made a mistake at work. What happened exactly and how did you deal with it? What steps did you take to improve the situation?",
                        "What can you tell me about your experience?"]
    
    
    @IBAction func GoogleButton(_ sender: Any) {
        whichCompanyChosen = "Google"
        self.performSegue(withIdentifier: "toInterview", sender: Any?.self)
    }
    let GoogleQuestions = ["What’s an example of a time you helped a non-technical person with a technical problem, and how did you explain it to them?",
                           "What are your hobbies?",
                           "Why should we hire you?"]
    
    
    @IBAction func SnapchatButton(_ sender: Any) {
        whichCompanyChosen = "Snapchat"
        self.performSegue(withIdentifier: "toInterview", sender: Any?.self)
    }
    let SnapchatQuestions = ["Describe a situation in which you had to adjust to changes over which you had no control. How did you do this?",
                             "Tell me about a recent situation at work in which you were able to get management to accept one of your ideas.",
                             "What is your work style?"]
    
    
    @IBAction func GoldmanSachsButton(_ sender: Any) {
        whichCompanyChosen = "Goldman Sachs"
        self.performSegue(withIdentifier: "toInterview", sender: Any?.self)
    }
    let GoldmanSachsQuestions = ["What do you like about your current work environment, and what do you not like about it?",
                                 "Can you describe an environment or scenario where you would not thrive instantly?",
                                 "What makes Goldman Sachs different to its competitors?"
    ]
    
    
    @IBAction func ArmyButton(_ sender: Any) {
        whichCompanyChosen = "Army"
        self.performSegue(withIdentifier: "toInterview", sender: Any?.self)
    }
    let ArmyQuestions = ["How do you evaluate success?",
                         "Why are you here?",
                         "What is your greatest weakness?"]
    
    @IBOutlet weak var ibmT: UIImageView!
    @IBOutlet weak var snapT: UIImageView!
    @IBOutlet weak var googleT: UIImageView!
    @IBOutlet weak var goldmanT: UIImageView!
    @IBOutlet weak var armyT: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.ibmT.alpha = 0
        self.snapT.alpha = 0
        self.googleT.alpha = 0
        self.armyT.alpha = 0
        self.goldmanT.alpha = 0
        self.label.alpha = 0
        self.label.center.y += 50
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1, animations: {
            self.label.center.y -= 50.0
            self.label.alpha = 1.0
        })
        
        UIView.animate(withDuration: 3, animations: {
            self.ibmT.alpha = 1
            self.snapT.alpha = 1
            self.googleT.alpha = 1
            self.goldmanT.alpha = 1
            self.armyT.alpha = 1
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toInterview"){
            
            switch(whichCompanyChosen){
            case "IBM":
                for index in 0...2{
                    arrayOfQuestions.append(IBMQuestions[index])
                    companyName = "IBM"
                }
                break;
            case "Google":
                for index in 0...2{
                    arrayOfQuestions.append(GoogleQuestions[index])
                    companyName = "Google"
                }
                break;
            case "Snapchat":
                for index in 0...2{
                    arrayOfQuestions.append(SnapchatQuestions[index])
                    companyName = "Snapchat"
                }
                break;
            case "Goldman Sachs":
                for index in 0...2{
                    arrayOfQuestions.append(GoldmanSachsQuestions[index])
                    companyName = "Goldman Sachs"
                }
                break;
            case "Army":
                for index in 0...2{
                    arrayOfQuestions.append(ArmyQuestions[index])
                    companyName = "The US Army"
                }
                break;
            default:
                break;
            }
        }
        
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


