//
//  BusStopResponse.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 13.04.2021.
//

import Foundation

// MARK: - BusStop
struct BusStopResponse: Codable {
    let type: String?
    let features: [Feature]?
}

// MARK: - Feature
struct Feature: Codable {
    let type: FeatureType?
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
    case açikDurak = "AÇIK DURAK"
    case ccmodern = "CCMODERN"
    case ccmoderndr = "CCMODERNDR"
    case di̇ğer = "DİĞER"
    case istasyon = "ISTASYON"
    case i̇ettbayrak = "İETTBAYRAK"
    case i̇ettcamli = "İETTCAMLI"
    case i̇ettmodern = "İETTMODERN"
    case i̇ettsac = "İETTSAC"
    case i̇ettüçgen = "İETTÜÇGEN"
    case i̇stonDar = "İSTON DAR"
    case i̇stonDarİbb = "İSTON DAR_İBB"
    case i̇stonGeni̇ş = "İSTON GENİŞ"
    case i̇stonGeni̇şİbb = "İSTON GENİŞ_İBB"
    case ovalKirmizi = "OVAL KIRMIZI"
    case ovalYeşi̇l = "OVAL YEŞİL"
    case wallmodern = "WALLMODERN"
}

enum Fiziki: String, Codable {
    case açik = "AÇIK"
    case fullKapali = "FULL KAPALI"
    case kapali = "KAPALI"
}

enum Ilceadi: String, Codable {
    case adalar = "ADALAR"
    case arnavutköy = "Arnavutköy"
    case atasehir = "Atasehir"
    case avcilar = "Avcilar"
    case bagcilar = "Bagcilar"
    case bahçelievler = "Bahçelievler"
    case bakirköy = "Bakirköy"
    case basaksehir = "Basaksehir"
    case bayrampasa = "Bayrampasa"
    case besiktas = "Besiktas"
    case beykoz = "Beykoz"
    case beylikdüzü = "Beylikdüzü"
    case beyoglu = "Beyoglu"
    case büyükçekmece = "Büyükçekmece"
    case darica = "Darica"
    case esenler = "Esenler"
    case esenyurt = "Esenyurt"
    case eyüpsultan = "Eyüpsultan"
    case fatih = "Fatih"
    case gaziosmanpasa = "Gaziosmanpasa"
    case gebze = "Gebze"
    case güngören = "Güngören"
    case kadiköy = "Kadiköy"
    case kagithane = "Kagithane"
    case kartal = "Kartal"
    case küçükçekmece = "Küçükçekmece"
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
    case çatalca = "Çatalca"
    case çayirova = "Çayirova"
    case çekmeköy = "Çekmeköy"
    case ümraniye = "Ümraniye"
    case üsküdar = "Üsküdar"
}

enum FeatureType: String, Codable {
    case feature = "Feature"
}
