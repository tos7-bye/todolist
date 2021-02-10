require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid  # user.valid? が true になればパスする
    end

    it "userの登録情報" do
      user = create(:user)
      expect(user.name).to eq("test")
      expect(user.email).to eq("test@gmail.com")
      expect(user.password).to eq("111111")
      expect(user.password_confirmation).to eq("111111")
    end
  end

  describe '入力項目の有無' do
    context '必須入力であること' do
      it '名前が必須であること' do
        new_user = User.new
        expect(new_user).not_to be_valid

        expect(new_user.errors[:name]).to include("translation missing: ja.activerecord.errors.models.user.attributes.name.blank")
      end

      it 'メールアドレスが必須であること' do
        new_user = User.new
        expect(new_user).not_to be_valid

        expect(new_user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.blank")
      end

      it 'パスワードが必須であること' do
        new_user = User.new
        expect(new_user).not_to be_valid

        expect(new_user.errors[:password]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password.blank")
      end

      it '登録できないこと' do
        new_user = User.new

        expect(new_user.save).to be_falsey
      end
    end
  end

  describe "メールアドレスの形式" do
    context "不正な形式のメールアドレスの場合" do
      it "エラーになる" do
        new_user = User.new
        new_user.email = "hoge.foobar"
        expect(new_user).not_to be_valid

        expect(new_user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.invalid", "translation missing: ja.activerecord.errors.models.user.attributes.email.invalid")
      end
    end
  end
end
