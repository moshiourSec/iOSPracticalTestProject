//
//  TableViewDataSource.swift
//  iOSPracticalTestProject
//
//  Created by Md. Moshiour Rahman on 5/8/22.
//

import Foundation
import UIKit

class GenericDataSource<CellType,ViewModel>:NSObject, UITableViewDataSource where CellType: UITableViewCell {

    let cellIdentifier: String
    var items: [ViewModel]

    typealias  ConfigureCell = (CellType,ViewModel,IndexPath) -> ()

    let configureCell: ConfigureCell?

     init(cellIdentifier: String,items: [ViewModel],configureCell: @escaping ConfigureCell) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }

    func updateItems(_ viewModel: [ViewModel])  {
        self.items = viewModel
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CellType else {
            fatalError("\(cellIdentifier) not found")
        }
        let vm = self.items[indexPath.row]
        self.configureCell?(cell,vm,indexPath)
        return cell
    }

}
