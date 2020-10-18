require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとbirthdayとfirst_nameとlast_nameとfirst_name_kanaとlast_name_kanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Nicknameを入力してください')
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Emailを入力してください')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Emailはすでに存在します')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordを入力してください', 'Passwordを入力してください', 'Passwordは6文字以上で入力してください', 'Passwordを入力してください', 'Passwordは英大文字・小文字・数字それぞれ１文字以上含む必要があります', 'Password confirmationとPasswordの入力が一致しません')
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordは6文字以上で入力してください', 'Passwordは6文字以上で入力してください', 'Passwordは英大文字・小文字・数字それぞれ１文字以上含む必要があります')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmationとPasswordの入力が一致しません')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Birthdayを入力してください')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First nameを入力してください', 'First nameユーザー本名は全角（漢字・ひらがな・カタカナ）で入力')
      end

      it 'first_nameが英字では登録できない' do
        @user.first_name = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include('First nameユーザー本名は全角（漢字・ひらがな・カタカナ）で入力')
      end

      it 'first_nameが数字では登録できない' do
        @user.first_name = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('First nameユーザー本名は全角（漢字・ひらがな・カタカナ）で入力')
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanaを入力してください', 'First name kanaユーザー本名のフリガナは全角（カタカナ）で入力させること')
      end

      it 'first_name_kanaが英字では登録できない' do
        @user.first_name_kana = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanaユーザー本名のフリガナは全角（カタカナ）で入力させること')
      end

      it 'first_name_kanaが数字では登録できない' do
        @user.first_name_kana = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanaユーザー本名のフリガナは全角（カタカナ）で入力させること')
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last nameを入力してください', 'Last nameユーザー本名は全角（漢字・ひらがな・カタカナ）で入力')
      end

      it 'last_nameが英字では登録できない' do
        @user.last_name = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last nameユーザー本名は全角（漢字・ひらがな・カタカナ）で入力')
      end

      it 'last_nameが数字では登録できない' do
        @user.last_name = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last nameユーザー本名は全角（漢字・ひらがな・カタカナ）で入力')
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanaを入力してください', 'Last name kanaユーザー本名のフリガナは全角（カタカナ）で入力させること')
      end

      it 'last_name_kanaが英字では登録できない' do
        @user.last_name_kana = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanaユーザー本名のフリガナは全角（カタカナ）で入力させること')
      end

      it 'last_name_kanaが数字では登録できない' do
        @user.last_name_kana = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanaユーザー本名のフリガナは全角（カタカナ）で入力させること')
      end
    end
  end
end
