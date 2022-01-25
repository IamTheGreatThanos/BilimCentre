import UIKit
import Foundation

class StartTestController: UIViewController {
    
    @IBOutlet weak var button1Outlet: UIButton!
    @IBOutlet weak var button2Outlet: UIButton!
    @IBOutlet weak var button3Outlet: UIButton!
    @IBOutlet weak var button4Outlet: UIButton!
    @IBOutlet weak var button5Outlet: UIButton!
    @IBOutlet weak var button6Outlet: UIButton!
    @IBOutlet weak var button7Outlet: UIButton!
    @IBOutlet weak var button8Outlet: UIButton!
    @IBOutlet weak var button9Outlet: UIButton!
    @IBOutlet weak var button10Outlet: UIButton!
    @IBOutlet weak var button11Outlet: UIButton!
    @IBOutlet weak var button12Outlet: UIButton!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var mainFirstSubject: UIButton!
    @IBOutlet weak var mainSecondSubject: UIButton!
    @IBOutlet weak var mainThirdSubject: UIButton!
    
    var switcher = 0
    var selectedItems = 0
    var firstSelected = 0
    var secondSelected = 0
    
    let defaults = UserDefaults.standard
    
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
            button1Outlet.borderColor = UIColor.black
            button2Outlet.borderColor = UIColor.black
            button3Outlet.borderColor = UIColor.black
            button4Outlet.borderColor = UIColor.black
            button5Outlet.borderColor = UIColor.black
            button6Outlet.borderColor = UIColor.black
            button7Outlet.borderColor = UIColor.black
            button8Outlet.borderColor = UIColor.black
            button9Outlet.borderColor = UIColor.black
            button10Outlet.borderColor = UIColor.black
            button11Outlet.borderColor = UIColor.black
            button12Outlet.borderColor = UIColor.black
            
            self.selectedItems = 0
            self.switcher = 0
            self.firstSelected = 0
            self.secondSelected = 0
            
            mainFirstSubject.isEnabled = false
            mainSecondSubject.isEnabled = false
            mainThirdSubject.isEnabled = false
            
            mainFirstSubject.borderColor = UIColor.white
            mainSecondSubject.borderColor = UIColor.white
            mainThirdSubject.borderColor = UIColor.white
        }
        else{
            button1Outlet.borderColor = UIColor.black
            button2Outlet.borderColor = UIColor.black
            button3Outlet.borderColor = UIColor.black
            button4Outlet.borderColor = UIColor.black
            button5Outlet.borderColor = UIColor.black
            button6Outlet.borderColor = UIColor.black
            button7Outlet.borderColor = UIColor.black
            button8Outlet.borderColor = UIColor.black
            button9Outlet.borderColor = UIColor.black
            button10Outlet.borderColor = UIColor.black
            button11Outlet.borderColor = UIColor.black
            button12Outlet.borderColor = UIColor.black
            
            self.selectedItems = 0
            self.switcher = 1
            self.firstSelected = 0
            self.secondSelected = 0
            
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
        if switcher == 0{
            if selectedItems == 2{
                alertShow(count: 2)
            }
            else{
                let alert = UIAlertController(title: "Назар аудар!", message: "Дұрыс таңдау жасаңыз.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
        else{
            if selectedItems == 1{
                alertShow(count: 1)
            }
            else{
                let alert = UIAlertController(title: "Назар аудар!", message: "Дұрыс таңдау жасаңыз.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    func alertShow(count: Int){
        let alert = UIAlertController(title: "Назар салыңыз!", message: "Тестты бастағыңыз келеді ме?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Иә", style: .default, handler: { action in
            if count == 2{
                self.defaults.set("UNT", forKey: "TestType")
                self.defaults.set(String(self.firstSelected), forKey: "Subject1")
                self.defaults.set(String(self.secondSelected), forKey: "Subject2")
            }
            else{
                self.defaults.set("Subject", forKey: "TestType")
                self.defaults.set(String(self.firstSelected), forKey: "Subject1")
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"PastTestController")
            self.present(viewController, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Жоқ", style: .cancel, handler: { action in
            
        }))
        
        self.present(alert, animated: true)
    }
    
    func selectItem(button: UIButton, id: Int){
        if switcher == 0{
            if button.borderColor == UIColor.black{
                if self.selectedItems < 2{
                    button.borderColor = UIColor.red
                    selectedItems += 1
                    if firstSelected == 0{
                        firstSelected = id
                    }
                    else{
                        secondSelected = id
                    }
                }
            }
            else if button.borderColor == UIColor.red{
                selectedItems -= 1
                button.borderColor = UIColor.black
                if firstSelected == id{
                    firstSelected = 0
                }
                else{
                    secondSelected = 0
                }
            }
        }
        else{
            if button.borderColor == UIColor.black{
                if self.selectedItems < 1{
                    button.borderColor = UIColor.red
                    selectedItems += 1
                    if firstSelected == 0{
                        firstSelected = id
                    }
                    else{
                        secondSelected = id
                    }
                }
            }
            else if button.borderColor == UIColor.red{
                selectedItems -= 1
                button.borderColor = UIColor.black
                if firstSelected == id{
                    firstSelected = 0
                }
                else{
                    secondSelected = 0
                }
            }
        }
    }
    
    @IBAction func button1(_ sender: UIButton) {
        selectItem(button: sender, id: 1)
    }
    @IBAction func button2(_ sender: UIButton) {
        selectItem(button: sender, id: 2)
    }
    @IBAction func button3(_ sender: UIButton) {
        selectItem(button: sender, id: 3)
    }
    @IBAction func button4(_ sender: UIButton) {
        selectItem(button: sender, id: 4)
    }
    @IBAction func button5(_ sender: UIButton) {
        selectItem(button: sender, id: 5)
    }
    @IBAction func button6(_ sender: UIButton) {
        selectItem(button: sender, id: 6)
    }
    @IBAction func button7(_ sender: UIButton) {
        selectItem(button: sender, id: 7)
    }
    @IBAction func button8(_ sender: UIButton) {
        selectItem(button: sender, id: 8)
    }
    @IBAction func button9(_ sender: UIButton) {
        selectItem(button: sender, id: 9)
    }
    @IBAction func button10(_ sender: UIButton) {
        selectItem(button: sender, id: 10)
    }
    @IBAction func button11(_ sender: UIButton) {
        selectItem(button: sender, id: 11)
    }
    @IBAction func button12(_ sender: UIButton) {
        selectItem(button: sender, id: 13)
    }
    
    
}
