require 'login'

set :run, false
set :openid_login_config, File.join(File.expand_path(File.dirname(__FILE__)), "config.yml")

run Sinatra::Application
