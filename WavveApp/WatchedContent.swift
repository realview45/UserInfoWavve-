//
//  FavoriteContent.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/05.
//

import SwiftUI

struct WatchedContent: View {
    //뷰간의 데이터공유된공간으로 데려다놓는것 @EnvironentObject
    //let livestream: LiveStream
    @State var dictIsFav = ObservableDict()
    
    //@Binding var showingImage: Bool
    var body: some View {
        VStack(alignment: .leading){
            title
            //if showingImage {
                favs//즐겨찾기한 상품 목록
            //}
        }
        .padding()
    }
}
private extension WatchedContent {
    var title: some View{
        HStack(alignment: .top, spacing:5){
            Text("시청 중 콘텐츠")
                .font(.headline).fontWeight(.medium)
             //Image(systemName: "arrowtriangle.up.square")
             //.padding(2)
             //.rotationEffect(Angle(radians: showingImage ? .pi : 0))
             //숨겼을 경우 아래화살표로 보이다가 나타낼때는 위화살표로 180도회전시킴
             
        }
        .padding(.bottom, 8)
        //.onTapGesture {self.showingImage.toggle()}//이미지표시여부 bool값토글
    }
    var favs: some View{
        dictIsFav.dictIs["나혼자산다"] = true
        //보고있는 컨텐츠 목록 불러오기 키만반환
        var watchedContents = dictIsFav.dictIs.filter({ $0.value })
        //키값모두반환var watchedContents = dictIsFav.dictIs.filter({ $0.value })
        //let watchedContents = livestream.products.filter{$0.isFavorite}
        return ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:0){
                //해당 컨텐츠 선택시 상세정보로 이동
                ForEach(watchedContents.keys.sorted(by:>), id: \.self) { keyy in
                    Image("좋아하면 울리는 짝짝짝")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(9)
                        .frame(width:160,height: 240)
        
                }
                /*
                ForEach(watchedContents.keys){ key in
                    NavigationLink(destination: ContentStreamView(namme: key)){
                        //LiveStreamView(product: product)){
                        //self.eachProduct(product)
                        self.eachProduct(key)
                    }.padding(.trailing)
                }
                 */
            }
        }
    }
    func eachProduct(_ namme: String) -> some View {
        //GeometryReader {//스크롤뷰내 위치정보를 얻어오도록 지오메트리 리더 사용
        Image(namme)
            .resizable()
        //.clipShape(Circle())//이미지가 원형으로 나타나도록
        //.frame(width: 90, height: 90) //정방형으로
            .scaledToFit()
        //.scaleEffect(self.scaledValue(from: $0))//스크롤 위치에 따라 크기 조정
            .cornerRadius(10)
            .frame(width:300)
        
        //}
        //.frame(width:105, height: 105)
    }
    /*갈수록 이미지크기 0.2배씩 작아지게
     func scaledValue(from geometry: GeometryProxy) -> CGFloat {
     let xOffset = geometry.frame(in: .global).minX - 16
     let minSize: CGFloat = 0.9//원래크기의 0.9배
     let maxSize: CGFloat = 1.1//원래크기의 1.1배
     let delta: CGFloat = maxSize - minSize//변화폭 0.2배
     //
     let size = minSize + delta * (1-xOffset / UIScreen.main.bounds.width)
     return max(min(size, maxSize), minSize)
     }
     */
}

        
struct WatchedContent_Previews: PreviewProvider {
    static var previews: some View {
        WatchedContent()
        //WatchedContent(showingImage: .constant(true))
        //FavoriteContent(livestream:LiveStream(), showingImage: .constant(true))
    }
}

