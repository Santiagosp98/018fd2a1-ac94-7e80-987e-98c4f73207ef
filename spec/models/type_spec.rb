# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Type, type: :model do
  context 'before creation' do
    let(:type) { Fabricate.build(:type) }
    let(:type_with_settings) { Fabricate.build(:type_with_settings) }
    let(:type_with_invalid_settings_schema) { Fabricate.build(:type_with_invalid_settings_schema) }

    it 'should be valid with no settings' do
      expect(type).to be_valid
    end

    it 'should be valid with settings' do
      expect(type_with_settings).to be_valid
    end

    it 'should be invalid without required attributes' do
      expect(Type.new).to be_invalid
    end

    it 'should be invalid with wrong settings schema' do
      expect(type_with_invalid_settings_schema).to be_invalid
    end
  end
end
