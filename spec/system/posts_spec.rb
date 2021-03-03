require 'rails_helper'

RSpec.describe '新規投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post)
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
        image_path = Rails.root.join("public/images/test_image.png")
        attach_file('post[image]', image_path, make_visible: true)
        # 送信するとTweetモデルのカウントが1上がることを確認する
        expect{
          find('input[name="commit"]').click
        }.to change { Post.count }.by(1)
        # トップページに遷移する
        visit root_path
        # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
        expect(page).to have_selector("img[src$='test_image.png']")
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


    RSpec.describe '投稿記事編集', type: :system do
      before do
        @post1 = FactoryBot.create(:post)
        @post2 = FactoryBot.create(:post)
      end
      context '投稿記事編集ができるとき' do
        it 'ログインしたユーザーは自分が投稿したツイートの編集ができる' do
          # 記事1を投稿したユーザーでログインする
          visit new_user_session_path
          fill_in 'user_email', with: @post1.user.email
          fill_in 'user_password', with: @post1.user.password
          find('input[name="commit"]').click
          expect(current_path).to eq(root_path)
          # post1の投稿が存在することを確認する
          expect(page).to have_content(@post1.title)
          # 編集ページへ遷移する
          visit edit_post_path(@post1)
          # 投稿内容を編集する
          image_path = Rails.root.join("public/images/test_image.png")
          attach_file('post[image]', image_path, make_visible: true)
          fill_in 'post_title', with: "#{@post1.title}+編集したタイトル"
          fill_in 'post_detail', with: "#{@post1.detail}+編集した詳細"
          # 編集してもPostモデルのカウントは変わらないことを確認する
          expect{
            find('input[name="commit"]').click
          }.to change { Post.count }.by(0)
          # 編集完了画面に遷移したことを確認する
          expect(current_path).to eq(post_path(@post1))
          visit root_path
          # トップページには先ほど変更した内容の記事が存在することを確認する（画像）
          expect(page).to have_selector("img[src$='test_image.png']")
          # トップページには先ほど変更した内容の記事が存在することを確認する（タイトル）
          expect(page).to have_content("#{@post1.title}+編集したタイトル")
          # トップページには先ほど変更した内容の記事が存在することを確認する（詳細）
          expect(page).to have_content("#{@post1.detail}+編集した詳細")
        end
      end
      context 'ツイート編集ができないとき' do
        it 'ログインしたユーザーは自分以外が投稿したツイートの編集画面には遷移できない' do
          # 記事1を投稿したユーザーでログインする
          visit new_user_session_path
          fill_in 'user_email', with: @post1.user.email
          fill_in 'user_password', with: @post1.user.password
          find('input[name="commit"]').click
          expect(current_path).to eq(root_path)
          # post2へのリンクがないことを確認する
          expect(page).to have_no_link nil, href: edit_post_path(@post2)
        end
        it 'ログインしていないと記事の編集画面には遷移できない' do
          # トップページにいる
          visit root_path
          # share1,share2へのリンクがないことを確認する
          expect(page).to have_no_link nil, href: edit_post_path(@post1)
          expect(page).to have_no_link nil, href: edit_post_path(@post2)
        end
      end
    end