require 'rails_helper'
describe PostsController, type: :request do

  before do
    @post = FactoryBot.create(:post)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事のタイトルが存在する' do
      get root_path
      expect(response.body).to include(@post.title)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事の詳細が存在する' do 
      get root_path
      expect(response.body).to include(@post.detail)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿ボタンが存在する' do 
      get root_path
      expect(response.body).to include('♪投稿する♪')
    end
  end
end