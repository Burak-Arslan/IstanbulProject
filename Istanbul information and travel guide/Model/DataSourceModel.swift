//
//  DataSourceModel.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 9.04.2021.
//

import Foundation
import RxDataSources

struct DataSourceModel<T> {
      var header: String
      var isMultiple : Bool?
      var items: [Item]
}

extension DataSourceModel : SectionModelType{
    
        typealias Item = T

       init(original: DataSourceModel, items: [Item]) {
            self = original
            self.items = items
      }
    
    
}
