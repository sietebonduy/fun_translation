require File.expand_path('lib/fun_translation/version', __dir__)

Gem::Specification.new do |spec|
  spec.name                  = 'fun_translation'
  spec.version               = FunTranslation::VERSION
  spec.authors               = ['Denis Domanin']
  spec.email                 = ['den768653@gmail.com']
  spec.summary               = ''
  spec.description           = ''
  spec.homepage              = 'https://github.com/bodrovis/fun_translations'
  spec.license               = 'MIT'
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.7.0'

  spec.files = Dir['lib/**/*.rb',
                   'fun_translations.gemspec',
                   'Gemfile']
  # spec.extra_rdoc_files = ['README.md']
  spec.require_paths    = ['lib']

  spec.add_dependency 'faraday', '~> 2.6'
  spec.add_dependency 'zeitwerk', '~> 2.4'

  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end