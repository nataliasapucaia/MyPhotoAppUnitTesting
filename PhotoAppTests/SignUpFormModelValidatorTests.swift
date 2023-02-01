//
//  SignupFormValidatorTestes.swift
//  PhotoAppTests
//
//  Created by Natália Sapucaia on 01/02/23.
//

import XCTest
@testable import PhotoApp

class SignUpFormModelValidatorTests: XCTestCase {

    var sut: SingUpFormModelValidator!

    override func setUpWithError() throws {
        sut = SingUpFormModelValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: First Name Tests

    func testWhenValidFirstNameProvided_ShouldReturnTrue() {
        //Given
        let validName = "Natália"

        //When
        let isFirstNameValid = sut.isFirstNameValid(firstName: validName)

        //Then
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should return TRUE")
    }

    func testWhen2CharsFirstNameProvided_ShouldReturnTrue() {
        //Given
        let nameWith2Chars = "Wu"

        //When
        let isValidName = sut.isFirstNameValid(firstName: nameWith2Chars)

        //Then
        XCTAssertTrue(isValidName, "The isFirstNameValid() should return TRUE when name has \(SignUpConstants.firstNameMinLength) chars")
    }

    func testWhen10CharsFirstNameProvided_ShouldReturnTrue() {
        //Given
        let nameWith10Chars = "NataliaSap"

        //When
        let isValidName = sut.isFirstNameValid(firstName: nameWith10Chars)

        //Then
        XCTAssertTrue(isValidName, "The isFirstNameValid() should return TRUE when name has \(SignUpConstants.firstNameMaxLength) chars")
    }

    func testWhenTooShortFirstNameProvided_ShouldReturnFalse() {
        //Given
        let tooShortName = "A"

        //When
        let isFirstNameValid = sut.isFirstNameValid(firstName: tooShortName)

        //Then
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should return FALSE when the name is shorter than \(SignUpConstants.firstNameMinLength) chars")
    }

    func testWhenTooLongNameProvided_ShouldReturnFalse() {
        //Given
        let tooLongName = "NataliaNatalia"

        //When
        let isFirstNameValid = sut.isFirstNameValid(firstName: tooLongName)

        //Then
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should return FALSE when the name is longer than \(SignUpConstants.firstNameMaxLength) chars")
    }

    // MARK: Last Name Tests

    func testWhenValidLastNameProvided_ShouldReturnTrue() {
        //Given
        let validLastName = "Sapucaia"

        //When
        let isFirstNameValid = sut.isLastNameValid(lastName: validLastName)

        //Then
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should return TRUE")
    }

    func testWhen2CharsLastNameProvided_ShouldReturnTrue() {
        //Given
        let nameWith2Chars = "Wu"

        //When
        let isValidName = sut.isLastNameValid(lastName: nameWith2Chars)

        //Then
        XCTAssertTrue(isValidName, "The isFirstNameValid() should return TRUE when name has \(SignUpConstants.lastNameMinLength) chars")
    }

    func testWhen10CharsLastNameProvided_ShouldReturnTrue() {
        //Given
        let lastNameWith10Chars = "NataliaSapucaia"

        //When
        let isValidName = sut.isLastNameValid(lastName: lastNameWith10Chars)

        //Then
        XCTAssertTrue(isValidName, "The isFirstNameValid() should return TRUE when name has \(SignUpConstants.lastNameMaxLength) chars")
    }

    func testWhenTooShortLastNameProvided_ShouldReturnFalse() {
        //Given
        let tooShortName = "A"

        //When
        let isFirstNameValid = sut.isLastNameValid(lastName: tooShortName)

        //Then
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should return FALSE when the name is shorter than \(SignUpConstants.lastNameMinLength) chars")
    }

    func testWhenTooLongLastNameProvided_ShouldReturnFalse() {
        //Given
        let tooLongName = "NataliaNataliaNatalia"

        //When
        let isFirstNameValid = sut.isLastNameValid(lastName: tooLongName)

        //Then
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should return FALSE when the name is longer than \(SignUpConstants.lastNameMaxLength) chars")
    }

    // MARK: Email Address Tests

    func testWhenValidEmailProvided_ShouldReturnTrue() {
        //Given
        let validEmail = "natisapucaia@gmail.com"

        //When
        let isValidEmail = sut.isValidEmail(email: validEmail)

        //Then
        XCTAssertTrue(isValidEmail, "The isValidEmail should return TRUE when the email is valid")
    }

    func testWhenEmailWithNoAt_ShouldReturnFalse() {
        //Given
        let emailWithNoAt = "natisapucauagmail.com"
        //When
        let isValidEmail = sut.isValidEmail(email: emailWithNoAt)

        //Then
        XCTAssertFalse(isValidEmail, "The isValidEmail should return FALSE when @ is missing")
    }

    func testWhenEmailWithNoDomainProvided_ShouldReturnFalse() {
        //Given
        let noDomainEmail = "test@test"

        //When
        let isValidEmail = sut.isValidEmail(email: noDomainEmail)

        //Then
        XCTAssertFalse(isValidEmail, "The isValidEmail should return FALSE when domain is missing")
    }

    func testWhenEmailWithNoProviderProvided_ShouldReturnFalse() {
        //Given
        let noProviderEmail = "test@.com"

        //When
        let isValidEmail = sut.isValidEmail(email: noProviderEmail)

        //Then
        XCTAssertFalse(isValidEmail, "The isValidEmail should return FALSE when provider email is missing")
    }

    // MARK: Password tests

    func testWhenPasswordIsValid_ShouldReturnTrue() {
        //Given
        let validPassword = "12345678"

        //When
        let isValidPassword = sut.isValidPassword(password: validPassword)

        //Then
        XCTAssertTrue(isValidPassword, "The isValidPassword should return TRUE")
    }

    func testWhenPasswordIsTooShort_ShouldReturnTrue() {
        //Given
        let validPassword = "1234567"

        //When
        let isValidPassword = sut.isValidPassword(password: validPassword)

        //Then
        XCTAssertFalse(isValidPassword, "The isValidPassword should return FALSE")
    }

    func testWhenPasswordIsTooLong_ShouldReturnTrue() {
        //Given
        let validPassword = "12345678901234567"

        //When
        let isValidPassword = sut.isValidPassword(password: validPassword)

        //Then
        XCTAssertFalse(isValidPassword, "The isValidPassword should return FALSE")
    }

    // MARK: Equal Passwords Tests

    func testWhenEqualPasswordsProvided_ShouldReturnTrue() {
        //Given
        let password = "12345678"
        let repeatPassword = "12345678"

        //When
        let areEqualPasswords = sut.arePasswordsEqual(password: password, repeatPassword: repeatPassword)

        //Then
        XCTAssertTrue(areEqualPasswords, "The areEqualPassword should return FALSE")
    }

    func testWhenDifferentPasswordsProvided_ShouldReturnTrue() {
        //Given
        let password = "12345678"
        let repeatPassword = "1234567"

        //When
        let areEqualPasswords = sut.arePasswordsEqual(password: password, repeatPassword: repeatPassword)

        //Then
        XCTAssertFalse(areEqualPasswords, "The areEqualPassword should return FALSE")
    }
}
