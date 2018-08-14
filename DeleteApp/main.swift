//
//  main.swift
//  DeleteApp
//
//  Created by Nathan Standage on 8/3/18.
//  Copyright © 2018 Nathan Standage. All rights reserved.
//

import Foundation

let actionController = ActionController(fileManager: FileManager())
DirectoryCleaner.printIntro()


for item in actionController.itemPaths {
    
    DirectoryCleaner.printIntructionsFor(fileName: item)
    var response = readLine()?.lowercased()

    while ActionController.isInputValid(input: response!) != true {
        DirectoryCleaner.printValidInputError()
        response = readLine()?.lowercased()
        
    }
    
    switch response {
    case "d": actionController.deleteFileAt(path: item)
    case "k": actionController.keepFile()
    case "q": actionController.quitApp()
    default: print("Sorry, nothing left here.")
    }
}

print("\n-------------------------")
print("Thanks for using Directory Cleaner.")
print("\n-------------------------")











