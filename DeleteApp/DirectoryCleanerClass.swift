//
//  Error.swift
//  DeleteApp
//
//  Created by Nathan Standage on 8/9/18.
//  Copyright © 2018 Nathan Standage. All rights reserved.
//

import Foundation


enum ActionErrorType: String, Error {
    case optional = "The optional could not be unwrapped"
    case misc = "MISC error yo"
    

}

class DirectoryCleaner {
    
    static func printError(_ error: Error) {
        print("-------------------------\n")
        print("Sorry, we encountered an error.\nError: \(error)")
        print("-------------------------\n")
    }
    
    static func printIntro() {
        print("\n-------------------------\n")
        print("Welcome to Directory Cleaner.")
        print("\n-------------------------\n")
    }
    
    static func printIntructionsFor(fileName: String) {
        print("\nWhat would you like to do with the file named \(fileName)?")
        print("\n(Keep = k | Delete = d | Quit = q)")
        
    }
    
    static func printInfo(path: String) {
        
    }
    
    static func printValidInputError() {
        print("\nPlease enter a valid option (1 letter) and press enter.")
    }
    
}
