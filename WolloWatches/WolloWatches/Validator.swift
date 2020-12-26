//
//  Validator.swift
//  WolloWatches
//
//  Created by Teslenko Anastasiya on 15.09.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import Foundation

class Validator {
    
    func emailValidator(_ value: String) throws -> String {
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z'_-]([A-Z0-9a-z'_.-]){4,28}[A-Z0-9a-z'_-]@gmail\\.com$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Invalid e-mail Address")
            }
        } catch {
            throw ValidationError("Invalid e-mail Address")
        }
        return value
    }
    
  
    func passwordValidator(_ value: String) throws -> String {
        guard value.count >= 4 else {
            throw ValidationError("Password must contain more than four characters" )
        }
        guard value.count < 15 else {
            throw ValidationError("Password shoudn't conain more than 15 characters")
            
        }
        
        do {
            if try NSRegularExpression(pattern: "^[!%?*_,.A-Za-z0-9]{4,15}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Invalid password. Password can conain only !%?*_,.A-Za-z0-9 characters")
            }
        } catch {
            throw ValidationError("Invalid password. Password can conain only !%?*_,.A-Za-z0-9 characters")
        }
        return value
    }
    
    func userNameValidator(_ value: String) throws -> String {
        guard value.count >= 3 else {
            throw ValidationError("Username must contain more than three characters" )
        }
        guard value.count < 15 else {
            throw ValidationError("Username shoudn't conain more than 15 characters" )
        }

        do {
            if value.range(of: "^[A-Z]", options: .regularExpression) == nil {
                throw ValidationError("Invalid username. Username should start with a capital letter")
            }
        } catch {
            throw ValidationError("Invalid username. Username should start with a capital letter")
        }
        
        do {
            if try NSRegularExpression(pattern: "^[a-z]{3,15}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Invalid username, username should not contain whitespaces, numbers or special characters")
            }
        } catch {
            throw ValidationError("Invalid username, username should not contain whitespaces, numbers or special characters")
        }
        
        return value
    }
}

class ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}
