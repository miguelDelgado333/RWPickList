//
//  HomePresenter.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 25/02/21.
//

import Foundation
import UIKit

class HomePresenter: NSObject {

  weak var view: HomeViewProtocol?

  private var nameUser: String = ""
  private var itemsModel: [Information] = []
  private var filteredData: [Information] = []
  private var isEmptySearchBar: Bool = true

  required init(view: HomeViewProtocol, nameUser: String) {
    self.view = view
    self.nameUser = nameUser
  }

  private func goToDetail(model: Information) {
    let vc = DetailViewController(nibName: "DetailViewController", bundle: nil)
    let presenter: DetailPresenter = DetailPresenter(view: vc, model: model)
    vc.presenter = presenter
    guard let loginView = view as? HomeViewController else { return }
    loginView.navigationController?.pushViewController(vc, animated: true)
  }
}

extension HomePresenter: HomePresenterProtocol {
  func getUserName() -> String {
    return nameUser
  }

  func getData() {
    NetworkingService().getPeople { (response) in
      self.itemsModel = response
      self.view?.reloadData()
    }
  }

  func numberSection() -> Int {
    return 1
  }

  func numberRow() -> Int {
    return isEmptySearchBar ? itemsModel.count : filteredData.count
  }

  func configCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell",
                                                              for: indexPath)
    cell.selectionStyle = .none
    let item: Information = isEmptySearchBar ? itemsModel[indexPath.row] : filteredData[indexPath.row]
    switch (cell) {
    case let (cell as InformationTableViewCell):
      cell.setValue(item)
    default:
      break
    }
    return cell
  }

  func didSelected(indexPath: IndexPath) {
    let itemSelected: Information = isEmptySearchBar ? itemsModel[indexPath.row] : filteredData[indexPath.row]
    goToDetail(model: itemSelected)
  }

  func didChangeTextSearchBar(_ searchBar: UISearchBar) {
    filteredData = itemsModel
    guard let textSearchBar: String = searchBar.text else { return }
    isEmptySearchBar = textSearchBar.isEmpty
    if isEmptySearchBar {
      searchBar.text = ""
      view?.reloadData()
      view?.endEditingKeyboard()
    } else {
      filteredData = itemsModel.filter({ $0.nombre.contains(textSearchBar) })
      view?.reloadData()
    }
  }
}
