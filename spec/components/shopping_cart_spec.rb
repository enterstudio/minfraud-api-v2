require 'spec_helper'

describe Minfraud::Components::ShoppingCart do
  let(:instance) { described_class.new }

  describe '#initialize' do
    context 'with no provided params' do
      it '@items is an instance of Array' do
        expect(instance.items).to be_an_instance_of Array
      end

      it '@items is an empty array' do
        expect(instance.items).to eq []
      end
    end

    context 'with provided params' do
      let(:instance) { described_class.new([{}]) }

      it '@items is an array of Minfraud::Components::ShoppingCartItem instances' do
        expect(instance.items).to all(be_a Minfraud::Components::ShoppingCartItem)
      end
    end
  end

  describe '#to_json' do
    context 'with no provided params' do
      it 'returns an empty array' do
        expect(instance.to_json).to eq []
      end
    end

    context 'with provided params' do
      it 'returns an array of items converted to json' do
        expected = [
          { 'category' => 'test@example.com' },
          { 'category' => 'superman@example.com' }
        ]

        instance = described_class.new([
          { category: 'test@example.com' },
          { category: 'superman@example.com' }
        ])

        expect(instance.to_json).to eq(expected)
      end
    end
  end
end
