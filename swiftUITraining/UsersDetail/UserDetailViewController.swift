//
//  UserDetailViewController.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/15/24.
//

import UIKit

class UserDetailViewController: UIViewController {
    var user: User? = nil
    @IBOutlet weak var coverPhotoView: UIImageView!
    @IBOutlet weak var profilePhotoView: UIImageView!
    @IBOutlet weak var profilePhotoBackground: UIView!
    
    @IBOutlet weak var addressDetailsBg: UIView!
    @IBOutlet weak var personalDetailsBg: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var coverPhotoImage: UIImageView!
    @IBOutlet weak var profilePictureImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCoverPhoto()
        setupProfilePhoto()
        setupProfilePhotoBackground()
        addShadow(for: personalDetailsBg)
        addShadow(for: addressDetailsBg)
        
        //add data
        self.nameLabel.text = user?.name
        self.usernameLabel.text = user?.username
        self.emailLabel.text = user?.email
        self.phoneLabel.text = user?.phone
        self.addressLabel.text = user?.address
        self.zipLabel.text = user?.zip
        self.stateLabel.text = user?.state
        self.countryLabel.text = user?.country
        
        // Load and set cover photo
        if let coverPhotoURLString = user?.photo, let coverPhotoURL = URL(string: coverPhotoURLString) {
            URLSession.shared.dataTask(with: coverPhotoURL) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.coverPhotoImage.image = image
                    }
                } else {
                    print("Error loading cover photo: \(error?.localizedDescription ?? "Unknown error")")
                }
            }.resume()
        }
        
        // Load and set profile picture
        if let profilePhotoURLString = user?.photo, let profilePhotoURL = URL(string: profilePhotoURLString) {
            URLSession.shared.dataTask(with: profilePhotoURL) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.profilePictureImage.image = image
                    }
                } else {
                    print("Error loading profile picture: \(error?.localizedDescription ?? "Unknown error")")
                }
            }.resume()
        }
        
    }
    
    
    private func setupCoverPhoto() {
        coverPhotoView.contentMode = .scaleAspectFill
        coverPhotoView.clipsToBounds = true
    }
    
    private func setupProfilePhoto() {
        profilePhotoView.contentMode = .scaleAspectFill
        profilePhotoView.layer.cornerRadius = profilePhotoView.frame.width / 2
        profilePhotoView.clipsToBounds = true
        profilePhotoView.layer.masksToBounds = true
    }
    
    private func setupProfilePhotoBackground() {
        profilePhotoBackground.layer.cornerRadius = profilePhotoBackground.frame.width / 2
        profilePhotoBackground.layer.shadowColor = UIColor.black.cgColor
        profilePhotoBackground.layer.shadowOpacity = 0.5
        profilePhotoBackground.layer.shadowRadius = 8
    }
    private func addShadow(for view: UIView) {
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 3, height: 4)
        view.layer.shadowRadius = 10
        view.layer.cornerRadius = 10
//        view.layer.masksToBounds = false
    }
}
