# spec/validators/zip_code_validator_spec.rb
require 'spec_helper'

describe ZipCodeValidator, '#validate_each' do
  it 'does not add errors with a valid zip code' do
    record = build_record('93108')

    ZipCodeValidator.new(attributes: :zip_code).validate(record)

    record.errors.should be_empty
  end

  it 'adds errors with an invalid zip code' do
    record = build_record('invalid_zip')

    ZipCodeValidator.new(attributes: :zip_code).validate(record)

    record.errors.full_messages.should eq [
      'Zip code invalid_zip is not a valid zip code'
    ]
  end

  def build_record(zip_code)
    test_class.new.tap do |object|
      object.zip_code = zip_code
    end
  end

  def test_class
    Class.new do
      include ActiveModel::Validations
      attr_accessor :zip_code

      def self.name
        'TestClass'
      end
    end
  end
end
