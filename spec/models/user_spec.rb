require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it '全ての項目が存在すれば登録できる。' do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end
        it 'passwordが5文字以下であれば登録できない' do
          @user.password = 'xxxxx'
          @user.password_confirmation = 'xxxxx'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        end
        it 'passwordが6文字以上でも数字のみでは登録できない' do
          @user.password = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは不正な値です")
        end
        it 'passwordが6文字以上でも英字のみでは登録できない' do
          @user.password = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは不正な値です")
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include( '名字を入力してください')
        end
        it 'last_nameが全角ではないと登録できない' do
          @user.last_name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors.full_messages).to include('名字は不正な値です')
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('名前を入力してください')
        end
        it 'first_nameが全角ではないと登録できない' do
          @user.first_name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前は不正な値です')
        end
        it 'last_name_kanaが空では登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("名字カナを入力してください")
        end
        it 'last_name_kanaが全角カタカナでないと登録できない' do
          @user.last_name_kana = 'あいうえお'
          @user.valid?
          expect(@user.errors.full_messages).to include('名字カナは不正な値です')
        end
        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("名前カナを入力してください" )
        end
        it 'first_name_kanaが全角カタカナでないと登録できない' do
          @user.first_name_kana = 'あいうえお'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前カナは不正な値です')
        end
        it 'birthdayが空では登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("生年月日を入力してください")
        end

          it 'age_idが1では登録できない' do
            @user.age_id = '1'
            @user.valid?
            expect(@user.errors.full_messages).to include('年齢は1以外の値にしてください')
          end

          it 'gender_idが1では登録できない' do
            @user.gender_id = '1'
            @user.valid?
            expect(@user.errors.full_messages).to include('性別は1以外の値にしてください')
          end

          it 'prefecture_idが1では登録できない' do
            @user.prefecture_id = '1'
            @user.valid?
            expect(@user.errors.full_messages).to include('都道府県は1以外の値にしてください')
          end

          it 'profession_idが1では登録できない' do
            @user.profession_id = '1'
            @user.valid?
            expect(@user.errors.full_messages).to include('職業は1以外の値にしてください')
          end
      end
    end
  end
end
