//
//  WishListDetailView.swift
//  MyThings
//
//  Created by 고명주 on 2023/01/23.
//

import SwiftUI

struct WishListDetailView: View {
  var itemId: Int
  var userId: Int
  @EnvironmentObject var mainViewModel: MyWishListViewModel
  @ObservedObject var viewModel: WishListDetailViewModel
  @State var manager = Network()
  func decimalWon(value: Int) -> String {
          let numberFormatter = NumberFormatter()
          numberFormatter.numberStyle = .decimal
          let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
          
          return result
      }
  init(viewModel: WishListDetailViewModel, itemId: Int, userId: Int) {
    self.itemId = itemId
    self.userId = userId
    self.viewModel = viewModel
  }
  var body : some View {
    ScrollView(Axis.Set.vertical, showsIndicators: true) {
      VStack(alignment: .leading, spacing: 10) {
        AsyncImage(url: URL(string: viewModel.item!.image), content: { image in
          image.resizable()
            .aspectRatio(contentMode: .fit)
        }, placeholder: {
        })
        Text(viewModel.item!.title.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: ""))
          .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
          .font(.system(size: 20, weight: .bold))
        HStack(spacing:0) {
          Text(decimalWon(value: viewModel.item?.price ?? 0))
        }
        .font(.system(size: 20, weight: .bold))
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
        VStack(alignment: .center) {
          Text(viewModel.item?.memo ?? "상품에 대한 한 줄 메모를 남겨보세요.")
            .padding()
            .overlay(
              RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
            )
        }
        .padding()
        Spacer()
        HStack {
          Button {
            self.manager.changeInterestStatus(userId: 1, itemId: viewModel.item!.itemId)
            self.viewModel.getWishListDetail(itemId: viewModel.item!.itemId, userId: 1)
            //            mainViewModel.getWishList(userId: 1, start: "1", size: "10")
            print("cli>>> \(viewModel.item!.interestedItem)")
          } label: {
            Image(systemName: viewModel.item!.interestedItem ? "heart.fill" : "heart")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 30)
              .foregroundColor(viewModel.item!.interestedItem ? .red : .gray)
              .padding()
          }
          Link(destination: URL(string: viewModel.item!.link)!) {
            HStack {
              Text("사이트로 이동하기")
            } .foregroundColor(.white)
          }
          .frame(width: 150, height: 50)
          .background(.blue)
          .cornerRadius(10)
          Button {
            viewModel.getWishListDetail(itemId: 1, userId: 1)
            if viewModel.item!.itemStatus != "BOUGHT" {
              self.manager.changeItemStatus(userId: 1, itemId: viewModel.item!.itemId, itemStatus: "BOUGHT")
            } else if viewModel.item!.itemStatus != "RESERVE" {
              self.manager.changeItemStatus(userId: 1, itemId: viewModel.item!.itemId, itemStatus: "RECEIVED")
            }
          } label: {
            Text("상품 구매하기")
              .foregroundColor(.white)
          }
          .frame(width: 80, height: 50)
          .background(viewModel.item!.itemStatus == "BOUGHT" ? .gray : .blue)
          .cornerRadius(10)
        }
        .padding()
      }
    }
  }
}
