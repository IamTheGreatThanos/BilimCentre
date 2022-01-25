import UIKit

class ClassesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageBG: UIImageView!
    @IBOutlet weak var classOf: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
