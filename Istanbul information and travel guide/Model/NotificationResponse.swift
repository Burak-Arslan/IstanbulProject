//
//  NotificationResponse.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 12.04.2021.
//

import Foundation

// MARK: - NotificationResponseElement
struct NotificationResponse: Codable {
    let hat: String
    let tip: Tip
    let guncellemeSaati, mesaj: String

    enum CodingKeys: String, CodingKey {
        case hat = "HAT"
        case tip = "TIP"
        case guncellemeSaati = "GUNCELLEME_SAATI"
        case mesaj = "MESAJ"
    }
}

enum Tip: String, Codable {
    case günlük = "Günlük"
    case sefer = "Sefer"
}
