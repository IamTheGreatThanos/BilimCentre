import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class SendQuestionController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var image1View: UIImageView!
    @IBOutlet weak var image2View: UIImageView!
    
    let defaults = UserDefaults.standard
    let imagePicker = UIImagePickerController()
    
    var selectedImage = 1
    
    var image1 = ""
    var image2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            let resizedImage = pickedImage.resizeWithWidth(width: 480)!
            let compressData = pickedImage.jpegData(compressionQuality: 0.0) //max value is 1.0 and minimum is 0.0
            let compressedImage = UIImage(data: compressData!)!
            dismiss(animated: true, completion: nil)
            
            let imgStr = compressData!.base64EncodedString()
            if selectedImage == 1{
                image1 = imgStr
                image1View.image = compressedImage
            }
            else{
                image2 = imgStr
                image2View.image = compressedImage
            }
        }
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        let headers: HTTPHeaders = [
            "Authorization": "Token " + defaults.string(forKey: "Token")!,
          "Accept": "application/json"
        ]
        var imgList = [String]()
        if image1 != ""{
            imgList.append(image1)
        }
        if image2 != ""{
            imgList.append(image2)
        }
        let parameters = ["images" : imgList, "question" : questionTextField.text!] as [String : Any]
        AF.request(GlobalVariables.url + "ent/question", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            let json = try? JSON(data: response.data!)
            print(json)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setImage1(_ sender: UIButton) {
        selectedImage = 1
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func setImage2(_ sender: UIButton) {
        selectedImage = 2
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

