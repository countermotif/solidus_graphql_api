# frozen_string_literal: true

module SolidusGraphqlApi
  module Mutations
    module User
      class CreateUser < BaseMutation
        include Devise::Controllers::Helpers

        null true

        argument :email, String, required: true
        argument :password, String, required: true
        argument :first_name, String, required: false
        argument :last_name, String, required: false

        field :user, Types::User, null: true
        field :errors, [Types::UserError], null: false

        def resolve(email:, password:, first_name:, last_name:)
          user = Spree.user_class.new(
            email: email, 
            password: password,
            password_confirmation: password
          )

          if user.valid? && !user.persisted?
            user.save
            context[:warden].set_user(user)
            errors = []
          else
            errors = user.errors
            user = nil
          end

          { 
            user: user,
            errors: user_errors('user', errors)
          }
        end
      end
    end
  end
end
