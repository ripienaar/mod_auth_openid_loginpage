require 'rubygems'
require 'sinatra'

set :static, true
set :views, File.join(File.expand_path(File.dirname(__FILE__)), "views")

if Sinatra.const_defined?("VERSION") && Gem::Version.new(Sinatra::VERSION) >= Gem::Version.new("1.3.0")
  set :public_folder, File.join(File.expand_path(File.dirname(__FILE__)), "public")
else
  set :public, File.join(File.expand_path(File.dirname(__FILE__)), "public")
end

get '/' do
  config_file = File.join(File.expand_path(File.dirname(__FILE__)), "config.yml")

  @config = {:links => [],
             :title => "OpenID Login",
             :prompt => "An OpenID login is required:"}

  if File.exist?(config_file)
    @config.merge!(YAML.load_file(config_file))
  end

  unless params["modauthopenid.referrer"]
    @error = "Please browse to a site that requires an OpenID login"
    erb ""
  else
    if error = params["modauthopenid.error"]
      case error
        when "no_idp_found"
          @error = "The URL you provided could not be found"
        when "invalid_id"
          @error = "The ID provided by your OpenID provider is not in the correct format"
        when "idp_not_trusted"
          @error = "The OpenID provider you are using is not trusted by this system"
        when "invalid_nonce"
          @error = "Invalid <em>nonce</em> received, you might need to enable cookies"
        when "canceled"
          @error = "Login did not complete, user cancelled the process"
        when "unspecified"
          @error = "An unspecified error occured, please try again"
        else
          @error = "An unknown error occured, code was <em>%s</em>" % params["modauthopenid.error"]
      end
    end

    erb :login_page
  end
end
