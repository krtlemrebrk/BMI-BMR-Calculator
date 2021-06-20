import UIKit

class ResultViewController: UIViewController
{
    @IBOutlet weak var bmrLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var iwLabel: UILabel!
    
    var bmr: Float? = nil
    var bmi: Float? = nil
    var iw: Float? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        bmrLabel.text = String(format: "%.0f", bmr!)
        bmiLabel.text = String(format: "%.1f", bmi!)
        iwLabel.text = String(format: "%.0f", iw!)
        
        if bmi! < 18.5
        {
            view.backgroundColor = #colorLiteral(red: 0, green: 0.7349876951, blue: 0.7419334951, alpha: 1)
        }
        else if bmi! < 25
        {
            view.backgroundColor = #colorLiteral(red: 0.001748037812, green: 0.6156191585, blue: 0.002712239824, alpha: 1)
        }
        else if bmi! < 30
        {
            view.backgroundColor = #colorLiteral(red: 0.8544155853, green: 0.8421499507, blue: 0.005396146141, alpha: 1)
        }
        else if bmi! < 40
        {
            view.backgroundColor = #colorLiteral(red: 0.8355749882, green: 0.4847389727, blue: 0.0107507717, alpha: 1)
        }
        else
        {
            view.backgroundColor = #colorLiteral(red: 0.7769985777, green: 0.1162318473, blue: 0.006713099508, alpha: 1)
        }
    }
    
    @IBAction func recalculateClicked(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
