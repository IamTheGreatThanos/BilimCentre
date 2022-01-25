import UIKit

class SubjectsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var subjectTitle: UILabel!
    @IBOutlet weak var subjectIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
