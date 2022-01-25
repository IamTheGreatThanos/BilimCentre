import UIKit
import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

class ProfileController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var avaImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    let defaults = UserDefaults.standard
    var UID = ""
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UID = defaults.string(forKey: "UID")!
        phoneLabel.text = defaults.string(forKey: "PhoneNumber")!
        nameLabel.text = defaults.string(forKey: "Name")!
        imagePicker.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getProfileData()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            let resizedImage = pickedImage.resizeWithWidth(width: 480)!
            let compressData = pickedImage.jpegData(compressionQuality: 0.0) //max value is 1.0 and minimum is 0.0
            let compressedImage = UIImage(data: compressData!)!
            avaImage.image = compressedImage
            dismiss(animated: true, completion: nil)
            
            let headers: HTTPHeaders = [
                "Authorization": "Token " + defaults.string(forKey: "Token")!,
              "Accept": "application/json"
            ]
            
            let imgStr = compressData!.base64EncodedString()
            let parameters = ["avatar" : imgStr]
            AF.request(GlobalVariables.url + "users/avatar", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                let json = try? JSON(data: response.data!)
            }
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeButton(_ sender: UIButton) {
        defaults.set(emailLabel.text, forKey: "Email")
        defaults.set(idLabel.text, forKey: "IIN")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"EditProfileController")
        self.present(viewController, animated: true)
    }
    
    func getProfileData(){
        let headers: HTTPHeaders = [
            "Authorization": "Token " + defaults.string(forKey: "Token")!,
          "Accept": "application/json"
        ]
        
        AF.request(GlobalVariables.url + "users/" + UID + "/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            let json = try? JSON(data: response.data!)
            print(json)
            if json!["email"] == JSON.null{
                self.emailLabel.text = "Мағұлмат жоқ"
            }
            else{
                self.emailLabel.text = json!["email"].string
            }
            if json!["uin"] == JSON.null{
                self.idLabel.text = "Мағұлмат жоқ"
            }
            else{
                self.idLabel.text = json!["uin"].string
            }
            if json!["avatar"].string != (GlobalVariables.url + "media/default/default.png") && json!["avatar"] != nil{
                let url = URL(string: json!["avatar"].stringValue)
                self.avaImage.kf.setImage(with: url)
                self.defaults.set(url, forKey: "AvaURL")
            }
        }
    }
    
    @IBAction func changeAva(_ sender: UIButton) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}
