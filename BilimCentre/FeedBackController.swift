import UIKit
import Foundation

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
        
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
    
}
