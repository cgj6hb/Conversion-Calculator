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
    
    var valueString = ""
    var valueOutputString = ""
    var value = 0.0
    
    var currentConverter: Converter?
    var converters = [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                      Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                      Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                      Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inputDisplay.text = "°F"
        outputDisplay.text = "°C"
        
        currentConverter = converters[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleConverterPressed(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Choose Converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        for converter in converters {
            actionSheet.addAction(UIAlertAction(title: converter.label, style: UIAlertActionStyle.default, handler: { (alertAction) in
                self.currentConverter = converter
                self.inputDisplay.text = self.valueString + converter.inputUnit
                
                if self.valueOutputString != "" {
                    self.convert()
                }
                
                self.outputDisplay.text = self.valueOutputString + converter.outputUnit
            }))
        }
        
         self.present(actionSheet, animated:true, completion: nil)
    }
    
    @IBAction func handleButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        // Numpad
        case 0...9:
            valueString += String(sender.tag)
            inputDisplay.text = valueString + currentConverter!.inputUnit
            convert()
            
        // Decimal point
        case -1:
            // If there's already a decimal point in the number, don't add another one
            if valueString.characters.contains(".") {
                break
            } else {
                valueString += String(".")
                inputDisplay.text = valueString + currentConverter!.inputUnit
            }
            
        // Clear button
        case -2:
            inputDisplay.text = currentConverter!.inputUnit
            outputDisplay.text = currentConverter!.outputUnit
            valueString = ""
            valueOutputString = ""
            
        // Plus/minus sign
        case -3:
            // First, get the current value of the input
            var value: Int? = Int(valueString)
            
            if value != nil  {
                value = value! * -1
                valueString = String(value!)
            }
            
            inputDisplay.text = valueString + currentConverter!.inputUnit
            convert()
            
        default:
            print("Invalid input")
        }
    }
    
    func convert() {
        if valueString != "" {
            value = Double(valueString)!
            
            switch currentConverter!.label {
            case "fahrenheit to celcius":
                value = (Double) (value - 32) / 1.8
                
            case "celcius to fahrenheit":
                value = value * 1.8 + 32
                
            case "miles to kilometers":
                value = value * 1.609344
                
            case "kilometers to miles":
                value = value / 1.609344
                
            default:
                print("Unable to convert value")
            }
            
            //update outputDisplay
            valueOutputString = String(format: "%.2f", value)
            outputDisplay.text = valueOutputString + currentConverter!.outputUnit
        }
    }
}
