# frozen_string_literal: true

module SolidusGraphqlApi
  module Mutations
    module User
      class Login < BaseMutation
        include Devise::Controllers::Helpers

        null true

        argument :email, String, required: true
        argument :password, String, required: true

        field :user, Types::User, null: true

        def resolve(email:, password:)
          user = Spree.user_class.find_for_database_authentication(email: email)

          return unless user.present?
          return unless user.valid_password?(password)

          context[:warden].set_user(user)

          { user: user }
        end
      end
    end
  end
end
