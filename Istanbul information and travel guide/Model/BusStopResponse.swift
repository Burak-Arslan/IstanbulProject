//
//  BusStopResponse.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 13.04.2021.
//
import Foundation

// MARK: - BusStopResponse
struct BusStopResponse: Codable {
    let type: String?
    let features: [Feature]?
}

// MARK: - Feature
struct Feature: Codable {
    let properties: Properties?
    let geometry: Geometry?
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: GeometryType?
    let coordinates: [Double]?
}

enum GeometryType: String, Codable {
    case point = "Point"
}

// MARK: - Properties
struct Properties: Codable {
    let sdurakkodu: Int?
    let sdurakadi: String?
    let ilceadi: Ilceadi?
    let syon: String?
    let akilli: Akilli?
    let fiziki: Fiziki?
    let durakTipi: DurakTipi?

    enum CodingKeys: String, CodingKey {
        case sdurakkodu = "SDURAKKODU"
        case sdurakadi = "SDURAKADI"
        case ilceadi = "ILCEADI"
        case syon = "SYON"
        case akilli = "AKILLI"
        case fiziki = "FIZIKI"
        case durakTipi = "DURAK_TIPI"
    }
}

enum Akilli: String, Codable {
    case akilliVar = "VAR"
    case yok = "YOK"
}

enum DurakTipi: String, Codable {
    case acikDurak = "AÇIK DURAK"
    case ccmodern = "CCMODERN"
    case ccmoderndr = "CCMODERNDR"
    case diger = "DİĞER"
    case istasyon = "ISTASYON"
    case iettbayrak = "İETTBAYRAK"
    case iettcamli = "İETTCAMLI"
    case iettmodern = "İETTMODERN"
    case iettsac = "İETTSAC"
    case iettucgen = "İETTÜÇGEN"
    case istonDar = "İSTON DAR"
    case istonDarIbb = "İSTON DAR_İBB"
    case istonGenis = "İSTON GENİŞ"
    case istonGenisIbb = "İSTON GENİŞ_İBB"
    case ovalKirmizi = "OVAL KIRMIZI"
    case ovalYesil = "OVAL YEŞİL"
    case wallmodern = "WALLMODERN"
}

enum Fiziki: String, Codable {
    case acik = "AÇIK"
    case fullKapali = "FULL KAPALI"
    case kapali = "KAPALI"
}

enum Ilceadi: String, Codable {
    case adalar = "ADALAR"
    case arnavutkoy = "Arnavutköy"
    case atasehir = "Atasehir"
    case avcilar = "Avcilar"
    case bagcilar = "Bagcilar"
    case bahcelievler = "Bahçelievler"
    case bakirkoy = "Bakirköy"
    case basaksehir = "Basaksehir"
    case bayrampasa = "Bayrampasa"
    case besiktas = "Besiktas"
    case beykoz = "Beykoz"
    case beylikduzu = "Beylikdüzü"
    case beyoglu = "Beyoglu"
    case buyukcekmece = "Büyükçekmece"
    case darica = "Darica"
    case esenler = "Esenler"
    case esenyurt = "Esenyurt"
    case eyupsultan = "Eyüpsultan"
    case fatih = "Fatih"
    case gaziosmanpasa = "Gaziosmanpasa"
    case gebze = "Gebze"
    case gungoren = "Güngören"
    case kadikoy = "Kadiköy"
    case kagithane = "Kagithane"
    case kartal = "Kartal"
    case kucukcekmece = "Küçükçekmece"
    case maltepe = "Maltepe"
    case pendik = "Pendik"
    case sancaktepe = "Sancaktepe"
    case sariyer = "Sariyer"
    case sile = "Sile"
    case silivri = "Silivri"
    case sisli = "Sisli"
    case sultanbeyli = "Sultanbeyli"
    case sultangazi = "Sultangazi"
    case tuzla = "Tuzla"
    case zeytinburnu = "Zeytinburnu"
    case catalca = "Çatalca"
    case cayirova = "Çayirova"
    case cekmekoy = "Çekmeköy"
    case umraniye = "Ümraniye"
    case uskudar = "Üsküdar"
 }
