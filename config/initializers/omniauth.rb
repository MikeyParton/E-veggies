Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "i0KU4jLYYjWzxpTraWviw", "djMu7QStnBK89MkfIg78tIZ4sFhmGOYjdCjDD0Wsc"
  provider :facebook, "332742943732794", "a3e279d4b9320bc5b56e3fea68533c4f"
end