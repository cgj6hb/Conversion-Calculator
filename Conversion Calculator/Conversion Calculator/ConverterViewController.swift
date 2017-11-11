//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Chris Jansson on 11/10/17.
//  Copyright © 2017 Chris Jansson. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var converters = [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                      Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                      Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                      Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inputDisplay.text = "°F"
        outputDisplay.text = "°C"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleConverterPressed(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Choose Converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        for converter in converters {
            actionSheet.addAction(UIAlertAction(title: converter.label, style: UIAlertActionStyle.default, handler: { (alertAction) in
                self.inputDisplay.text = converter.inputUnit
                self.outputDisplay.text = converter.outputUnit
            }))
        }
        
         self.present(actionSheet, animated:true, completion: nil)
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
