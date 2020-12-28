require 'rails_helper'

RSpec.describe '新規投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @share = FactoryBot.build(:share)
  end
  context '新規投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'email-title', with: @user.email
      fill_in 'password-title', with: @user.password
      find('input[class="submit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('NewShare')
      # 投稿ページに移動する
      visit new_share_path
      # フォームに情報を入力する
      fill_in 'title', with: @share.title
      fill_in 'url', with: @share.share_url
      fill_in 'comment', with: @share.comment
      find("option[value='1']").select_option
      # 送信するとshareモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Share.count }.by(1)
      # トップページに遷移する
      visit root_path
      # トップページには先ほど投稿した内容の新規投稿が存在することを確認する（テキスト）
      expect(page).to have_content(@share.title)
    end
  end
  context '新規投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('NewShare')
    end
  end
end

RSpec.describe '投稿編集', type: :system do
  before do
    @share1 = FactoryBot.create(:share)
    @share2 = FactoryBot.create(:share)
  end
  context '投稿編集ができるとき'do
    it 'ログインしたユーザーは自分の投稿の編集ができる' do
      # share1を投稿したユーザーでログインする
      # share1に「編集」ボタンがあることを確認する
      # 編集ページへ遷移する
      # すでに投稿済みの内容がフォームに入っていることを確認する
      # 投稿内容を編集する
      # 編集してもShareモデルのカウントは変わらないことを確認する
      # トップページに遷移する
    end
  end
end