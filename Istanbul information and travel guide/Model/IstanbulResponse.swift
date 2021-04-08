//
//  IstanbulResponse.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 8.04.2021.
//
import Foundation

// MARK: - IstanbulResponse
struct IstanbulResponse: Codable {
    let hisarlar, camiler, diniYapilar, kiliseler: [Camiler]?
    let saraylar, carsilar, kasirlar, muzeler: [Camiler]?
    let mimariYapilar, meydanlarTarihiYuruyusAlanlari: [Camiler]?

    enum CodingKeys: String, CodingKey {
        case hisarlar, camiler
        case diniYapilar = "dini_yapilar"
        case kiliseler, saraylar, carsilar, kasirlar, muzeler
        case mimariYapilar = "mimari_yapilar"
        case meydanlarTarihiYuruyusAlanlari = "meydanlar_tarihi_yuruyus_alanlari"
    }
}

// MARK: - Camiler
struct Camiler: Codable {
    let title, desc, adres, telefon: String?
    let ziyaretSaatleri, girisUcreti: String?
    let photo: String?
    let enlem, boylam: String?

    enum CodingKeys: String, CodingKey {
        case title, desc, adres, telefon
        case ziyaretSaatleri = "ziyaret_saatleri"
        case girisUcreti = "giris_ucreti"
        case photo, enlem, boylam
    }
}
