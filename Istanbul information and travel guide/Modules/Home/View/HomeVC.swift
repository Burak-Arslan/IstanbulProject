
import UIKit

class HomeVC: BaseVC<HomeVM> {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    func initialize() {
        let data = self.viewModel?.getIstanbulInfo()
        var test = ""
    }
}
