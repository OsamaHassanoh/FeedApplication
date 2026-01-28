//
//  PostCardView.swift
//  FeedApplication
//
//  Created by Osama AlMekhlafi on 28/01/2026.
//

import SwiftUI

struct FeedPostCardView: View {
    @EnvironmentObject var themeManager: ThemeManager
    let postEntity: PostEntity
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                AsyncImage(url: postEntity.user.profileImageURL) { image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                Text(postEntity.user.username)
                    .font(.headline)
                Spacer()
                Image(systemName: "ellipsis")
            }
            AsyncImage(url: postEntity.imageURL) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(height: 320)
            .clipped()
            .cornerRadius(16)
            HStack(spacing: 16) {
                Image(systemName: postEntity.isLiked ? "heart.fill" : "heart")
                    .foregroundColor(postEntity.isLiked ? themeManager.selectedTheme.colors.likedBg : themeManager.selectedTheme.colors.bodyTextColor)
                Image(systemName: "bubble.right")
                Spacer()
            }
            .font(.title3)

            VStack(alignment: .leading, spacing: 4) {
                Text("\(postEntity.likesCount) likes")
                    .font(.subheadline.bold())

                Text(postEntity.caption)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 10, y: 4)
        )
        .padding(.horizontal)
    }
}
