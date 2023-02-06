//
//  LiveStream.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/02.
//

import Foundation

final class LiveStream{
    //@Published는 데이터가 변경되면 변경사실을 관련 뷰들이 모두 알아채고 갱신하도록 함
    @Published var products: [Product]
    init(filename: String = "ProductData.json")
    {
        //BundleExtension에서 decode메서드생성
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
//WavveAppApp.swift에서 .environmentObject(LiveStream())추가 위해

extension LiveStream: ObservableObject {}
extension LiveStream {
    func toggleFavorite(of product: Product){
        //.firstIndex(where:) 메서드는 상품의 동등성 여부를 판단할 수 있는 기준이 없을 때 그 기준을 알려 주기 위해 사용하는데, Equatable 프로토콜을 준수하는 경우는 이미 무엇을 비교해야할지 판단할수 있으므로 firstIndex(of:) 메서드로 대체가능
        //guard let index = products.firstIndex(where: {$0.id == product.id}) else { return }
        guard let index = products.firstIndex(of: product) else { return }
        products[index].isFavorite.toggle()
    }
}
