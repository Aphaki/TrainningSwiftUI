//
//  CacheBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/06/27.
//

import SwiftUI

class CacheManager {
    static let shared = CacheManager()
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 80
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    func addCache(img: UIImage, name: String) -> String {
        imageCache.setObject(img, forKey: name as NSString)
        return "캐시에 저장!"
    }
    func removeCache(name: String) -> String {
        imageCache.removeObject(forKey: name as NSString)
        return "캐시 이미지 삭제"
    }
    func getCache(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
}
class CacheViewModel: ObservableObject {
    @Published var uiImage: UIImage? = nil
    @Published var uiImageFromCache: UIImage? = nil
    @Published var message: String = ""
    let cacheManager = CacheManager.shared
    let imageName: String = "Kimpang2"
    
    init() {
        uiImage = UIImage(named: imageName)
    }
    func saveInCache() {
        guard let img = UIImage(named: imageName) else { return }
        message = cacheManager.addCache(img: img, name: imageName)
    }
    func removeCache() {
        message = cacheManager.removeCache(name: imageName)
    }
    func getImgFromCache() {
        uiImageFromCache = cacheManager.getCache(name: imageName)
    }
}

struct CacheBootcamp: View {
    @StateObject var vm = CacheViewModel()
    var body: some View {
        
        VStack {
            if let img = vm.uiImage {
                Image(uiImage: img)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.pink ,lineWidth: 3))
            } else {
                ProgressView()
                    .frame(width: 250, height: 250)
            }
            // Image
            HStack {
                Button {
                    vm.saveInCache()
                } label: {
                    CustomButtonStyle(text: "캐시에 저장", color: .blue)
                }
                Button {
                    vm.removeCache()
                } label: {
                    CustomButtonStyle(text: "캐시 삭제", color: .red)
                }
            }
            Button {
                vm.getImgFromCache()
            } label: {
                CustomButtonStyle(text: "캐시 가져오기", color: .yellow)
            }
            Text(vm.message)
            if let img = vm.uiImageFromCache {
                Image(uiImage: img)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.pink ,lineWidth: 3))
            } else {
                ProgressView()
                    .frame(width: 250, height: 250)
            }
            Spacer()
        }
    }
}
struct CustomButtonStyle: View {
    let text: String
    let color: Color
    var body: some View {
        Text(text)
            .font(.headline)
            .padding()
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)

    }
}

struct CacheBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CacheBootcamp()
    }
}
