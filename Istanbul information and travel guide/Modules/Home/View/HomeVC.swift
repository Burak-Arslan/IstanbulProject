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
    @IBOutlet weak var collectionKiliseler: UICollectionView!
    @IBOutlet weak var collectionSarayla: UICollectionView!
    @IBOutlet weak var collectionKasirlar: UICollectionView!
    @IBOutlet weak var collectionCarsilar: UICollectionView!
    
    private let hisarCellIdentifier = String(describing: HisarCollectionViewCell.self)
    private let camilerCellIdentifier = String(describing: CamilerCollectionViewCell.self)
    private let kiliselerCellIdentifier = String(describing: KiliselerCollectionViewCell.self)
    private let saraylarCellIdentifier = String(describing: SaraylarCollectionViewCell.self)
    private let kasirlarCellIdentifier = String(describing: KasirlarCollectionViewCell.self)
    private let carsilarCellIdentifier = String(describing: CarsilarCollectionViewCell.self)

    
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
    
    private let kiliselerDataSource = RxCollectionViewSectionedReloadDataSource<DataSourceModel<Camiler>>(configureCell: { dataSource, collectionView, indexPath, item in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KiliselerCollectionViewCell", for: indexPath) as! KiliselerCollectionViewCell
        cell.model = item
        return cell
    })
    
    private let saraylarDataSource = RxCollectionViewSectionedReloadDataSource<DataSourceModel<Camiler>>(configureCell: { dataSource, collectionView, indexPath, item in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SaraylarCollectionViewCell", for: indexPath) as! SaraylarCollectionViewCell
        cell.model = item
        return cell
    })
    
    private let kasirlarDataSource = RxCollectionViewSectionedReloadDataSource<DataSourceModel<Camiler>>(configureCell: { dataSource, collectionView, indexPath, item in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KasirlarCollectionViewCell", for: indexPath) as! KasirlarCollectionViewCell
        cell.model = item
        return cell
    })
    
    
    private let carsilarDataSource = RxCollectionViewSectionedReloadDataSource<DataSourceModel<Camiler>>(configureCell: { dataSource, collectionView, indexPath, item in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarsilarCollectionViewCell", for: indexPath) as! CarsilarCollectionViewCell
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
        
        collectionKiliseler.register(UINib(nibName: "KiliselerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kiliselerCellIdentifier)
        collectionKiliseler.rx.setDelegate(self).disposed(by: disposeBag)
        
        collectionSarayla.register(UINib(nibName: "SaraylarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: saraylarCellIdentifier)
        collectionSarayla.rx.setDelegate(self).disposed(by: disposeBag)
        
        collectionKasirlar.register(UINib(nibName: "KasirlarCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: kasirlarCellIdentifier)
        collectionKasirlar.rx.setDelegate(self).disposed(by: disposeBag)
        
        collectionCarsilar.register(UINib(nibName: "CarsilarCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: carsilarCellIdentifier)
        collectionCarsilar.rx.setDelegate(self).disposed(by: disposeBag)
       
        bindCollectionView()
        self.viewModel?.getHisarlar()
        self.viewModel?.getCamiler()
        self.viewModel?.getKiliseler()
        self.viewModel?.getSaraylar()
        self.viewModel?.getKasirlar()
        self.viewModel?.getCarsilar()
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
        
        viewModel?.kilislereInfo.bind(to: collectionKiliseler.rx.items(dataSource: self.kiliselerDataSource)).disposed(by: disposeBag)
        collectionKiliseler.rx.modelSelected(Camiler.self).subscribe(onNext:{(model) in
            print(model)
        }).disposed(by: disposeBag)
        
        viewModel?.saraylarInfo.bind(to: collectionSarayla.rx.items(dataSource: self.saraylarDataSource)).disposed(by: disposeBag)
        collectionSarayla.rx.modelSelected(Camiler.self).subscribe(onNext:{(model) in
            print(model)
        }).disposed(by: disposeBag)
        
        viewModel?.kasirlarInfo.bind(to: collectionKasirlar.rx.items(dataSource: self.kasirlarDataSource)).disposed(by: disposeBag)
        collectionKasirlar.rx.modelSelected(Camiler.self).subscribe(onNext:{(model) in
            print(model)
        }).disposed(by: disposeBag)
        
        viewModel?.carsilarInfo.bind(to: collectionCarsilar.rx.items(dataSource: self.carsilarDataSource)).disposed(by: disposeBag)
        collectionCarsilar.rx.modelSelected(Camiler.self).subscribe(onNext:{(model) in
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
        else if collectionView  == collectionKiliseler {
            return CGSize(width: UIScreen.main.bounds.width - 100, height: 250)
        }
        else if collectionView  == collectionSarayla {
            return CGSize(width: UIScreen.main.bounds.width - 100, height: 250)
        }
        else if collectionView  == collectionKasirlar {
            return CGSize(width: UIScreen.main.bounds.width - 100, height: 250)
        }
        else if collectionView  == collectionCarsilar {
            return CGSize(width: UIScreen.main.bounds.width - 100, height: 250)
        }
        else {
            return CGSize(width: 374, height: 494)
        }
    }
}
