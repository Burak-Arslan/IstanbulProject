//
//  NotificationsVC.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 12.04.2021.
//

import UIKit
import RxCocoa
import RxSwift

class NotificationsVC: BaseVC<NotificationVM> {
    
    let disposeBag = DisposeBag()
    private let notificationCellIdentifier = String(describing: NotificationTableViewCell.self)

    @IBOutlet weak var tableNotif: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableNotif?.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: notificationCellIdentifier)
        tableNotif.rx.setDelegate(self).disposed(by: disposeBag)
        
        self.viewModel?.getNotification()
        
        self.viewModel!.notificationInfo.bind(to: (self.tableNotif.rx.items(cellIdentifier: "NotificationTableViewCell", cellType: NotificationTableViewCell.self))) { (row,item,cell) in
    
            cell.lblTest.text = item.hat
            }.disposed(by: disposeBag)
    }
}

extension NotificationsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 105
       }
}
