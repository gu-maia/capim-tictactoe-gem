Gem::Specification.new do |spec|
  spec.name                  = 'capim_tictactoe'
  spec.version               = '0.0.2'
  spec.executables << "capim_tictactoe"
  spec.authors               = ['Gustavo Maia']
  spec.email                 = ['contato@gustaavomaia.com']
  spec.summary               = 'A tictactoe CLI app'
  spec.description           = 'This gem is a coding challenge proposed by @capim'
  spec.homepage              = 'https://github.com/itsmaia/blank'
  spec.license               = 'MIT'
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.5.0'

  spec.files = Dir['lib/**/*.rb']

  spec.add_dependency 'rainbow'

  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rspec'
end
