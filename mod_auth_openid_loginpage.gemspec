spec = Gem::Specification.new do |s|
  s.name = 'mod_auth_openid_loginpage'
  s.version = "0.0.5"
  s.author = 'R.I.Pienaar'
  s.email = 'rip@devco.net'
  s.homepage = 'http://devco.net/'
  s.platform = Gem::Platform::RUBY
  s.summary = 'mod_auth_openid login page'
  s.description = "A generic login page for mod_auth_openid that can be installed for a sitewide prompt"
  s.files = FileList["{README.md,COPYING,public,views,Gemfile,Gemfile.lock,config.ru,config.yml,lib}/**/*"].to_a
  s.require_paths << 'lib'
  s.has_rdoc = false
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_dependency 'sinatra'
  s.add_dependency 'redcarpet'
end
