# frozen_string_literal: true

# Custom validator that checks the structure of a json object.
class JsonSchemaValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    schema_name = "#{record.class.name.underscore}.#{attribute}"
    schema_path = Rails.root.join('app', 'models', 'schemas', "#{schema_name}.schema.json").to_s

    errors = JSON::Validator.fully_validate(schema_path, value)

    return unless errors.any?

    errors.each do |error|
      record.errors.add(attribute, error)
    end
  end
end
