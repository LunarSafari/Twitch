Gem::Specification.new do |spec|
  spec.name          = 'twitch'
  spec.version       = '0.0.1'
  spec.authors       = ['cichol']
  spec.email         = ['cichol@live.cn']

  spec.summary       = ''
  spec.description   = ''

  spec.files         = Dir.glob("lib/**/*.rb") + %w{ twitch.rb }
  spec.require_paths = ['.']

  spec.add_dependency 'opal', '> 0.10', '< 1.0'
end