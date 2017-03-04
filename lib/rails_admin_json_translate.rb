require "rails_admin_json_translate/engine"

module RailsAdminJsonTranslate
  # Your code goes here...
end

require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class JsonTranslate < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types::register(self)
        end
      end
    end
  end
end

RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
  if properties[:name] == :json_translate
    fields << RailsAdmin::Config::Fields::Types::JsonTranslate.new(parent, properties[:name], properties)
    true
  else
    false
  end
end


