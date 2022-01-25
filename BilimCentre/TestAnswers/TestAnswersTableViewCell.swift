import UIKit
import WebKit

class TestAnswersTableViewCell: UITableViewCell, WKNavigationDelegate {

    @IBOutlet weak var questionWebView: WKWebView!
    @IBOutlet weak var answerWebView: WKWebView!
    @IBOutlet weak var qHeight: NSLayoutConstraint!
    @IBOutlet weak var aHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        questionWebView.navigationDelegate = self
        answerWebView.navigationDelegate = self
    }
    
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        webView.frame.size.height = 1
//        webView.frame.size.height = webView.scrollView.contentSize.height
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
