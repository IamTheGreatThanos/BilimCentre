import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var testName: UILabel!
    @IBOutlet weak var subjects: UILabel!
    @IBOutlet weak var points: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
