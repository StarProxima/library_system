Gem::Specification.new do |spec|
  spec.name        = 'starproxima_library'
  spec.version     = '0.1.0'
  spec.authors     = ['StarProxima']
  spec.email       = 'starproxima@yandex.ru'
  spec.summary     = 'Starproxima library app'
  spec.description = 'Description Starproxima library app'
  spec.homepage    = 'https://github.com/StarProxima/library_system'
  spec.license     = 'MIT'

  spec.files       = Dir.glob("**/*")
  spec.require_paths = ['lib']

  spec.add_dependency 'win32api'
end
