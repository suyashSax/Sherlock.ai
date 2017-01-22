//
//  FirstViewController.swift
//  CHARTYYYYYYYYYY
//
//  Created by Brian Shih on 1/21/17.
//  Copyright © 2017 BrianShih. All rights reserved.
//

import UIKit

//var emotionalLabels = ["Anger", "Disgust", "Fear", "Joy", "Sadness"]
//var languageLabels = ["Analytical", "Confident", "Tentative"]
//var socialLabels = ["Openness", "Conscientiousness", "Extraversion", "Agreeableness", "Emotional Range"]



class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func performm(_ sender: Any) {
        
         performSegue(withIdentifier: "toTab", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //  if segue!.identifier == "Details" {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toTab") {
            let viewController = segue.destination as! SinglePageChart

            /*
            switch (companyName)
            {
            case "Google":
                viewController.emotionalData = [0.086816, 0.090728, 0.101015, 0.612888,0.413956];
               viewController.languageData = [0.086816, 0.825793, 0];
                viewController.socialData = [0.359236, 0.788312, 0.824022, 0.796051,0.468105];
                break;
                
            case "IBM":
                emotionalData = [0.117271, 0.13412, 0.162917, 0.507679,0.261504];
                languageData = [0.806057, 0.8793, 0];
                socialData = [0.482179, 0.208065, 0.713992, 0.090759,0.390095];
                break;
                
            case "Snapchat":
                emotionalData = [0.081227, 0.088857, 0.054301, 0.57514,0.307802];
                languageData = [0.586861, 0.555203, 0.0];
                socialData = [0.445361, 0.342008, 0.703353, 0.204015,0.488346];
                break;
                
            case "Goldman Sacks":
                emotionalData = [0.130296, 0.078606, 0.153707, 0.536032, 0.279971];
                languageData = [0.427876, 0.334539, 0.434539];
                socialData = [0.742323, 0.557564, 0.917441, 0.436654, 0.513852];
                break;
                
            case "The US Army":
                emotionalData = [0.10916, 0.467906, 0.448745, 0.252574,0.208868];
                languageData = [0.424109, 0.825793, 0.372915];
                socialData = [0.593066, 0.964332, 0.504894, 0.43185,0.902392];
                break;
                
            default:
                emotionalData = [0.086816, 0.090728, 0.101015, 0.612888,0.413956];
                languageData = [0.086816, 0.825793, 0.700232];
                socialData = [0.359236, 0.788312, 0.824022, 0.796051,0.468105];
                break;
            }
 */
            viewController.emotionLabels = ["Anger", "Disgust", "Fear", "Joy", "Sadness"]

            viewController.emotionSelfArray = [0.086816, 0.090728, 0.101015, 0.612888,0.413956]
            viewController.emotionCompanyArray =  [0.130296, 0.078606, 0.153707, 0.536032, 0.279971]
            
            viewController.languageLabels = ["Analytical", "Confident", "Tentative"]
            viewController.languageCompanyArray = [0.086816, 0.825793, 0]
            viewController.languageSelfArray = [0.427876, 0.334539, 0.434539]
            
            viewController.socialLabels = ["Openness", "Conscientiousness", "Extraversion", "Agreeableness", "Emotional Range"]
            viewController.socialSelfArray = [0.359236, 0.788312, 0.824022, 0.796051,0.468105]
            viewController.socialCompanyArray = [0.742323, 0.557564, 0.917441, 0.436654, 0.513852]
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     
     case "Google":
     emotionalData = [0.086816, 0.090728, 0.101015, 0.612888,0.413956];
     languageData = [0.086816, 0.825793, 0];
     socialData = [0.359236, 0.788312, 0.824022, 0.796051,0.468105];
     break;
     
     case "IBM":
     emotionalData = [0.117271, 0.13412, 0.162917, 0.507679,0.261504];
     languageData = [0.806057, 0.8793, 0];
     socialData = [0.482179, 0.208065, 0.713992, 0.090759,0.390095];
     break;
     
     case "Snapchat":
     emotionalData = [0.081227, 0.088857, 0.054301, 0.57514,0.307802];
     languageData = [0.586861, 0.555203, 0.0];
     socialData = [0.445361, 0.342008, 0.703353, 0.204015,0.488346];
     break;
     
     case "Goldman Sacks":
     emotionalData = [0.130296, 0.078606, 0.153707, 0.536032, 0.279971];
     languageData = [0.427876, 0.334539, 0.434539];
     socialData = [0.742323, 0.557564, 0.917441, 0.436654, 0.513852];
     break;
     
     case "The US Army":
     emotionalData = [0.10916, 0.467906, 0.448745, 0.252574,0.208868];
     languageData = [0.424109, 0.825793, 0.372915];
     socialData = [0.593066, 0.964332, 0.504894, 0.43185,0.902392];
     break;
     */
    
}
