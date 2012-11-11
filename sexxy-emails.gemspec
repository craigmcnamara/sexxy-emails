Gem::Specification.new do |s|
  s.name     = "sexxy-emails"
  s.version  = "0.0.1"
  s.date     = "2012-11-10"
  s.summary  = "Make your email templates sexxy."
  s.description  = "Adds inline css support to action mailer so you can use a stylesheet to tame your email templates."
  s.email    = "craig.mcnamara@gmail.com"
  s.homepage = "https://github.com/craigmcnamara/sexxy-emails"
  s.has_rdoc = true
  s.author  = "Craig McNamara"
  s.add_dependency('css_parser')
  s.add_dependency('nokogiri')
  s.add_dependency('rails', '>= 3.0.0')
  s.add_dependency('rdoc')
  s.add_development_dependency('rake')
  s.add_development_dependency('minitest')
  s.platform = Gem::Platform::RUBY
  s.rdoc_options << '--all' << '--inline-source' << '--line-numbers' << '--charset' << 'utf-8'
  s.files = (Dir.glob('lib/*.rb') | Dir.glob('lib/**/*.rb') | Dir.glob('test/**/*'))
  s.test_files = Dir.glob('test/test_*.rb') 
end
