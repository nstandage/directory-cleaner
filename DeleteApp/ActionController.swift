//
//  ActionController.swift
//  DeleteApp
//
//  Created by Nathan Standage on 8/3/18.
//  Copyright © 2018 Nathan Standage. All rights reserved.
//



import Foundation


enum ActionType: String {
    case delete = "d"
    case keep = "k"
    case quit = "q"
}

class ActionController {
    
    let fileManager: FileManager
    var currentDirectory: String
    var itemPaths: [String]
    
    init(fileManager: FileManager) {
        
        self.fileManager = fileManager
        currentDirectory = fileManager.currentDirectoryPath
//        currentDirectory = "/Users/Nathan/Developer/DeleteApp/test_folder"
        do {
            try itemPaths = fileManager.contentsOfDirectory(atPath: currentDirectory)
        } catch {
            DirectoryCleaner.printError(error)
            fatalError()
        }
    }
    
    func deleteFileAt(path: String) {
        do {try fileManager.trashItem(at: URL(fileURLWithPath: currentDirectory + "/" + path), resultingItemURL: nil)
        } catch {
            DirectoryCleaner.printError(error)
        }
        print("\n\(path) has been deleted.\n")
        print("_____________________________")
    }
    
    func infoForFileAt(path: String) {
        do {
            let attributes = try fileManager.attributesOfItem(atPath: currentDirectory + "/" + path)
            for attribute in attributes {
                print(attribute)
            }
        } catch {
            DirectoryCleaner.printError(error)
        }
    }
    
    func keepFile() {
        print("\nKeeping...\n")
        print("_____________________________")
    }
    
    static func unwrap(optional: String?) throws -> String {
        
        guard let unwrappedString = optional else {
            throw ActionErrorType.optional
        }
        return unwrappedString
    }
    
    func quitApp() {
        print("\n-------------------------")
        print("Quitting... Thanks for using Directory Cleaner")
        print("\n-------------------------")
        
        exit(0)
    }
    
    static func isInputValid(input: String) -> Bool {
        
        switch input {
        case "d": return true
        case "k": return true
        case "q": return true
        default: return false
        }
    }
}




