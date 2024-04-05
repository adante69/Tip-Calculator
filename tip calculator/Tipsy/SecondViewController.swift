

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var result = ""
    var tip = 0
    var split = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = result
        descriptionLabel.text = "Split between \(split) people, with \(tip)% tip."
        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


}
