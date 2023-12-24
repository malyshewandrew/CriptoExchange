import UIKit

final class ViewController: UIViewController {

    // MARK: - PRIVATE PROPRTIES:
    private let tableView = UITableView()
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        view.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        tableView.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        tableView.separatorStyle = .none
    }
    
    
    // MARK: LIFECYCLE:
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        tabBarController?.tabBar.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CriptoTableViewCell.self, forCellReuseIdentifier: "CriptoTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CriptoTableViewCell", for: indexPath) as? CriptoTableViewCell else { return UITableViewCell() }
        return cell
    }
    
}
