//
//  HomeViewController.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 25/02/21.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet private weak var containerTableView: UITableView!
  @IBOutlet private weak var searchBar: UISearchBar!
  @IBOutlet private weak var nameUserLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

  var presenter: HomePresenterProtocol?
  private var constants: Constants = Constants()

  override func viewDidLoad() {
    super.viewDidLoad()
    configTitleLabel()
    presenter?.getData()
    registerCellTableView()
    setupTableView()
    configNavigation()
  }

  private func configTitleLabel() {
    guard let name: String = presenter?.getUserName() else { return }
    nameUserLabel.text = "\(constants.hi) \(String(describing: name))"
    nameUserLabel.textAlignment = .center
    self.navigationItem.setHidesBackButton(true, animated: true)
  }

  private func configNavigation() {
    let logOut = UIBarButtonItem(title: constants.logOut, style: .plain, target: self, action: #selector(pop))
    navigationItem.rightBarButtonItem = logOut
  }

  @objc func pop() {
    self.navigationController?.popToRootViewController(animated: true)
  }

  private func setupTableView() {
    containerTableView.delegate = self
    containerTableView.dataSource = self
    searchBar.delegate = self
  }

  private func registerCellTableView() {
    containerTableView.register(UINib(nibName: "InformationTableViewCell", bundle: nil), forCellReuseIdentifier: "InformationTableViewCell")
  }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return presenter?.numberSection() ?? Int.zero
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  presenter?.numberRow() ?? Int.zero
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return presenter?.configCell(for: tableView, indexPath: indexPath) ?? UITableViewCell()
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter?.didSelected(indexPath: indexPath)
  }
}

extension HomeViewController: HomeViewProtocol {
  func reloadData() {
    UIView.transition(with: containerTableView,
                      duration: 0.35,
                      options: .transitionCrossDissolve,
                      animations: { self.containerTableView.reloadData() })
  }

  func endEditingKeyboard() {
    view.endEditing(true)
  }
}

extension HomeViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    presenter?.didChangeTextSearchBar(searchBar)
  }

  
}
