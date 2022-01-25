import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class FeedBackController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var commentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if commentTextView.text == "Ұсыныс немесе қателік..."{
            textView.text = ""
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        if commentTextView.text != "Ұсыныс немесе қателік..." && commentTextView.text != ""{
            let parameters = ["text" : commentTextView.text!]
            AF.request(GlobalVariables.url + "users/feedback", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                switch response.result {
                case .success(_):
                    let json = try? JSON(data: response.data!)
                    if json != nil {
                        let alert = UIAlertController(title: "Назар аудар!", message: "Сіздің ұсыныс қабылданды!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
                        self.present(alert, animated: true)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
