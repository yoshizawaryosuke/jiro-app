require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep(1)
  end

  describe 'ユーザ新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で半角英数字混合であれば登録できる' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'email@がないと登録できない' do
        @user.email = 'hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが存在してもpassword_confirmationが一致しなければ登録できない' do
        @user.password = 'a00000'
        @user.password_confirmation = 'b00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'Ａ00000'
        @user.password_confirmation = 'Ａ00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'noodleが未選択だと保存できない' do
        @user.noodle_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Noodle can't be blank")
      end
      it 'noodleが0だと保存できない' do
        @user.noodle_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("Noodle can't be blank")
      end
      it 'soupが未選択だと保存できない' do
        @user.soup_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Soup can't be blank")
      end
      it 'soupが0だと保存できない' do
        @user.soup_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("Soup can't be blank")
      end
      it 'meatが未選択だと保存できない' do
        @user.meat_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Meat can't be blank")
      end
      it 'meatが0だと保存できない' do
        @user.meat_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("Meat can't be blank")
      end
      it 'vegetableが未選択だと保存できない' do
        @user.vegetable_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Vegetable can't be blank")
      end
      it 'vegetableが0だと保存できない' do
        @user.vegetable_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("Vegetable can't be blank")
      end
      it 'garlicが未選択だと保存できない' do
        @user.garlic_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Garlic can't be blank")
      end
      it 'garlicが0だと保存できない' do
        @user.garlic_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("Garlic can't be blank")
      end
      it 'oilが未選択だと保存できない' do
        @user.oil_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Oil can't be blank")
      end
      it 'oilが0だと保存できない' do
        @user.oil_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("Oil can't be blank")
      end
    end
  end
end