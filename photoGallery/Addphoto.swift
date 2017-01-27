

import UIKit

class Addphoto: UIViewController {
    
    
    
    @IBOutlet weak var titleTextFiled: UITextField!
    @IBOutlet weak var photo: UIImageView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func gallerySelect(_ sender: Any) {
        print("gallery select")
    }
    
    @IBAction func cameraButton(_ sender: Any) {
        print("Camera select")
    }
    @IBAction func addButton(_ sender: Any) {
        print("Add a new photo")
    }
}
