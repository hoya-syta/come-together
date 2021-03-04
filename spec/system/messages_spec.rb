require 'rails_helper'

RSpec.describe "Messages", type: :system do
  before do
    @post = FactoryBot.create(:post)
    @message = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーは投稿記事詳細ページでメッセージ投稿できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'user_email', with: @post.user.email
    fill_in 'user_password', with: @post.user.password
    find('input[name="commit"]').click
    # ツイート詳細ページに遷移する
    visit post_path(@post)
    # フォームに情報を入力する
    fill_in 'message_content', with: @message
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Message.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq(post_path(@post))
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @message
  end
end