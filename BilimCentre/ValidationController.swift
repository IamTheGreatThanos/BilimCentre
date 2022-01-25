import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class ValidationController: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var validateCodeTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneButtonOnKeyboard()
        validateCodeTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
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
        
        validateCodeTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.view.endEditing(true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == validateCodeTextField{
            if textField.text!.count == 5{
                validateCodeTextField.text = String(validateCodeTextField.text!.prefix(4))
            }
        }
    }
    
    
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if validateCodeTextField.text!.count == 4 {
            let number = defaults.string(forKey: "PhoneNumber")!
            let parameters = ["phone" : String(number), "code" : validateCodeTextField.text!]
            AF.request(GlobalVariables.url + "users/register/", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                let json = try? JSON(data: response.data!)
                print(json)
                if (json!["status"] == "ok") {
                    self.defaults.set(json!["key"].string, forKey: "Token")
                    self.defaults.set(String(json!["uid"].int!), forKey: "UID")
                    self.defaults.set(true, forKey: "isSignIn")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier :"SWRevealViewController")
                    self.present(viewController, animated: true)
                }
            }
        }
        else{
            let alert = UIAlertController(title: "Назар аудар!", message: "Код дұрыс емес.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
}
