RailsAdmin.config do |config|
  config.actions do
    dashboard
    index
    new
    show
    edit
    delete
  end

  config.model 'Post' do
    configure :title_translations, :json_translate
    configure :body_translations, :json_translate
  end
end
