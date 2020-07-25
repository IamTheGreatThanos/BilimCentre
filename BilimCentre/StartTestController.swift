import UIKit
import Foundation

class StartTestController: UIViewController {
    
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var mainFirstSubject: UIButton!
    @IBOutlet weak var mainSecondSubject: UIButton!
    @IBOutlet weak var mainThirdSubject: UIButton!
    
    var switcher = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainFirstSubject.isEnabled = false
        mainSecondSubject.isEnabled = false
        mainThirdSubject.isEnabled = false
        
        mainFirstSubject.borderColor = UIColor.white
        mainSecondSubject.borderColor = UIColor.white
        mainThirdSubject.borderColor = UIColor.white
    }
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0)
        {
            self.switcher = 0
            
            mainFirstSubject.isEnabled = false
            mainSecondSubject.isEnabled = false
            mainThirdSubject.isEnabled = false
            
            mainFirstSubject.borderColor = UIColor.white
            mainSecondSubject.borderColor = UIColor.white
            mainThirdSubject.borderColor = UIColor.white
        }
        else{
            self.switcher = 1
            
            mainFirstSubject.isEnabled = true
            mainSecondSubject.isEnabled = true
            mainThirdSubject.isEnabled = true
            
            mainFirstSubject.borderColor = UIColor.black
            mainSecondSubject.borderColor = UIColor.black
            mainThirdSubject.borderColor = UIColor.black
        }
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Назар салыңыз!", message: "Тестты бастағыңыз келеді ме?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"ProfileController")
            self.present(viewController, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { action in
            
        }))
        
        self.present(alert, animated: true)
    }
    
}
