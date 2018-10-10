//
//  DetailViewController.swift
//  flix_demo
//
//  Created by user144731 on 9/18/18.
//  Copyright © 2018 Roberto Bradley. All rights reserved.
//

import UIKit
enum MovieKeys
{
    static let title = "title"
    static let release = "release_date"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
}

class DetailViewController: UIViewController {
    @IBOutlet weak var backDropImageView: UIImageView!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var newOverviewLabel: UITextView!
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie
        {
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.releaseDate
            newOverviewLabel.text = movie.overview
            backDropImageView.af_setImage(withURL: movie.backdropUrl!)
            posterImageView.af_setImage(withURL: movie.posterUrl!)
        }
        // Do any additional setup after loading the view.
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

}
