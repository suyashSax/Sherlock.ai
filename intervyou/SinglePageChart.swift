//
//  SinglePageChart.swift
//  CHARTYYYYYYYYYY
//
//  Created by Brian Shih on 1/21/17.
//  Copyright © 2017 BrianShih. All rights reserved.
//

import UIKit
import Charts
class SinglePageChart: UITabBarController {
    var type1 = "Emotion"
    var emotionSelfArray: [Double] = []
    var emotionCompanyArray: [Double] = []
    var emotionLabels: [String] = []
    
    var type2 = "Language Tone"
    var languageSelfArray: [Double] = []
    var languageCompanyArray: [Double] = []
    var languageLabels: [String] = []
    
    var type3 = "Social Tone"
    var socialSelfArray: [Double] = []
    var socialCompanyArray: [Double] = []
    var socialLabels: [String] = []
    
    override func viewDidLoad() {
        /*
         var tabBarController = segue.destinationViewController as UITabBarController;
         var destinationViewController = tabBarController.viewControllers[0] as YourViewController // or whatever tab index you're trying to access
         destinationViewController.property = "some value"
         
         
         */
        
        switch (companyName)
        {
        case "Google":
            emotionCompanyArray = [0.086816, 0.090728, 0.101015, 0.612888,0.413956];
            languageCompanyArray = [0.086816, 0.825793, 0];
            socialCompanyArray = [0.359236, 0.788312, 0.824022, 0.796051,0.468105];
            break;
            
        case "IBM":
            emotionCompanyArray = [0.117271, 0.13412, 0.162917, 0.507679,0.261504];
            languageCompanyArray = [0.806057, 0.8793, 0];
            socialCompanyArray = [0.482179, 0.208065, 0.713992, 0.090759,0.390095];
            break;
            
        case "Snapchat":
            emotionCompanyArray = [0.081227, 0.088857, 0.054301, 0.57514,0.307802];
            languageCompanyArray = [0.586861, 0.555203, 0.0];
            socialCompanyArray = [0.445361, 0.342008, 0.703353, 0.204015,0.488346];
            break;
            
        case "Goldman Sacks":
            emotionCompanyArray = [0.130296, 0.078606, 0.153707, 0.536032, 0.279971];
            languageCompanyArray = [0.427876, 0.334539, 0.434539];
            socialCompanyArray = [0.742323, 0.557564, 0.917441, 0.436654, 0.513852];
            break;
            
        case "The US Army":
            emotionCompanyArray = [0.10916, 0.467906, 0.448745, 0.252574,0.208868];
            languageCompanyArray = [0.424109, 0.825793, 0.372915];
            socialCompanyArray = [0.593066, 0.964332, 0.504894, 0.43185,0.902392];
            break;
            
        default:
            emotionCompanyArray = [0.086816, 0.090728, 0.101015, 0.612888,0.413956];
            languageCompanyArray = [0.086816, 0.825793, 0.700232];
            socialCompanyArray = [0.359236, 0.788312, 0.824022, 0.796051,0.468105];
            break;
        }

        var emotion = self.viewControllers?[0] as! RadarViewController
        var language = self.viewControllers?[1] as! RadarViewController
        var social = self.viewControllers?[2] as! RadarViewController
        
        emotion.labels = self.emotionLabels
        emotion.companyData = self.emotionCompanyArray
        emotion.selfData = scoresForEmotionTonesInDocument
        
        language.labels = self.languageLabels
        language.companyData = self.languageCompanyArray
        language.selfData = scoresForLanguageTonesInDocument
        
        social.labels = socialLabels
        social.selfData = socialCompanyArray
        social.companyData = socialCompanyArray
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
