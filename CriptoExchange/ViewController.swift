import UIKit

final class ViewController: UIViewController {
    // MARK: - PRIVATE PROPRTIES:
    
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    var coin: [ModelCoin] = []
    
    // MARK: - LIFECYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        addSubviews()
        configureConstraints()
        configureUI()
        configureTableView()
        requestJSON()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // MARK: TITLE LABEL:
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // MARK: TABLE VIEW:
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        view.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        titleLabel.text = "Exchange Rates"
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold, width: .standard)
        tableView.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        tableView.separatorStyle = .none
    }
    
    // MARK: - CONFIGURE TABLE VIEW:

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CriptoTableViewCell.self, forCellReuseIdentifier: "CriptoTableViewCell")
    }
    
    // MARK: - NETWORK REQUEST:
    
    private func requestJSON() {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        NetworkManager.instance.getAssets { result in
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            switch result {
            case .success(let coin):
                DispatchQueue.main.async {
                    self.coin = coin
                    self.tableView.reloadData()
                }
            case .failure:
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "Error Request", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }
}

// MARK: - EXTENSION:

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: COUNTS OF CELLS:

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coin.count
    }
    
    // MARK: CUSTOM CELL:

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CriptoTableViewCell", for: indexPath) as? CriptoTableViewCell else { return UITableViewCell() }
        
        let tmpCoin = coin[indexPath.row]
        cell.configure(tmpCoin)
        
        return cell
    }
}
