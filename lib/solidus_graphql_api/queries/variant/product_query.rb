# frozen_string_literal: true

module SolidusGraphqlApi
  module Queries
    module Variant
      class ProductQuery
        attr_reader :variant

        def initialize(variant:)
          @variant = variant
        end

        def call
          SolidusGraphqlApi::BatchLoader.for(variant, :product)
        end
      end
    end
  end
end
