require 'rails_helper'

RSpec.describe User, type: :model do
   before do
    @user = FactoryBot.build(:user)
   end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@がないと登録できない" do
      @user.email = "aaagmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      end
    it "重複したemailが存在すれば登録できない" do
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.email = @user.email
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include("Email has already been taken")
      end
    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    it "passwordが6文字以下であれば登録できない" do
      @user.password = "00000a"
      @user.encrypted_password = "00000a"
      @user.valid?
      expect(@user.errors.full_messages).to include()
      end
    it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include()
      end
    it "encrypted_passwordが空では登録できない" do
      @user.encrypted_password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include()
      end
    it "passwordとencrypted_passwordが不一致では登録できない" do
      @user.password = "123456"
      @user.encrypted_password = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include()
      end
    it "名字が空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角文字を使用してください")
      end
    it "名前が空だと登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角文字を使用してください")
      end
    it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
    it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
    it "フリガナ（名字）が空だと登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カタカナを使用してください")
      end
    it "フリガナ（名前）が空だと登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角カタカナを使用してください")
      end
    it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.first_name = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include()
      end
    it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.last_name = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include()
      end
    it "生年月日が空だと登録できない" do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end