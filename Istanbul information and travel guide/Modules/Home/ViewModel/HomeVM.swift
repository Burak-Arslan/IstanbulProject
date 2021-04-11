//
//  MainVM.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 5.04.2021.
//

import Foundation
import RxCocoa
import RxSwift

class HomeVM: BaseVM {
    var hisarInfo = PublishSubject<[DataSourceModel<Camiler>]>()
    var camilerInfo = PublishSubject<[DataSourceModel<Camiler>]>()
    var kilislereInfo = PublishSubject<[DataSourceModel<Camiler>]>()
    var saraylarInfo = PublishSubject<[DataSourceModel<Camiler>]>()
    var kasirlarInfo = PublishSubject<[DataSourceModel<Camiler>]>()
    var carsilarInfo = PublishSubject<[DataSourceModel<Camiler>]>()
    var muzelerInfo = PublishSubject<[DataSourceModel<Camiler>]>()


    let goHisaDetail = PublishSubject<Camiler>()

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
    
    func getHisarlar(){
        let jsonHisarlar = getIstanbulInfo()
        var hisarlarModel = [DataSourceModel<Camiler>]()
        hisarlarModel.append(DataSourceModel(header: "", items: jsonHisarlar?.hisarlar ?? []))
        self.hisarInfo.onNext(hisarlarModel)
    }
    
    func getCamiler(){
        let jsonCamiler = getIstanbulInfo()
        var camilerModel = [DataSourceModel<Camiler>]()
        camilerModel.append(DataSourceModel(header: "", items: jsonCamiler?.camiler ?? []))
        self.camilerInfo.onNext(camilerModel)
    }
    
    func getKiliseler(){
        let jsonKilseler = getIstanbulInfo()
        var kiliselerModel = [DataSourceModel<Camiler>]()
        kiliselerModel.append(DataSourceModel(header: "", items: jsonKilseler?.kiliseler ?? []))
        self.kilislereInfo.onNext(kiliselerModel)
    }
    
    func getSaraylar(){
        let jsonSaraylar = getIstanbulInfo()
        var saraylarModel = [DataSourceModel<Camiler>]()
        saraylarModel.append(DataSourceModel(header: "", items: jsonSaraylar?.saraylar ?? []))
        self.saraylarInfo.onNext(saraylarModel)
    }
    
    func getKasirlar(){
        let jsonKasirlar = getIstanbulInfo()
        var kasirlarModel = [DataSourceModel<Camiler>]()
        kasirlarModel.append(DataSourceModel(header: "", items: jsonKasirlar?.kasirlar ?? []))
        self.kasirlarInfo.onNext(kasirlarModel)
    }
    
    func getCarsilar(){
        let jsonCarsilar = getIstanbulInfo()
        var carsilarModel = [DataSourceModel<Camiler>]()
        carsilarModel.append(DataSourceModel(header: "", items: jsonCarsilar?.carsilar ?? []))
        self.carsilarInfo.onNext(carsilarModel)
    }
    
    func getMuzeler(){
        let jsonMuzeler = getIstanbulInfo()
        var muzelerModel = [DataSourceModel<Camiler>]()
        muzelerModel.append(DataSourceModel(header: "", items: jsonMuzeler?.muzeler ?? []))
        self.muzelerInfo.onNext(muzelerModel)
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
