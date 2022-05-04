//
//  ComposeViewController.swift
//  ProjectShareiOS
//
//  Created by Nicolas Lara on 5/3/22.
//

import UIKit
import AlamofireImage
import Parse

class ComposeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var techStackField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newProject(_ sender: Any) {
        let post = PFObject(className: "Project")
        post["title"] = titleField.text
        post["username"] = PFUser.current()?.username
        post["description"] = descriptionField.text
        post["tech_stack"] = techStackField.text
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        post["image"] = file
        
        post.saveInBackground{(success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("Saved")
            }else{
                print("Error")
            }
        }
        
    }
    
    @IBAction func onCameraTap(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        }else{
            picker.sourceType = .photoLibrary
        }
        
        present(picker,animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageScaled(to: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
