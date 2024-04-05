import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var stepperOutlet: UIStepper!
    
    @IBOutlet weak var zeroPercentOutlet: UIButton!
    
    @IBOutlet weak var tenPercentOutlet: UIButton!
    
    @IBOutlet weak var twentyPercentOutlet: UIButton!
    
    @IBOutlet weak var billTextLabel: UITextField!
    
    
    var counter = 2
    var percent = 10.0
    var billTotal = 0.0
    var Result = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billTextLabel.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func splitStepper(_ sender: UIStepper) {
        stepperOutlet.minimumValue = 1
        counter = Int(stepperOutlet.value)
        splitLabel.text = "\(counter)"
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        
        billTextLabel.endEditing(true)
        percent = 0.0
        
        zeroPercentOutlet.isSelected = true
        
        tenPercentOutlet.isSelected = false
        
        twentyPercentOutlet.isSelected = false
    }
    
    @IBAction func tenButton(_ sender: UIButton) {
        
        billTextLabel.endEditing(true)
        percent = 10.0
        
        zeroPercentOutlet.isSelected = false
        
        tenPercentOutlet.isSelected = true
        
        twentyPercentOutlet.isSelected = false
    }
    
    @IBAction func twentyButton(_ sender: UIButton) {
        
        billTextLabel.endEditing(true)
        percent = 20.0
        
        zeroPercentOutlet.isSelected = false
        
        tenPercentOutlet.isSelected = false
        
        twentyPercentOutlet.isSelected = true
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextLabel.text ?? ""
                if bill != "" {
                    
                    billTotal = Double(bill.replacingOccurrences(of: ",", with: ".")) ?? 0.0
                    let result = billTotal * (1 + (percent/100)) / Double(counter)
                    Result = String(format: "%.2f", result)
                }
                self.performSegue(withIdentifier: "goToResults", sender: self)
            }
            
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
                if segue.identifier == "goToResults" {
                    
                    let destinationVC = segue.destination as! SecondViewController
                    destinationVC.result = Result
                    destinationVC.tip = Int(percent)
                    destinationVC.split = counter
                }
    }
    
    
}

