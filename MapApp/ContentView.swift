//
//  ContentView.swift
//  MapApp
//
//  Created by みねた on 2022/01/31.
//

import SwiftUI
import MapKit //MapKitというフレームワークをインポート
              //iPhoneの画面上に地図を表示するフレームワーク

struct MapView: UIViewRepresentable {
    //UIViewRepresentable => プロトコル
    func makeUIView(context: Context) -> MKMapView {
        //makeUIView => 別のフレームワークのUI部品を作成するためのメソッド
        //context => Context型。iPhoneの位置情報などを地図上に表示するなどのために必要。
        return MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //updateUIView => 別のフレームワークのUI部品が作成された後、そのUI部品のプロパティを
        //変更するためのメソッド
    }
}
//橋渡しのコード
//struct 構造体名: UIViewRepresentable {
//    func makeUIView(context: Context) -> クラス名 {
//      return クラス名()
//    }
//    func updateUIView(_ uiView: クラス名, context: Context) {
//    }
// }

struct ContentView: View {
    //ContentView => 構造体名
    //View => プロトコル名
    var body: some View {
        MapView()
        //この部分は今回使用するMKMapViewクラスではなく、MapViewという構造体が使われている
        //21行目、bodyの戻り値はsome viewであり、この型はSwift UIフレームワークに含まれているUI部品しか受け付けない
        //なのでMapKitフレームワークに含まれるUI部品をSwift UIフレームワークへ橋渡しするためのコードが必要になる(12行目〜)
        //※古いフレームワークを使用する場合は橋渡しするコードも必ず必要になる
        //橋渡しをすることでMapViewという構造体をSwiftフレームワークで使えるようにする
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        //このメソッドはiPhone画面の上下の余白を超えてUI部品を表示するための装飾部品
        //このメソッドを削除すると上下に余白が生まれる
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
