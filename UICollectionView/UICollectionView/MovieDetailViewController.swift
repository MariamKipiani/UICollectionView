//
//  MovieDetailViewController.swift
//  UICollectionView
//
//  Created by user on 11/3/23.
//

import UIKit



class MovieDetailViewController: UIViewController {
    var movie: MovieDetails?
    
    // MARK: - Views
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let ratingView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        // ...
        return stackView
    }()
    
    // Define other views here
    
    // MARK: - Labels
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    // Define other labels here
    
    // MARK: - Button
    
    let selectSessionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select session", for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor(red: 1, green: 128/255, blue: 54/255, alpha: 1) 
        button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return button
    }()
    
    // MARK: - Initialization
    
    init(movie: MovieDetails) {
        super.init(nibName: nil, bundle: nil)
        self.movie = movie
        // ...
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setUpMovieDetails()
    }
    
    // MARK: - Setup Functions
    
    private func setupView() {
        // ...
    }
    
    private func setUpMovieDetails() {
        let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.spacing = 16

            let propertyLabel = UILabel()
            propertyLabel.text = property
            propertyLabel.textColor = .gray // Use a more neutral color
            propertyLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
            propertyLabel.font = UIFont.systemFont(ofSize: 14)

            let valueLabel = UILabel()
            valueLabel.text = value
            valueLabel.textColor = .white
            valueLabel.font = UIFont.systemFont(ofSize: 14)
            valueLabel.numberOfLines = 0

            horizontalStack.addArrangedSubview(propertyLabel)
            horizontalStack.addArrangedSubview(valueLabel)

            movieInfoView.addArrangedSubview(horizontalStack)
        }

        if let movieDetails = movie {
            let properties = [
                "Certificate", "Runtime", "Release", "Genre", "Director", "Cast"
            ]
            
            let values = [
                movieDetails.certificate,
                movieDetails.runtime,
                movieDetails.releaseYear,
                movieDetails.genre,
                movieDetails.director,
                movieDetails.cast
            ]
            
            for (property, value) in zip(properties, values) {
                addPropertyValuePair(property, value)
            }
    }
    
    private func setupConstraints() {
        // ...
    }
}


struct MovieDetails {
    let image: UIImage?
    var isLiked: Bool
    let rating: Double
    let title: String
    let genre: String
    let certificate: String
    let runtime: String
    let releaseYear: String
    let director: String
    let cast: String
    let description: String
    
    static let movies = [
        MovieDetails(
            image: UIImage(named: "Alice In Wonderland"),
            isLiked: false,
            rating: 8.1,
            title: "The Batman",
            genre: "Action",
            certificate: "7.3",
            runtime: "01:43",
            releaseYear: "1951",
            director: "Hamilton Lukse",
            cast: "Lewis Carroll, Ted Sears, Winston Hibler, Joe Grant, MORE",
            description: "After watching a scurrying rabbit in a waistcoat, Alice, a young and curious girl, follows him down his hole to Wonderland, and meets an array of anthropomorphic creatures who defy logic and reason."
        ),
  
        MovieDetails(
            image: UIImage(named: "Coraline"),
            isLiked: false,
            rating: 7.7,
            title: "Coraline",
            genre: "Horror",
            certificate: "16+",
            runtime: "01:40",
            releaseYear: "2009",
            director: "Tim Burton",
            cast: "Dakota Fannins, Jennifer Saunders, Teri Hatcher, Ian McShane, George Selick",
            description: "An adventurous girl walks through a secret door in her new home and discovers a strangely idealized version of her frustrating home, but it has sinister secrets."
        )]
}

