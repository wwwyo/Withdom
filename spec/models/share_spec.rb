require 'rails_helper'
RSpec.describe Share, type: :model do
  before do
    @share = FactoryBot.build(:share)
  end

  describe "新規投稿" do
    context "新規投稿がうまくいくとき" do
      it "title,share_url,comment,category_id,user_idが存在すれば登録できる" do
        expect(@share).to be_valid
      end
    end
    context "新規投稿が上手く行かないとき" do
      it "titleが空だと登録できない" do
        @share.title = ""
        @share.valid?
        expect(@share.errors.full_messages).to include("Titleを入力してください")
      end
      it "share_urlが空だと登録できない" do
        @share.share_url = ""
        @share.valid?
        expect(@share.errors.full_messages).to include("URLを入力してください")
      end
      it "commentが空だと登録できない" do
        @share.comment = ""
        @share.valid?
        expect(@share.errors.full_messages).to include("Commentを入力してください")
      end
      it "category_idが空だと登録できない" do
        @share.category_id = ""
        @share.valid?
        expect(@share.errors.full_messages).to include("Categoryを入力してください")
      end
    end
  end
end
