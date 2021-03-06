//
//  ViewController.swift
//  TableViewWithNavigation
//
//  Created by ä¼è¤ å¥¨ç on 2022/07/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let animals = ["Dog ð¶", "Cat ð±", "Panda ð¼", "Lion ð¦", "Snake ð"]
    
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
        return animals.count//ãã¼ãã«ãã¥ã¼ã«è¡¨ç¤ºããã»ã«ã®æ°ãè¦ç´ æ°
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath)
        
        let label = cell.viewWithTag(1) as? UILabel//UILabelåã«ã­ã£ã¹ã
        label?.text = animals[indexPath.row]
        
        return cell
    }
    
    
    //åã»ã«ãã¿ããããã¨ãã«å®è¡ãããã¡ã½ãã
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MainToDetail", sender: indexPath)
    }

}

