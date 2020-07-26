import UIKit

class GrantsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var specialtyLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var allGrantsLabel: UILabel!
    @IBOutlet weak var fullEducationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
