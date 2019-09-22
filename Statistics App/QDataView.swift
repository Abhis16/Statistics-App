//
//  QDataView.swift
//  Statistics App
//
//  Created by Abhi Shukul on 9/20/19.
//  Copyright © 2019 Abhi Shukul. All rights reserved.
//

import UIKit

class QDataView: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var dataInput: UITextField!
    
    @IBOutlet weak var QDataLabel: UILabel!
    
    
    @IBOutlet weak var MeanOutput: UILabel!
    @IBOutlet weak var MedianOutput: UILabel!
    @IBOutlet weak var StDevOutput: UILabel!
    @IBOutlet weak var IqrOutput: UILabel!
    @IBOutlet weak var OutlierOutput: UILabel!
    @IBOutlet weak var RangeOutput: UILabel!
    
    //var dataInts = []
    
    @IBAction func SubmitQData(_ sender: UIButton) {
        //QDataLabel.text = "\(dataInput.text!)"  <-- used for debugging
        var data:String = dataInput.text!
        var dataArray:Array = data.components(separatedBy: ", ")
        // casting values in array from String -> Int
        let dataDouble:Array = dataArray.map {
            (number: String) -> Double in
            return Double(number)!
        }
        //print(dataInts) used for debugging
        /*
        MeanOutput.text = String(findMean(data: dataDouble))
        MedianOutput.text = String(findMedian(data: dataDouble))
        StDevOutput.text = String(findStandardDeviation(data: dataDouble))
        */
        
        let meanString:String = String(format: "%.2f", findMean(data: dataDouble))
        let medianString:String = String(format: "%.2f", findMedian(data: dataDouble))
        let stDevString:String = String(format: "%.4f", findStandardDeviation(data: dataDouble))
        
        MeanOutput.text = meanString
        MedianOutput.text = medianString
        StDevOutput.text = stDevString
        
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataInput.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dataInput.resignFirstResponder()
    }
    
    
    func findMean(data:[Double]) -> Double {
        var total: Double = 0.0
        for (index, num) in data.enumerated() {
            total += num
        }

        return (total / Double(data.count))
    }
    
    func findMedian(data:[Double]) -> Double {
        var lengthOfArray:Double = Double(data.count)
        var averageOfTwo:Double = 0.00
        var medianOfOddDataSet:Double = 0.00
        if(Int(lengthOfArray) % 2 == 0) {
            averageOfTwo = (data[(data.count/2) - 1] + data[data.count/2]) / 2.00
            return averageOfTwo
        }
        medianOfOddDataSet = data[((data.count - 1)/2)]
        return medianOfOddDataSet
    }
    
    func findStandardDeviation(data:[Double]) -> Double {
        var mean:Double = findMean(data: data)
        var totalDistMean:Double = 0.00
        var distMean:Double = 0.00
        for (index, num) in data.enumerated() {
            distMean = num - mean
            totalDistMean += pow(distMean, 2)
        }
        var variability:Double = totalDistMean / Double(data.count - 1)
        return sqrt(variability)
        
    }
    
    func findRange(data:[Double]) -> Double {
        return 1.00
    }
    
    func findIQR(data:[Double]) -> Double {
        return 1.00
    }
    

}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


