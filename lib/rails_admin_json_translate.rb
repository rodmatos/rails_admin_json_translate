require 'rails_admin_json_translate/engine'
require 'rails_admin'
require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'
require 'i18n-language-translations'
require 'emoji_flag'

module RailsAdmin
  module Config
    module Fields
      module Types
        class JsonTranslate < RailsAdmin::Config::Fields::Types::Text
          RailsAdmin::Config::Fields::Types.register(:json_translate, self)

          register_instance_option :partial do
            :form_json_translate
          end

          register_instance_option :pretty_value do
            value_for_locale(current_locale)
          end

          register_instance_option :locales do
            I18n.available_locales
          end

          def parse_value(value)
            value.present? ? JSON.generate("#{I18n.locale}" => value) : nil
          end

          def parse_input(params)
            params[name] = parse_value(params[name]) if params[name].is_a?(::String)
          end

          def value_for_locale(locale)
            val = @bindings[:object].send(name)
            return '' unless val

            val = JSON.parse(val) unless val.is_a?(Hash)
            val.try(:[], locale.to_s)
          rescue JSON::ParserError
            ''
          end

          def current_locale
            value_for_locale(I18n.locale).blank? ? locales.first : I18n.locale
          end
        end
      end
    end
  end
end
