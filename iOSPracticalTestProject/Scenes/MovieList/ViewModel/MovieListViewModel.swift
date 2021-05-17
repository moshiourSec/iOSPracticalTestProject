//
//  MovieListViewModel.swift
//  iOSPracticalTestProject
//
//  Created by Moshiur Rahman Bilash on 5/17/21.
//

import Foundation

protocol MovieListViewModelDelegate {
    func loadMovieListView()
}

class MovieListViewModel {
    
    private(set) var delegate: MovieListViewModelDelegate?
    
    var movieList: [MovieListCellVM] {
        didSet {
            print("movies : \(movieList[0])")
            self.delegate?.loadMovieListView()
        }
    }
    
    init() {
        movieList = [MovieListCellVM]()
    }
    
    func viewDidLoad<T>(_ vc: T) {
        self.delegate = vc.self as? MovieListViewModelDelegate
    }
    
    
    func CreateMovieListRequest() -> Resource {
        
        let urlString = "\(URL.movieList)"
        
        guard let url = URL(string: urlString) else {
            fatalError("URl was incorrect")
        }
        var resource = Resource(url: url)
        resource.httpMethod = HttpMethod.get
        return resource
    }
    
    
    func getMovieListData(resource: Resource) {
        if Reachability.isConnectedToNetwork() {
            WebService.load(resource: resource) {[weak self] (result) in
                
                switch result {
                
                case .success(let data, let status):
                    switch status {
                    case HTTPStatusCodes.OK:
                        JSONDecoder.decodeData(model: MovieList.self, data) { [weak self](result) in
                            switch result
                            {
                            case .success(let data):
                                print("data:::: \(data)")
                                if let movies = data.results {
                                    self?.movieList = movies.map({ (result) -> MovieListCellVM in
                                        return MovieListCellVM(title: result.title, overview: result.overview, poster_path: result.poster_path)
                                    })
                                }
                                break
                                
                            case .failure(let error):
                                print(error.localizedDescription)
                                break
                            }
                        }
                        
                        break
                    case HTTPStatusCodes.BadRequest:
                        print("<<<<<<<<<<<  Check api request   >>>>>>>>>>>>>>")
                        break
                        
                    case HTTPStatusCodes.InternalServerError:
                        print("<<<<<<<<<<<  Internal Server error   >>>>>>>>>>>>>>")
                        break
                        
                    default:
                        print("error in default block")
                        break
                        
                    }
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                }
            }
        } else {
            print("no internet")
        }
        
    }
    
}


struct MovieListCellVM {
    var title: String?
    var overview: String?
    var poster_path: String?
}
