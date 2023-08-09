require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録のユーザー情報' do
    context '新規登録できる場合' do
      it '必要な情報をすべて入力' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nickname必須' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'email空白' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが一意性である' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'password空白' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみ' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが英字のみ' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end

  describe 'ユーザー新規登録の本人情報確認' do
    # 新規登録できる場合は8〜12行目で実施済み
    context '新規登録できない場合' do
      it 'お名前（全角）の名字が空白' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前（全角）の名前が空白' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前（全角）の名字がアルファベット' do
        @user.last_name = 'nihon'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters.')
      end
      it 'お名前（全角）の名字が半角カタカナ' do
        @user.last_name = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters.')
      end
      it 'お名前（全角）の名字が特殊記号' do
        @user.last_name = '/'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters.')
      end
      it 'お名前（全角）の名前がアルファベット' do
        @user.first_name = 'osaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters.')
      end
      it 'お名前（全角）の名前が半角カタカナ' do
        @user.first_name = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters.')
      end
      it 'お名前（全角）の名前が特殊記号' do
        @user.first_name = '?'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters.')
      end
      it 'お名前カナ（全角）の名字がアルファベット' do
        @user.last_name_kana = 'nihon'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Input full-width katakana characters.')
      end
      it 'お名前カナ（全角）の名字が半角カタカナ' do
        @user.last_name_kana = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Input full-width katakana characters.')
      end
      it 'お名前カナ（全角）の名字が特殊記号' do
        @user.last_name_kana = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Input full-width katakana characters.')
      end
      it 'お名前カナ（全角）の名前がアルファベット' do
        @user.first_name_kana = 'osaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Input full-width katakana characters.')
      end
      it 'お名前カナ（全角）の名前が半角カタカナ' do
        @user.first_name_kana = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Input full-width katakana characters.')
      end
      it 'お名前カナ（全角）の名前が特殊記号' do
        @user.first_name_kana = '&'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Input full-width katakana characters.')
      end
      it 'お名前カナ（全角）の名字が空白' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ（全角）の名前が空白' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '生年月日が空白' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '生まれた月日が空白' do
        @user.birthday = '1991'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '生まれた日が空白' do
        @user.birthday = '199101'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
