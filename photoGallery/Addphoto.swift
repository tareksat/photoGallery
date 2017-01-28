

import UIKit

class Addphoto: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var addUpdateBtn: UIButton!
    
    
    @IBOutlet weak var titleTextFiled: UITextField!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var photo: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var _photo : ImageData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if _photo != nil{
            photo.image = UIImage(data: _photo!.image as! Data)
            titleTextFiled.text = _photo?.title
            
            addUpdateBtn.setTitle("Update", for: .normal)
            
        }
        else{
            deleteBtn.isHidden = true
        }
        
    }
    
    @IBAction func gallerySelect(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        photo.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraButton(_ sender: Any) {
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func addButton(_ sender: Any) {
        
        if _photo != nil{ // update
            _photo?.title = titleTextFiled.text
            _photo?.image = UIImagePNGRepresentation(photo.image!) as! NSData?
        }
        else{ // add new
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let imageData = ImageData(context: context)
            
            imageData.title = titleTextFiled?.text
            
            imageData.image = UIImagePNGRepresentation(photo.image!) as NSData?
            
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
    @IBAction func deleteBTN(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(_photo!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
}
