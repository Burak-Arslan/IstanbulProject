//
//  MainVM.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 5.04.2021.
//

import Foundation
class HomeVM: BaseVM {
    
    
    func getIstanbulInfo() -> IstanbulResponse? {
        do {
            guard let jsonData = readLocalFile(forName: "istanbul") else { return nil }
                let decodedData = try JSONDecoder().decode(IstanbulResponse.self,
                                                           from: jsonData)
       
            return decodedData
            } catch {
                print(error)
                return nil
                
            }
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
