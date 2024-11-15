//
//  UserDetailRepresentableViewController.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/15/24.
//

import Foundation
import SwiftUI

struct UserDetailRepresentableViewController: UIViewControllerRepresentable {
    let user: User
    
    func updateUIViewController(_ uiViewController: UserDetailViewController, context: Context) {
        // do nothing
    }
    
    func makeUIViewController(context: Context) -> UserDetailViewController {
        let userDetailVc = UserDetailViewController()
        userDetailVc.user = user
        return userDetailVc
    }
}
