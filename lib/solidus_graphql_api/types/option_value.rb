# frozen_string_literal: true

module SolidusGraphqlApi
  module Types
    class OptionValue < Base::RelayNode
      description 'OptionValue.'

      field :created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :name, String, null: false
      field :position, String, null: false
      field :presentation, String, null: false
      field :option_type, OptionType, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

      def option_type
        object.option_type
      end
    end
  end
end
