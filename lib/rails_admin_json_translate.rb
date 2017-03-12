require 'rails_admin_json_translate/engine'
require 'rails_admin'
require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class JsonTranslate < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types.register(:json_translate, self)

          register_instance_option :partial do
            :form_json_translate
          end

          register_instance_option :pretty_value do
            value_for_locale(I18n.locale)
          end

          def value_for_locale(locale)
            val = @bindings[:object].send(name)
            val ? JSON.parse(val).try(:[], locale.to_s) : ''
          rescue JSON::ParserError
            ''
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
