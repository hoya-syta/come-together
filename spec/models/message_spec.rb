require 'rails_helper'

RSpec.describe Message, type: :model do
  describe Message do
    before do
      @message = FactoryBot.build(:message)
    end

    describe 'メッセージ投稿の可否' do
      context '投稿ができる場合' do
        it '全ての項目が存在すれば登録できる。' do
          expect(@message).to be_valid
        end
      end

      context '投稿ができない場合' do
        it 'contentが空では登録できない' do
          @message.content = ''
          @message.valid?
          expect(@message.errors.full_messages).to include("メッセージを入力してください")
        end
      end
    end
  end
end
