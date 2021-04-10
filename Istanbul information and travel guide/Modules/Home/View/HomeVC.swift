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
    @IBOutlet weak var collectionCamiler: UICollectionView!
    
    private let hisarCellIdentifier = String(describing: HisarCollectionViewCell.self)
    private let camilerCellIdentifier = String(describing: CamilerCollectionViewCell.self)
    
    private let hisarDataSource = RxCollectionViewSectionedReloadDataSource<DataSourceModel<Camiler>>(configureCell: { dataSource, collectionView, indexPath, item in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HisarCollectionViewCell", for: indexPath) as! HisarCollectionViewCell
        cell.model = item
        return cell
    })
    
    private let camilerDataSource = RxCollectionViewSectionedReloadDataSource<DataSourceModel<Camiler>>(configureCell: { dataSource, collectionView, indexPath, item in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CamilerCollectionViewCell", for: indexPath) as! CamilerCollectionViewCell
        cell.model = item
        return cell
    })
    
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        collectionHisar.register(UINib(nibName: "HisarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: hisarCellIdentifier)
        collectionHisar.rx.setDelegate(self).disposed(by: disposeBag)
        
        collectionCamiler.register(UINib(nibName: "CamilerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: camilerCellIdentifier)
        collectionCamiler.rx.setDelegate(self).disposed(by: disposeBag)
       
        bindCollectionView()
        self.viewModel?.getHisarlar()
        self.viewModel?.getCamiler()
    }
}

extension HomeVC {
    
    func bindCollectionView() {
        viewModel?.hisarInfo.bind(to: collectionHisar.rx.items(dataSource: self.hisarDataSource)).disposed(by: disposeBag)
        collectionHisar.rx.modelSelected(Camiler.self).subscribe(onNext: {(model) in
            self.viewModel?.goHisaDetail.onNext(model)
            print(model)
         }).disposed(by: disposeBag)
        
        viewModel?.camilerInfo.bind(to: collectionCamiler.rx.items(dataSource: self.camilerDataSource)).disposed(by: disposeBag)
        collectionCamiler.rx.modelSelected(Camiler.self).subscribe(onNext:{(model) in
            print(model)
        }).disposed(by: disposeBag)
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionHisar {
            return CGSize(width: UIScreen.main.bounds.width - 100, height: 250)
        }
        else if collectionView  == collectionCamiler {
            return CGSize(width: UIScreen.main.bounds.width - 100, height: 250)
        }
        else {
            return CGSize(width: 374, height: 494)
        }
    }
}
