require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまくいくとき" do
      it "Name,Email,Password,Password_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録が上手く行かないとき" do
      it "Nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it "Emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
      end
      it "Passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordを入力してください")
      end
    end
  end

  describe"その他条件" do
    it "他に同一のEmailがあると登録できない" do
      @user = User.new(name: "yamada", email:"aaa@gmail.com", password:"a00000", password_confirmation:"a00000")
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Emailはすでに存在します")
    end
    it "Passwordが6文字以上でないと登録できない"do
      @user.password = "a0000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordは6文字以上で入力してください")
    end
    it "Passwordが半角英数字で構成されていないと登録できない"do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordは英数混合")
    end
    it "Password_confirmationとPasswordが一致していないと登録できない"do
      @user.password_confirmation = "b00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
    end
  end
end
