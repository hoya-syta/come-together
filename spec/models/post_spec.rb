require 'rails_helper'

RSpec.describe Post, type: :model do
  describe Post do
    before do
      @post = FactoryBot.build(:post)
    end

    describe '投稿する記事の保存' do
      context '保存ができる場合' do
        it '全ての項目が存在すれば登録できる。' do
          expect(@post).to be_valid
        end
      end

      context '保存ができない場合' do
        it 'titleが空では登録できない' do
          @post.title = ''
          @post.valid?
          expect(@post.errors.full_messages).to include("タイトルを入力してください")
        end
        it 'detailが空では登録できない' do
          @post.detail = ''
          @post.valid?
          expect(@post.errors.full_messages).to include("詳細を入力してください")
        end
        it 'imageが空では登録できない' do
          @post.image = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("画像を入力してください")
        end
      end
    end
  end
end
