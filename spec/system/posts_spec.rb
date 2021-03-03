require 'rails_helper'

RSpec.describe '新規投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post)
    @post_image = Faker::Lorem.sentence
  end
  context '新規投稿ができるとき'do
  it 'ログインしたユーザーは新規投稿できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # 新規投稿ページへのリンクがあることを確認する
    expect(page).to have_content('♪投稿する♪')
    # 投稿ページに移動する
    visit new_post_path
    # フォームに情報を入力する
    fill_in 'post_title', with: @post.title
    fill_in 'post_detail', with: @post.detail
    image_path = Rails.root.join("app/assets/images/search.jpg")
    attach_file('post[image]', image_path, make_visible: true)
    # 送信するとTweetモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Post.count }.by(1)
    # トップページに遷移する
    visit root_path
    # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
    expect(page).to have_selector("img[src$='search.jpg']")
    # トップページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
    expect(page).to have_content(@post.title)
  end
end
  context 'ツイート投稿ができないとき'do
  it 'ログインしていないと新規投稿ページに遷移できない' do
    # ログインページに遷移する
    visit new_user_session_path
    # 新規投稿ページへのリンクがない
    expect(page).to have_no_content('♪投稿する♪')
  end
end
end