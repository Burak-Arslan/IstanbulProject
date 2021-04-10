//
//  HomeVC.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 8.04.2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources


class HomeVC: BaseVC<HomeVM>{

    @IBOutlet weak var collectionHisar: UICollectionView!
    @IBOutlet weak var collectionCamiler: UIView!
    
    private let hisarCellIdentifier = String(describing: HisarCollectionViewCell.self)
    
    private let cuffDataSource = RxCollectionViewSectionedReloadDataSource<DataSourceModel<Camiler>>(configureCell: { dataSource, collectionView, indexPath, item in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HisarCollectionViewCell", for: indexPath) as! HisarCollectionViewCell
        cell.model = item
        return cell
    })
    
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        collectionHisar.register(UINib(nibName: "HisarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: hisarCellIdentifier)
        collectionHisar.rx.setDelegate(self).disposed(by: disposeBag)
       
        bindCollectionView()
        self.viewModel?.getHisarlar()
    }
}

extension HomeVC {
    
    func bindCollectionView() {
        viewModel?.hisarInfo.bind(to: collectionHisar.rx.items(dataSource: self.cuffDataSource)).disposed(by: disposeBag)
        collectionHisar.rx.modelSelected(Camiler.self).subscribe(onNext: {(model) in
            self.viewModel?.goHisaDetail.onNext(model)
            print(model)
         }).disposed(by: disposeBag)
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionHisar {
            return CGSize(width: UIScreen.main.bounds.width - 100, height: 170)
        }else {
            return CGSize(width: 374, height: 494)
        }
    }
}
