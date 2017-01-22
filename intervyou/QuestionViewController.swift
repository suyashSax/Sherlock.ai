//
//  QuestionsViewController.swift
//  intervyou
//
//  Created by Ashwin Vivek on 1/22/17.
//  Copyright © 2017 BrianShih. All rights reserved.
//

import UIKit
import Speech
import ToneAnalyzerV3
import SwiftSiriWaveformView

var arrayOfQuestions = [String]()

class QuestionViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    @IBOutlet weak var audioView: SwiftSiriWaveformView!
    
    var change: CGFloat = 0.01
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var nextQuestion: UIButton!
    
    var testArray = [Double]()
    
    var macroString: String = ""
    
    
    var isRecording = false
    var questionToAsk = 0
    var timer:Timer?
    
    //WATSON properties
    var documentToneJSON: String = ""
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    //SPEECH RECOGNITION properties
    var speechRecognizedAlready: Bool = false
    
    var recognizedText: String = ""
    
    
    //SPEECH DIALOGUE
    var speech_4 = ["Great", "Alright", "That’s cool"]
    var speech_5 = ["Awesome, I'd love to hear your thoughts on", "So lets talk about", "Now tell me what you think about"]
    
    var speech_6 = ["What else?", "Any final thoughts?", "Anything else you’d like to add?"]
    
    var speech_7 = ["That was great", "Alright that’s all we need", "Good job"]
    
    var speech_8 = ["I'm gonna forward my notes about our talk to my boss, Dr. Watson"]
    
    var speech_9 = ["Now let’s take a look at your fit for \(companyName)", "Here’s how \(companyName) and you can work together"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        speechRecognizer?.delegate = self
        
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            
            switch authStatus {  //5
            case .authorized:
                speechRecognitionEnabled = true
                
            case .denied:
                speechRecognitionEnabled = false
                print("User denied access to speech recognition")
                
            case .restricted:
                speechRecognitionEnabled = false
                print("Speech recognition restricted on this device")
                
            case .notDetermined:
                speechRecognitionEnabled = false
                print("Speech recognition not yet authorized")
            }
        }
        // Do any additional setup after loading the view.
        
        questionLabel.text = "\(arrayOfQuestions[self.questionToAsk])"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startRecording() {
        
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryRecord)
            try audioSession.setMode(AVAudioSessionModeMeasurement)
            try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let inputNode = audioEngine.inputNode else {
            fatalError("Audio engine has no input node")
        }
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }
        
        //change this
        recognitionRequest.shouldReportPartialResults = false
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            
            var isFinal = false
            
            if result != nil && !self.speechRecognizedAlready{
                
                //different sentence structures
                
                self.recognizedText = (result?.bestTranscription.formattedString)!
                self.macroString.append((result?.bestTranscription.formattedString)!)
                //print(self.macroString)
                isFinal = (result?.isFinal)!
                return
            }
            
            if ((error != nil || isFinal) && !self.speechRecognizedAlready) {
                
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                self.speechRecognizedAlready = true
                return
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error.")
        }
        
    }
    
    func watsonFunction(Answer: String, isUser: Bool) {
        
        let username = "376ed9bb-a62b-4720-9e84-d0f75bfb5b87"
        let password = "F7Fp3zI5Cb0Q"
        let version = "2017-01-21" // use today's date for the most recent version
        let toneAnalyzer = ToneAnalyzer(username: username, password: password, version: version)
        
        let text = Answer
        let failure = { (error: Error) in print(error) }
        
        var countSentencesInDocument = 0
        
        toneAnalyzer.getTone(ofText: text, failure: failure) { tones in
            
            self.documentToneJSON = (String(describing: tones))
            
            //print(self.documentToneJSON)
            var counter = 0
            
            var alreadyMade = false
            
            //adding scores to arrays
            
            if(isUser){
                for index in 0...self.documentToneJSON.characters.count-1{
                    
                    if(self.documentToneJSON[index..<index+5] == "score" && self.documentToneJSON[index-1] == " "){
                        counter += 1
                        
                        if(counter >= 1 && counter <= 5){
                            alreadyMade = false
                            for index1 in index+7..<index+13{
                                if(self.documentToneJSON[index1] == ")"){
                                    scoresForEmotionTonesInDocument.append(Double(self.documentToneJSON[index+7..<index1])!)
                                    alreadyMade = true
                                    break;
                                }
                            }
                            if(!alreadyMade){
                                scoresForEmotionTonesInDocument.append(Double(self.documentToneJSON[index+7..<index+13])!)
                                self.testArray.append(Double(self.documentToneJSON[index+7..<index+13])!)
                            }
                          
                        }
                        else if(counter > 5 && counter <= 8){
                            alreadyMade = false
                            for index1 in index+7..<index+13{
                                if(self.documentToneJSON[index1] == ")"){
                                    scoresForLanguageTonesInDocument.append(Double(self.documentToneJSON[index+7..<index1])!)
                                    alreadyMade = true
                                    break;
                                }
                            }
                            if(!alreadyMade){
                                scoresForLanguageTonesInDocument.append(Double(self.documentToneJSON[index+7..<index+13])!)
                            }
                            print("*****************")
                            print(scoresForLanguageTonesInDocument)
                        }
                        else if(counter > 8 && counter <= 13){
                            alreadyMade = false
                            for index1 in index+7..<index+13{
                                if(self.documentToneJSON[index1] == ")"){
                                    scoresForSocialTonesInDocument.append(Double(self.documentToneJSON[index+7..<index1])!)
                                    alreadyMade = true
                                    break;
                                }
                            }
                            if(!alreadyMade){
                                scoresForSocialTonesInDocument.append(Double(self.documentToneJSON[index+7..<index+13])!)
                            }
                            print("*****************")
                            print(scoresForSocialTonesInDocument)
                        }
                    }
                }
                //print(String(describing: tones));
            }
        }
    }
    
    internal func refreshAudioView(_:Timer) {
        if self.audioView.amplitude <= self.audioView.idleAmplitude || self.audioView.amplitude > 1.0 {
            self.change *= -1.0
        }
        
        // Simply set the amplitude to whatever you need and the view will update itself.
        self.audioView.amplitude += self.change
    }
    
    
    @IBAction func recordButton(_ sender: Any) {
        if(!isRecording){
            isRecording = true
            
            recordButton.isHidden = true
            recordButton.isEnabled = false
            
            startRecording()
            self.audioView.isHidden = false
            self.audioView.density = 1.0
            self.audioView.waveColor = UIColor.black
            timer = Timer.scheduledTimer(timeInterval: 0.009, target: self, selector: #selector(self.refreshAudioView(_:)), userInfo: nil, repeats: true)
        }
    }
   
    
    @IBAction func nextQuestion(_ sender: Any) {
        
        questionToAsk += 1
        
        if(questionToAsk == 3){
            
            watsonFunction(Answer: macroString, isUser: true)
            self.performSegue(withIdentifier: "toResult", sender: Any?.self)
            
            
        }
        
        audioEngine.stop()
        audioEngine.inputNode?.removeTap(onBus: 0)
        recognitionRequest?.endAudio()
        
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.nextQuestion.alpha = 0
            self.questionLabel.alpha = 0
        })
        nextQuestion.isEnabled = false
        
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(pauseBetweenQuestions), userInfo: nil, repeats: false)
        audioView.isHidden = true
    }
    
    
    func pauseBetweenQuestions(){
        
        if(questionToAsk==1){
            
            //            speak(string: speech_4[Int(arc4random_uniform(UInt32(speech_4.count)))])
            //            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            
            self.questionLabel.text = "\(arrayOfQuestions[self.questionToAsk])"
            self.speak(string: "\(arrayOfQuestions[self.questionToAsk])")
            isRecording = false
            self.recordButton.isEnabled = true
            self.recordButton.setImage(#imageLiteral(resourceName: "mic-a"), for: .normal)
            self.recordButton.isHidden = false
            //            }
        }
        else if(questionToAsk == 2){
            
            //            speak(string: speech_5[Int(arc4random_uniform(UInt32(speech_5.count)))])
            //            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            
            self.questionLabel.text = "\(arrayOfQuestions[self.questionToAsk])"
            self.speak(string: "\(arrayOfQuestions[self.questionToAsk])")
            isRecording = false
            self.recordButton.isEnabled = true
            self.recordButton.setImage(#imageLiteral(resourceName: "mic-a"), for: .normal)
            self.recordButton.isHidden = false
            //            }
        }
        
        
        
        nextQuestion.isEnabled = true
        
        if(questionToAsk != 3){
            questionLabel.text = "\(arrayOfQuestions[questionToAsk])"
        }
        else{
            questionLabel.text = "Finish"
        }
        
        UIView.animate(withDuration: 1, delay: 0, animations: {
            self.nextQuestion.alpha = 1
            self.questionLabel.alpha = 1
        })
        
        self.speechRecognizedAlready = false
    }
    
    
    func speak(string: String)
    {
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        
        //utterance.postUtteranceDelay = 2.0
        
        let synthesizer = AVSpeechSynthesizer()
        
        stopSpeech()
        
        if synthesizer.isSpeaking == false {
            synthesizer.speak(utterance)
        }
        
        //synthesizer.speak(utterance)
    }
    func stopSpeech() {
        
        let synthesizer = AVSpeechSynthesizer()
        
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
            var utterance = AVSpeechUtterance(string: "")
            synthesizer.speak(utterance)
            synthesizer.stopSpeaking(at: .immediate)
        }
    }

    
}
