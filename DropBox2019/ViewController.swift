//
//  ViewController.swift
//  DropBox2019
//
//  Created by Orazio Conte on 12/09/2019.
//  Copyright © 2019 Orazio Conte. All rights reserved.
//

import UIKit
import SwiftyDropbox

let file = "BasicFile.txt"
let text = "Text to send to your DropBox account"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // I create a text file to Documents folder through FileManager route
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let fileURL = dir.appendingPathComponent(file)
            
            // Writing
            do{
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }catch{
                print("Cant write…")
            }
            // I print on Xcode Output the route of the file generated
            print(fileURL)
        }
    }
    
    // Upload button for send the file to DropBox
    @IBAction func uploadBT(_ sender: Any) {
        // I call back the file through FileManager route
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0].appendingPathComponent(file)
        
        // I get a constant with the FileManager route
        let exportFilePath = documentsDirectory
        
        // I check API DropBox authorization
        let client = DropboxClientsManager.authorizedClient
        
        // I get the Upload
        client?.files.upload(path: "/BasicFile.txt", mode: .overwrite, autorename: false, clientModified: nil, mute: true, input: exportFilePath)
            .response { response, error in
                if let response = response {
                    print(response)
                } else if let error = error {
                    print(error)
                }
            }
            .progress { progressData in
                print(progressData)
        }
    }
    
    // Download button for get the file to Documents folder of my App
    @IBAction func downloadBT(_ sender: Any) {
        // I get the FileManager route
        let fileManager = FileManager.default
        let directoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let destURL = directoryURL.appendingPathComponent("/BasicFile.txt")
        let destination: (URL, HTTPURLResponse) -> URL = { temporaryURL, response in
            return destURL
        }
        
        // I check API DropBox authorization
        let client = DropboxClientsManager.authorizedClient
        
        // I get the Download
        client?.files.download(path: "/BasicFile.txt", overwrite: true, destination: destination)
            .response { response, error in
                if let response = response {
                    print(response)
                } else if let error = error {
                    print(error)
                }
            }
            .progress { progressData in
                print(progressData)
        }
    }
    
    // Read the file content
    @IBAction func readFileBT(_ sender: Any) {
        // I get the file route
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let file = "BasicFile.txt"
            let fileURL = dir.appendingPathComponent(file)
            
            // Reading
            do{
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                print(text)
            }catch{
                print("Cant read…")
            }
        }
        
    }
}

