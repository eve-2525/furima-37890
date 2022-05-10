require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  context '内容に問題ない場合' do
    it 'postal_code、area_id、city、block_number、telephone_number、purchase_record、token、item_id、user_idが存在すれば登録できること' do
      expect(@order).to be_valid
    end

    it 'buildingは空でも保存できること' do
      @order.building = ''
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では登録できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空だと保存できないこと' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end

    it 'area_idを選択していないと保存できないこと' do
      @order.area_id = '1'
      @order.valid?
      expect(@order.errors.full_messages).to include("Area can't be blank")
    end

    it 'cityが空だと保存できないこと' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it 'block_numberが空だと保存できないこと' do
      @order.block_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Block number can't be blank")
    end

    it 'itemが紐付いていないと保存できないこと' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end

    it 'userが紐付いていないと保存できないこと' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end

    it 'telephone_numberが空だと保存できないこと' do
      @order.telephone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number can't be blank")
    end

    it 'telephone_numberが半角の0から始まり10桁または11桁でないと保存できないこと' do
      @order.telephone_number = '123456789101'
      @order.valid?
      expect(@order.errors.full_messages).to include('Telephone number is invalid. Input only number')
    end
  end
end
