import UIKit

class CalculateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    let calculatorBrain = CalculatorBrain()
    let genders = ["Male", "Female"]
    var selectedGender = "Male"
    var bmr: Float? = nil
    var bmi: Float? = nil
    var iw: Float? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.genderPicker.delegate = self
        self.genderPicker.dataSource = self

        ageSlider.value = 20
        ageLabel.text = "\(Int(ageSlider.value)) yo"
        
        heightSlider.value = 180
        heightLabel.text = "\(Int(heightSlider.value)) cm"
        
        weightSlider.value = 70
        weightLabel.text = "\(Int(weightSlider.value)) kg"
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if row == 0
        {
            selectedGender = genders[0]
        }
        else
        {
            selectedGender = genders[1]
        }
    }
    
    @IBAction func ageSliderChanged(_ sender: UISlider)
    {
        ageLabel.text = "\(Int(ageSlider.value)) yo"
    }

    @IBAction func heightSliderChanged(_ sender: UISlider)
    {
        heightLabel.text = "\(Int(heightSlider.value)) cm"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider)
    {
        weightLabel.text = "\(Int(weightSlider.value)) kg"
    }
    
    @IBAction func calculateClicked(_ sender: UIButton)
    {
        let weight: Float = weightSlider.value
        let height: Float = heightSlider.value
        let age: Float = ageSlider.value
               
        bmr = calculatorBrain.calculateBMR(gender: selectedGender, height: height, weight: weight, age: age)
        bmi = calculatorBrain.calculateBMI(height: height, weight: weight)
        iw = calculatorBrain.calculateIW(gender: selectedGender, height: height, weight: weight)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "goToResult"
        {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmr = bmr
            destinationVC.bmi = bmi
            destinationVC.iw = iw
        }
    }
}
