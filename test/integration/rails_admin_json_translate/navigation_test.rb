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

    test 'renders localized data in panes' do
      visit "/post/#{@post.id}/edit"

      within(".json-translate-pane-title_translations-en-#{@post.id}") do
        value = find_by_id('post_title_translations_en').value
        assert_equal 'All or nothing', value
      end

      within(".json-translate-pane-title_translations-nl-#{@post.id}") do
        value = find_by_id('post_title_translations_nl').value
        assert_equal 'Alles of niets', value
      end
    end
  end
end
