import UIKit

class LessonsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lessonNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
