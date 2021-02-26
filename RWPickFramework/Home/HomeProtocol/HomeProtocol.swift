//
//  HomeProtocol.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 25/02/21.
//

import Foundation
import UIKit

protocol HomePresenterProtocol: class {
  var view: HomeViewProtocol? { get set }
  func getUserName() -> String
  func getData()
  /// Table section number
  func numberSection() -> Int
  /// Table row section
  func numberRow() -> Int
  func configCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
  func didSelected(indexPath: IndexPath)
  func didChangeTextSearchBar(_ searchBar: UISearchBar)

}

protocol HomeViewProtocol: class {
  func reloadData()
  func endEditingKeyboard()
}
