require 'rails_helper'

RSpec.describe Destination, type: :model do

  before do
    @destination = FactoryBot.build(:destination)
  end

  describe '運行先の記録' do
    context '運行先の記録ができる場合' do
      it "user, month, long_distance, middle_distance, short_distance の値が存在すれば作成できる" do
        expect(@destination).to be_valid
      end
    end
    context '運行先の記録ができない場合' do
      it 'userが紐付いていないと保存できない' do
        @destination.user = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include('User must exist')
      end

      it 'monthが空では作成できない' do
        @destination.month = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Month can't be blank")
      end

      it 'long_distanceが空では作成できない' do
        @destination.long_distance = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Long distance can't be blank")
      end

      it 'middle_distanceが空では作成できない' do
        @destination.middle_distance = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Middle distance can't be blank")
      end

      it 'short_distanceが空では作成できない' do
        @destination.short_distance = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Short distance can't be blank")
      end
    end
  end


end
