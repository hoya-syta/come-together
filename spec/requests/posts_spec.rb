require 'rails_helper'
describe PostsController, type: :request do

  before do
    @post = FactoryBot.create(:post)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      binding.pry
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事のテキストが存在する' do 
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事の画像URLが存在する' do 
    end
    it 'indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do 
    end
    it 'indexアクションにリクエストするとレスポンスに投稿ボタンが存在する' do 
    end
  end
end