if RUBY_ENGINE == 'opal'
  require 'twitch'
else
  require 'opal'
  Opal.append_path File.expand_path('../lib', __FILE__).untaint
end