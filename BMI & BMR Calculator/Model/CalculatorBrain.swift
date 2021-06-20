//
//  CalculatorBrain.swift
//  BMI & BMR Calculator
//
//  Created by Kartal Emre Buruk on 20.06.2021.
//

import Foundation

struct CalculatorBrain
{
    let genders = ["Male", "Female"]
    
    func calculateBMR(gender: String, height: Float, weight: Float, age: Float) -> Float
    {
        let bmrWeight: Float = 10 * weight
        let bmrHeight: Float = 6.25 * height
        let bmrAge: Float = 5 * age
        let bmrMale: Float = 5
        let bmrFemale: Float = -161
        var bmr: Float =  bmrWeight + bmrHeight - bmrAge + bmrMale
        if gender != genders[0]
        {
            bmr =  bmrWeight + bmrHeight - bmrAge + bmrFemale
        }
        return bmr
    }
    
    func calculateBMI(height: Float, weight: Float) -> Float
    {
        let bmiHeight: Float = height / 100
        let bmi: Float = weight / (bmiHeight * bmiHeight)
        return bmi
    }
    
    func calculateIW(gender: String, height: Float, weight: Float) -> Float
    {
        let cm2inch: Float = 0.39370
        let iwHeight: Float = 2.3 * (height * cm2inch - 60)
        let iwMale: Float = 50
        let iwFemale: Float = 45.5
        var iw: Float = iwMale + iwHeight
        if gender != genders[0]
        {
            iw =  iwFemale + iwHeight
        }
        return iw
    }
}
