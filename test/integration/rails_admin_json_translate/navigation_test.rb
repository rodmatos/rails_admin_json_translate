require 'test_helper'

module RailsAdminJsonTranslate
  class NavigationTest < ActionDispatch::IntegrationTest
    setup do
      @routes = Engine.routes
      @post = posts(:one)
    end

    test 'renders all post locales' do
      visit '/post/new'

      tabs = first('.json_translate_type').find('.nav-tabs')

      assert_equal true, tabs.has_content?('en nl de')
    end
  end
end
