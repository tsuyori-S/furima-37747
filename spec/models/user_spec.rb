require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname、password、password_confirmation、last_name、first_name、ruby_last_name、ruby_first_name、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上の半角英数字混合であれば登録できる" do
        @user.password = "1a1a1a"
        @user.password_confirmation = "1a1a1a"
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが一致していれば登録できる" do
        @user.password = "1a1a1a"
        @user.password_confirmation = "1a1a1a"
        expect(@user).to be_valid
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.last_name = "鈴木"
        expect(@user).to be_valid
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.last_name = "一郎"
        expect(@user).to be_valid
      end
      it "ruby_last_nameが全角カタカナであれば登録できる" do
        @user.ruby_last_name = "スズキ"
        expect(@user).to be_valid
      end
      it "ruby_first_nameが全角カタカナであれば登録できる" do
        @user.ruby_first_name = "イチロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが既存のものと重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email =@user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字未満だと登録できない" do
        @user.password = "111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力してください")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it "ruby_last_nameが空だと登録できない" do
        @user.ruby_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Ruby last name can't be blank")
      end
      it "ruby_last_nameが全角カタカナでないと登録できない" do
        @user.ruby_last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Ruby last name 全角カタカナで入力してください")
      end
      it "ruby_first_nameが空だと登録できない" do
        @user.ruby_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Ruby first name can't be blank")
      end
      it "ruby_first_nameが全角カタカナでないと登録できない" do
        @user.ruby_first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Ruby first name 全角カタカナで入力してください")
      end
      it "birth_dateが空だと登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end