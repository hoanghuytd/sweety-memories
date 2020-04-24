//
//  NetworkManager.swift
//  Swiftui_movie
//
//  Created by Liem Vo on 7/7/19.
//  Copyright © 2019 Liem Vo. All rights reserved.
//

import Alamofire
import Foundation
import Combine

class NetworkManager: ObservableObject {
	@Published var movies = MovieList(results: [])
	@Published var loading = false
	private let api_target = "movies.json"
	init() {
		loading = true
		loadDataByAlamofire()
	}
	
	public func loadDataNormal() {
        self.loading = true
        guard let url = URL(string: "\(AppConst.API_ENDPOINT)\(api_target)") else { return }
		URLSession.shared.dataTask(with: url){ (data, _, _) in
			guard let data = data else { return }
			let movies = try! JSONDecoder().decode(MovieList.self, from: data)
			DispatchQueue.main.async {
				self.movies = movies
				self.loading = false
			}
		}.resume()
	}
	
	private func loadDataByAlamofire() {
		AF.request("\(AppConst.API_ENDPOINT)\(api_target)")
			.responseJSON{ response in
				guard let data = response.data else { return }
				let movies = try! JSONDecoder().decode(MovieList.self, from: data)
				DispatchQueue.main.async {
					self.movies = movies
					self.loading = false
				}
		}
	}
}
