Rails.application.config.middleware.use OmniAuth::Builder do
    on_failure do |env|
      PagesController.action(:index).call(env)
    end
end