import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class PhoneController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    
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
        if phoneTextField.text!.count == 20 && nameTextField.text!.count > 3{
            let number = phoneTextField.text![1..<2] + phoneTextField.text![4..<7] + phoneTextField.text![9..<12] + phoneTextField.text![14..<16] + phoneTextField.text![18..<20]
            let parameters = ["phone" : String(number), "name" : nameTextField.text!]
            AF.request(GlobalVariables.url + "users/phone/otp/", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                let json = try? JSON(data: response.data!)
                if (json!["status"] == "ok") {
                    self.defaults.set(String(number), forKey: "PhoneNumber")
                    self.defaults.set(self.nameTextField.text!, forKey: "Name")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier :"ValidationController")
                    self.present(viewController, animated: true)
                }
            }
        }
        else{
            let alert = UIAlertController(title: "Назар аудар!", message: "Аты-жөніңізді немесе нөміріңізді дұрыстаңыз.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
}
