//
//  SettingTableViewController.swift
//  20240523TableView
//
//  Created by 이찬호 on 5/23/24.
//

import UIKit
import SnapKit

class SettingTableViewController: UIViewController {
    
    let list = ["전체 설정", "개인 설정", "기타"]
    let data = ["전체 설정": ["공지사항", "실험실", "버전 정보"],
                "개인 설정": ["개인/보안", "알림", "채팅", "멀티프로필"],
                "기타": ["고객센터/도움말"]
    ]
    
    private var dataSource: UICollectionViewDiffableDataSource<String, String>!
    
    private let layout = {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarhcy()
        configureLayout()
        configureDataSource()
        updateSnapshot()
    }
    
    private func configureHierarhcy() {
        view.addSubview(collectionView)
    }
    
    private func configureLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension SettingTableViewController {
    private func configureDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, String>!
        
        registration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier
            cell.contentConfiguration = content
        }
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<String, String>()
        snapshot.appendSections(["전체 설정", "개인 설정", "기타"])
        snapshot.appendItems(data["전체 설정"]!, toSection: "전체 설정")
        snapshot.appendItems(data["개인 설정"]!, toSection: "개인 설정")
        snapshot.appendItems(data["기타"]!, toSection: "기타")
        dataSource.apply(snapshot)
    }
}
