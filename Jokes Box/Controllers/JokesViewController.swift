//
//  JokesViewController.swift
//  Jokes Box
//
//  Created by saad dar on 2/12/17.
//  Copyright © 2017 Magic Minds. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, JokesDelegate {
    
    @IBOutlet var jokesListView: UITableView!
    var refreshControl: UIRefreshControl!
    var jokesFacade: JokesFacade!
    var jokesList = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.jokesListView.dataSource = self
        jokesFacade = JokesFacade()
        addControls()
        loadJokes()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func addControls(){
        
        refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.lightGray
        refreshControl.tintColor = UIColor.white
        refreshControl .addTarget(self, action: #selector(JokesViewController.loadJokes), for:.valueChanged)
        
        if(Double(UIDevice.current.systemVersion)! >= iOS_10) {
            jokesListView.refreshControl = refreshControl
        } else {
            jokesListView.addSubview(refreshControl)
        }
    
    }
    
    func loadJokes(){
        
        refreshControl.beginRefreshing()
        
        jokesFacade.getRandomJokesWithCountWithDelegate(delegate: self)
    }
    
    func jokesServiceSuccess(jokes:Jokes){
        
        if(Utils.isObjectNotNil(object: jokes)){
            jokesList = jokes.value;
        }
              
        jokesListView.reloadData()
        
        if (refreshControl.isRefreshing) {
            refreshControl.endRefreshing()
        }
    }
    
    func jokesServiceFailure(errorReason:String){
        
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if (jokesList.count > 0) {
            
            jokesListView.separatorStyle = .singleLine
            return 1;
            
        }
        
        return 0;
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokesList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let simpleTableIdentifier:String = "TableViewCell"

        
        var cell: TableViewCell! = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier) as? TableViewCell
       
        if (!Utils.isObjectNotNil(object: cell)) {
            jokesListView.register(UINib(nibName: simpleTableIdentifier, bundle: nil), forCellReuseIdentifier: simpleTableIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier) as? TableViewCell
        }
        let joke =  jokesList[indexPath.row] as! Joke
        cell.title.text = joke.joke

        return cell;
    }

}
