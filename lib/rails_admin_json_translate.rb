require 'rails_admin_json_translate/engine'
require 'rails_admin'
require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdminJsonTranslate
  # Your code goes here...
end

# require 'rails_admin/config/fields/association'

module RailsAdmin
  module Config
    module Fields
      module Types
        class JsonTranslate < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types.register(:json_translate, self)

          register_instance_option :partial do
            :form_json_translate
          end

          def value_for_locale(locale)
            value.try(:locale) || ''
          end

          def available_locales
            I18n.available_locales
          end

          def current_locale
            I18n.locale
          end
        end
      end
    end
  end
end

# RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
#   puts parent.inspect
#   puts ' '
#   puts properties.inspect
#   puts ' '
#   puts fields.inspect
#
#
#   if properties[:name] == :json_translate
#     fields << RailsAdmin::Config::Fields::Types::JsonTranslate.new(
#       parent,
#       properties[:name],
#       properties
#     )
#     true
#   else
#     false
#   end
# end
