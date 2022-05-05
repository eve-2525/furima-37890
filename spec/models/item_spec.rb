require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do

      it 'product、product_description、category_id、condition_id、postage_id、area_id、number_of_days_id、price、user、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do

    it 'productが空では登録できない' do
      @item.product = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product can't be blank")
    end

    it 'product_descriptionが空では登録できない' do
      @item.product_description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product_description can't be blank")
    end

    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category_id can't be blank")
    end

    it 'condition_idが空では登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition_id can't be blank")
    end

    it 'postage_idが空では登録できない' do
      @item.postage_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage_id can't be blank")
    end

    it 'area_idが空では登録できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area_id can't be blank")
    end

    it 'number_of_days_idが空では登録できない' do
      @item.number_of_days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Number_of_days_id can't be blank")
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'imageが空では登録できない' do
      @item.image = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    it 'priceが全角数字では登録できない' do
      @item.price = '１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Include both letters and numbers')
    end

    it 'priceが半角英字では登録できない' do
      @item.price = 'aaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Include both letters and numbers')
    end

    it 'priceの値が数字の299以下では登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Include both letters and numbers')
    end

    it 'priceの値が数字の10000000以上では登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Include both letters and numbers')
    end
  end
end
