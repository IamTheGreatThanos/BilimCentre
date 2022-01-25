import UIKit
import Foundation
import SwiftyJSON
import Alamofire

class EditProfileController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var iinTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = defaults.string(forKey: "Email")
        iinTextField.text = defaults.string(forKey: "IIN")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let headers: HTTPHeaders = [
            "Authorization": "Token " + defaults.string(forKey: "Token")!,
          "Accept": "application/json"
        ]
        var parameters = [String:String]()
        if emailTextField.text! != defaults.string(forKey: "Email"){
            parameters["email"] = emailTextField.text!
        }
        if iinTextField.text! != defaults.string(forKey: "IIN"){
            parameters["uin"] = iinTextField.text!
        }
        AF.request(GlobalVariables.url + "users/" + defaults.string(forKey: "UID")! + "/", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            let json = try? JSON(data: response.data!)
        }
        defaults.set(emailTextField.text, forKey: "Email")
        defaults.set(iinTextField.text, forKey: "IIN")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
