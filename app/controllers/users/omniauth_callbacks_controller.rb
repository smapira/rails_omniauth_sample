class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # https://qiita.com/nishina555/items/4ffaf5cc57a384b66230#%E3%81%95%E3%81%84%E3%81%94%E3%81%AB
  # Above the Can't verify CSRF token authenticity
  skip_before_action :verify_authenticity_token

  def apple
    callback_from(:apple)
  end

  def google_oauth2
    callback_from(:google_oauth2)
  end

  def callback_from(provider)
    provider = provider.to_s
    @user = User.find_or_create_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  private

  def verified_request?
    action_name == 'apple' || super
  end
end
