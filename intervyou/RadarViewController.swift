//
//  RadarViewController.swift
//  CHARTYYYYYYYYYY
//
//  Created by Brian Shih on 1/21/17.
//  Copyright © 2017 BrianShih. All rights reserved.
//

import UIKit
import Charts



class RadarViewController: UIViewController {
    
    @IBOutlet var radarView: RadarChartView!
    
    var type: String = ""
    var labels: [String] = []
    var companyData: [Double] = []
    var selfData: [Double] = []
    func setChartRadar(labels: [String], selfData: [Double], companyData: [Double]) {
        var dataEntries: [RadarChartDataEntry] = []
        var dataEntries2: [RadarChartDataEntry] = []
        
        print(companyData.count)
        for i in 0..<companyData.count {
            
            let dataEntry = RadarChartDataEntry(value: Double.random0to1())
            let dataEntry2 = RadarChartDataEntry(value: companyData[i])
            dataEntries.append(dataEntry)
            dataEntries2.append(dataEntry2)
        }
        
        let chartDataSet = RadarChartDataSet(values: dataEntries, label: "You")
        let chartDataSet2 = RadarChartDataSet(values: dataEntries2, label: "Company")
        
        chartDataSet.highlightCircleFillColor = UIColor.blue
        chartDataSet.setColor(UIColor.blue)
        chartDataSet2.setColor(UIColor.red)
        chartDataSet2.fillColor = UIColor.brown
        chartDataSet.drawFilledEnabled = true
        chartDataSet2.drawFilledEnabled = true
        var dataSets: [IChartDataSet] = []
        dataSets.append(chartDataSet)
        dataSets.append(chartDataSet2)
        
        
        let chartData = RadarChartData(dataSets: dataSets)
        chartData.labels = labels
        chartData.setLabels()
        
        radarView.data = chartData
        
        radarView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        radarView.tintColor = UIColor.brown
        //  radarChart.tintColor
        radarView.dragDecelerationEnabled = true
        radarView.chartDescription = Description()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setChartRadar(labels: self.labels, selfData: self.selfData, companyData: self.companyData)
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

extension Double {
    private static let arc4randomMax = Double(UInt32.max)
    
    static func random0to1() -> Double {
        return Double(arc4random()) / arc4randomMax
    }
}
