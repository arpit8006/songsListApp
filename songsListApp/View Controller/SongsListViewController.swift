//
//  SongsListViewController.swift
//  songsListApp
//
//  Created by Arpit Verma on 11/07/21.
//

import UIKit

class SongsListViewController: UIViewController {
    
    //Outlets and Variables
    @IBOutlet private weak var _tableView : UITableView!
    @IBOutlet private weak var _activityIndicator : UIActivityIndicatorView!
    let refreshControl = UIRefreshControl()
    let urlString = "https://itunes.apple.com/search?term=Michael+jackson"
    var songsArr : [Results]?
    
    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()
       initialSetupForViewDidLoad()
    }
    
    private func initialSetupForViewDidLoad(){
        self.title = "Songs List"
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        _tableView.addSubview(refreshControl)
        getData()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        if let _ = songsArr{
            songsArr?.removeAll()
        }
        getData()
        refreshControl.endRefreshing()
    }

    private func getData(){
        
        let url = URL(string: urlString)
        guard url != nil else {
            return
        }
        _activityIndicator.startAnimating()
        _activityIndicator.isHidden = false
        let task = URLSession.shared.dataTask(with: url!) { data, response, err in
            
            if err == nil && data != nil{
                let decoder = JSONDecoder()
                do {
                    let finalData = try decoder.decode(Json4Swift_Base.self, from: data!)
                    if let arr = finalData.results{
                        self.songsArr = arr
                        print("Data Recieved")
                        DispatchQueue.main.async {
                            self._activityIndicator.stopAnimating()
                            self._activityIndicator.isHidden = true
                            self._tableView.reloadData()
                        }
                    }
                } catch  {
                    print("Error")
                }
            }else{
                DispatchQueue.main.async {
                    self._activityIndicator.stopAnimating()
                    self._activityIndicator.isHidden = true
                }
            }
        }
        task.resume()
    }
}

//MARK:- UITABLE VIEW DELEGATES AND DATASOURCE
extension SongsListViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let arr = songsArr{
            return arr.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = _tableView.dequeueReusableCell(withIdentifier: SongsListTableViewCell.identifier()) as! SongsListTableViewCell
        if let arr = songsArr{
            cell.songObj = arr[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SongDetailViewController") as! SongDetailViewController
        if let arr = songsArr{
            vc.songObj = arr[indexPath.row]
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
