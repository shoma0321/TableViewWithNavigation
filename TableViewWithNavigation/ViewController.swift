//
//  ViewController.swift
//  TableViewWithNavigation
//
//  Created by 伊藤 奨真 on 2022/07/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let animals = ["Dog 🐶", "Cat 🐱", "Panda 🐼", "Lion 🦁", "Snake 🐍"]
    
    @IBOutlet weak var animalTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animalTableView.dataSource = self
        animalTableView.delegate = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController, let indexPath = sender as? IndexPath {
            detailVC.message = animals[indexPath.row]
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count//テーブルビューに表示するセルの数、要素数
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath)
        
        let label = cell.viewWithTag(1) as? UILabel//UILabel型にキャスト
        label?.text = animals[indexPath.row]
        
        return cell
    }
    
    
    //各セルをタップしたときに実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MainToDetail", sender: indexPath)
    }

}

