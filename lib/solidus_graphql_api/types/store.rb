# frozen_string_literal: true

module SolidusGraphqlApi
  module Types
    class Store < Base::RelayNode
      description 'Store.'

      field :cart_tax_country_iso, String, null: true
      field :code, String, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :currencies, Currency.connection_type, null: false
      field :default_currency, String, null: true
      field :default, Boolean, null: false
      field :mail_from_address, String, null: false
      field :meta_description, String, null: true
      field :meta_keywords, String, null: true
      field :name, String, null: false
      field :seo_title, String, null: true
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
      field :url, String, null: false
      field :products, Product.connection_type, null: false
      field :featured_products, Product.connection_type, null: false
      field :best_selling_products, Product.connection_type, null: true
      field :newest_products, Product.connection_type, null: false

      def currencies
        Spree::Config.available_currencies
      end

      def products
        Queries::AllProductsQuery.new.call
      end

      def featured_products
        Queries::FeaturedProductsQuery.new.call
      end

      def best_selling_products
        Queries::BestSellingProductsQuery.new.call
      end

      def newest_products
        Queries::NewestProductsQuery.new.call
      end
    end
  end
end
