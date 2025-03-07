//
//  ImageViewWithURL.swift
//  trialuisdkProject
//
//  Created by Edwin work on 07/03/2025.
//

import SwiftUI
import Combine

struct ImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    let url: URL

    init(url: URL) {
        self.url = url
    }

    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if imageLoader.isLoading {
                ProgressView()
            } else {
                Text("Failed to load image")
            }
        }
        .onAppear {
            imageLoader.load(from: url)
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = false
    private var cancellable: AnyCancellable?

    func load(from url: URL) {
        isLoading = true
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                self?.image = image
                self?.isLoading = false
            }
    }

    deinit {
        cancellable?.cancel()
    }
}
