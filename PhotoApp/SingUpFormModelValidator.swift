//
//  SingupFormModelValidator.swift
//  PhotoApp
//
//  Created by Natália Sapucaia on 01/02/23.
//

import Foundation

class SingUpFormModelValidator {

    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true

        if firstName.count < SignUpConstants.firstNameMinLength || firstName.count > SignUpConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }

    func isLastNameValid(lastName: String) -> Bool {
        var isValidLastName = true

        if lastName.count < SignUpConstants.lastNameMinLength || lastName.count > SignUpConstants.lastNameMaxLength {
            isValidLastName = false
        }

        return isValidLastName
    }

    func isValidEmail(email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }

    func isValidPassword(password: String)  -> Bool{
        var isValidPassword = true

        if password.count < SignUpConstants.passwordMinLength || password.count > SignUpConstants.passwordMaxLength {
            isValidPassword = false
        }

        return isValidPassword
    }

    func arePasswordsEqual(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
