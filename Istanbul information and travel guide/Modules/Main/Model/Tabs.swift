
import Foundation
import UIKit
enum Tabs : Int {
    case home
    case notification
    case busStop
    case busGarage
    case busLocation
    
    
    var title: String? {
        switch self {
        case .home:
            return "Anasayfa"
        case .notification:
            return "Bildirimler"
        case .busStop:
            return "Otobüs Durakları"
        case .busGarage:
            return "Otobüs Garajları"
        case .busLocation:
            return "Anlık Konumu"
        }
    }
    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "home32")!.withRenderingMode(.alwaysOriginal);
        case .notification:
            return UIImage(named: "notification32")!.withRenderingMode(.alwaysOriginal);
        case .busStop:
            return UIImage(named: "bus-stoppp32")!.withRenderingMode(.alwaysOriginal);
        case .busGarage:
            return UIImage(named: "bus-stopp32")!.withRenderingMode(.alwaysOriginal);
        case .busLocation:
            return UIImage(named: "bus-stop32")!.withRenderingMode(.alwaysOriginal);
        }
    }
    var navigationController: UINavigationController {
        let navigation = UINavigationController()
        navigation.tabBarItem.title = self.title
        navigation.tabBarItem.image = self.icon
        return navigation
    }
    
}
