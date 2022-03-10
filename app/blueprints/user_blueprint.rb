# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :email

  field :token do |user|
    AuthenticationTokenService.call(user.id)
  end
end
