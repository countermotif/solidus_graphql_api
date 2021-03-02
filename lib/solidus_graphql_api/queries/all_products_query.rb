# frozen_string_literal: true

module SolidusGraphqlApi
  module Queries
    class AllProductsQuery
      def call
        Spree::Product.all
      end
    end
  end
end
