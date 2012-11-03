Gem::Specification.new do |s|
  s.name        = 'civic_info'
  s.version     = '1.0.0'
  s.date        = '2012-11-03'
  s.summary     = 'Wrapper to Google\'s civic info API'
  s.description = ""
  s.authors     = ['J. Cheng']
  s.email       = 'chengjoanne2@gmail.com'
  s.files       = [`git ls-files`.split($\)]
  s.test_files  = s.files.grep(%r{^(test|spec|features)/})
  s.homepage    = 'http://github.com/joannecheng/civic_info'

  s.add_dependency "httparty"
  s.add_dependency 'active_support'
end
