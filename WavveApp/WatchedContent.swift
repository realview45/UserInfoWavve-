//
//  WatchedContent.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/06.
//
import SwiftUI

struct WatchedContent: View {
    //뷰간의 데이터공유된공간으로 데려다놓는것 @EnvironentObject
    let contentstream: ContentStream
    @Binding var showingImage: Bool
    var body: some View {
        VStack(alignment: .leading){
            title
            if showingImage {
                products
            }
        }
        .padding()
    }
    var title: some View{
        HStack(alignment: .top, spacing:5){
            Text("시청 중 콘텐츠")
                .font(.headline).fontWeight(.medium)
        }
        .padding(.bottom, 8)
        .onTapGesture {self.showingImage.toggle()}//이미지표시여부 bool값토글
    }
    var products: some View{
        //보고있는 컨텐츠 목록 불러오기
        //let watchedContents = contentstream.contents.filter{$0.isFavorite}
        return ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:0){
                /*
                //해당 컨텐츠 선택시 상세정보로 이동
                ForEach(contentstream.contents){ content in
                    NavigationLink(destination: ContentStreamView(content: content, namme: namme)){
                        self.eachProduct(content)
                    }
                }.padding(.trailing)
            */
            }
        }
    }
    func eachProduct(_ contentt: Contentt) -> some View {
        //GeometryReader {//스크롤뷰내 위치정보를 얻어오도록 지오메트리 리더 사용
        Image(contentt.cname)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .frame(width:300)

    }

}

struct WatchedContent_Previews: PreviewProvider {
    static var previews: some View {
        WatchedContent(contentstream:ContentStream(), showingImage: .constant(true))
    }
}
