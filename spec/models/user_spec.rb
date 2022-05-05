require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname、password、password_confirmation、last_name、first_name、ruby_last_name、ruby_first_name、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の半角英数字混合であれば登録できる' do
        @user.password = '1a1a1a'
        @user.password_confirmation = '1a1a1a'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致していれば登録できる' do
        @user.password = '1a1a1a'
        @user.password_confirmation = '1a1a1a'
        expect(@user).to be_valid
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.last_name = '鈴木'
        expect(@user).to be_valid
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.last_name = '一郎'
        expect(@user).to be_valid
      end
      it 'ruby_last_nameが全角カタカナであれば登録できる' do
        @user.ruby_last_name = 'スズキ'
        expect(@user).to be_valid
      end
      it 'ruby_first_nameが全角カタカナであれば登録できる' do
        @user.ruby_first_name = 'イチロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailが既存のものと重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが6文字未満だと登録できない' do
        @user.password = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード半角英数字混合で入力してください')
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'ruby_last_nameが空だと登録できない' do
        @user.ruby_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓フリガナを入力してください")
      end
      it 'ruby_last_nameが全角カタカナでないと登録できない' do
        @user.ruby_last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓フリガナ全角カタカナで入力してください')
      end
      it 'ruby_first_nameが空だと登録できない' do
        @user.ruby_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名フリガナを入力してください")
      end
      it 'ruby_first_nameが全角カタカナでないと登録できない' do
        @user.ruby_first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名フリガナ全角カタカナで入力してください')
      end
      it 'birth_dateが空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
