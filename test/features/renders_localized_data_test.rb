require 'test_helper'

feature 'RailsAdminJsonTranslate' do
  setup do
    @post = posts(:one)
  end

  scenario 'renders localized data in index' do
    visit '/post'

    element = find('.post_row:last-of-type .title_translations_field')

    assert_equal 'All or nothing', element.text
  end

  scenario 'renders all post locales' do
    visit '/post/new'

    tabs = first('.json_translate_type').find('.nav-tabs')

    assert tabs.has_content?('🇬🇧 English 🇳🇱 Dutch 🇩🇪 German')
  end

  scenario 'overridden post locales' do
    visit '/post/new'

    tabs = find('.json_translate_type:last-of-type .nav-tabs')

    assert tabs.has_content?('🇳🇱 Dutch 🇨🇳 Chinese')
  end

  scenario 'renders localized data in panes' do
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

  scenario 'serializes localized data as JSON', js: true do
    data = {
      'en' => 'Title EN',
      'nl' => 'Title NL',
      'de' => 'Title DE'
    }

    visit '/post/new'

    fill_in('post_title_translations_en', with: 'Title EN')
    find_by_id('post_title_translations_field').click_on('🇳🇱 Dutch')
    fill_in('post_title_translations_nl', with: 'Title NL')
    find_by_id('post_title_translations_field').click_on('🇩🇪 German')
    fill_in('post_title_translations_de', with: 'Title DE')

    click_on 'Save'

    assert_equal data, Post.last.title_translations
  end
end
