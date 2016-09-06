Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_app_id, Rails.application.secrets.facebook_secret_key
  provider :twitter, Rails.application.secrets.twitter_app_id, Rails.application.secrets.twitter_sectet_key
end