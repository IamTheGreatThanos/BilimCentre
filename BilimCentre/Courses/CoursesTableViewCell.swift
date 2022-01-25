import UIKit

class CoursesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ava: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var experience: UILabel!
    @IBOutlet weak var education: UILabel!
    @IBOutlet weak var about: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
