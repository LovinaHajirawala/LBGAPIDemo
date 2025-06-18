//
//  LoginModel.swift
//  LBGAPIDemo
//
//  Created by Lovina v. Hajirawala on 18/06/25.
//

import Foundation

class LoginViewModel {
    
    var getData = HTTPUtility()
    var users : [UserResponse] = []
    
    func ifValidationSucceeds() {
        // then call the api
        getUserResponse {
            print(self.users)
        }
    }
    
    func ifValidationFails() {
        // show the error message
    }
    
    func getUserResponse(completion: @escaping () -> Void) {
    
        HTTPUtility.shared.getData(from: loginURL, type: [UserResponse].self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case.success(let users):
                    self?.users = users
                case.failure(let error):
                    print(error.localizedDescription)
                }
                completion()
            }
        }
    }
    
    // end of view model
}
