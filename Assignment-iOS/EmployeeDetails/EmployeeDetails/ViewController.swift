//
//  ViewController.swift
//  EmployeeDetails
//
//  Created by Laxman Singh Koranga on 14/07/2024.
//

/*
ViewController Setup:
01: TableView Setup: UITableView is added programmatically, frame is set to match the views bounds.
 02:
 
 */
import UIKit

class ViewController: UIViewController {

    var users: [EmployeeModel] = []
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Home Screen title.
        title = "Employee List"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
                
        fetchUsers()
    }
    
    // fetchUsers function makes a network request to the API, decodes the JSON response into an array of User objects and reloads the table view on the main thread.
    func fetchUsers() {
            guard let url = URL(string: "https://api.github.com/users") else { return }

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedResponse = try decoder.decode([EmployeeModel].self, from: data)
                        DispatchQueue.main.async {
                            self.users = decodedResponse
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("Error decoding data: \(error)")
                    }
                } else if let error = error {
                    print("Network error: \(error)")
                }
            }
            .resume()
        }
}

// 01. returns number of users.
// 02. configures each cell to display the user login name and avatar image. fetchImage function is used to download the image asynchronously and update the cell's image view.
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.login.capitalized

        // before fetching & displaying the new images asynchronouly, prevents old images from being reused when cells are recycled and avoids flickering issues.
        cell.imageView?.image = nil
        
//     Load and display the image asynchoronously.
            if let url = URL(string: user.avatarURL) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            // Check if the cell is still visible.
                            if let updateCell = tableView.cellForRow(at: indexPath) {
                                updateCell.imageView?.image = image
                                updateCell.setNeedsLayout()
                            }
                        }
                    }
                }
                .resume()
            }
            return cell
        }
    
    // Handle selection of a table view cell and navigates to "DetailViewController".
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row]
        showDetail(for: selectedUser)
    }
    
    // this function creates an instance of "DetailViewController" sets the selected "User" object and pushes "DetailViewController" onto the navigation stack using navigationController? line.
    func showDetail(for user: EmployeeModel) {
        let detailVC = DetailViewController()
        detailVC.employee = user
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
