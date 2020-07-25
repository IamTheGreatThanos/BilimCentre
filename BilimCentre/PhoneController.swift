import UIKit
import Foundation

class PhoneController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        addDoneButtonOnKeyboard()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == phoneTextField{
            if self.phoneTextField.text!.count < 6{
                self.phoneTextField.text = "+7 ("
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == phoneTextField{
            if phoneTextField.text?.count == 3{
                phoneTextField.text = "+7 ("
            }
            
            if phoneTextField.text?.count == 7{
                phoneTextField.text! += ") "
            }
            if phoneTextField.text?.count == 8{
                phoneTextField.text! = String(phoneTextField.text!.prefix(6))
            }
            
            if phoneTextField.text?.count == 12{
                phoneTextField.text! += "  "
            }
            if phoneTextField.text?.count == 13{
                phoneTextField.text! = String(phoneTextField.text!.prefix(11))
            }
            if phoneTextField.text?.count == 16{
                phoneTextField.text! += "  "
            }
            if phoneTextField.text?.count == 17{
                phoneTextField.text! = String(phoneTextField.text!.prefix(15))
            }
            if phoneTextField.text?.count == 21{
                phoneTextField.text! = String(phoneTextField.text!.prefix(20))
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        phoneTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.view.endEditing(true)
    }
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"ValidationController")
        self.present(viewController, animated: true)
    }
    
}
