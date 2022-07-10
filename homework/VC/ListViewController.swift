//
//  ListViewController.swift
//  homework
//
//  Created by heungseop sim on 2022/07/07.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class ListViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let tableView :UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    func bindTableData(data:[Photo]){

        print("start bind")
        tableView.dataSource = nil
        let stream :Observable<[Photo]> = Observable.of(data)
        stream.bind(
            to: tableView.rx.items(
                cellIdentifier: "cell",
                cellType: UITableViewCell.self)
        ){ row,model,cell in
            cell.textLabel?.text = model.username
            
            let url = URL(string: model.thumbnail)
            cell.imageView?.kf.setImage(with: url)
            

            
        }.disposed(by: disposeBag)
        print("end bind")

    }
    
    func updateList(keyword:String){

        MyAlamofireManager
            .shared
            .getPhotos(searchTerm: keyword,
            completion: { [weak self] result in
                
                guard let self = self else { return }
                
                switch result {
                    case .success(let fetchedPhotos):
                        print("ListView getPhotos.success - fetchedPhotos.count : \(fetchedPhotos.count)")
                    self.bindTableData(data:fetchedPhotos)
                        
                    case .failure(let error):
                        print("ListView - getPhotos.failure - error : \(error.rawValue)")
                    }
            })

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.frame = self.view.frame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        updateList(keyword: "Dog")
    }
    

}


