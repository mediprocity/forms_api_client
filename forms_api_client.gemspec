# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'forms_api_client'
  spec.version = '0.1.0'
  spec.authors = ['Mediprocity']
  spec.email = ['a.partitskiy@gmail.com']

  spec.summary = 'Forms API service client'
  spec.description = 'Shared Forms API service client for API communication.'
  spec.homepage = 'https://mediprocity.com'
  spec.required_ruby_version = '>= 3.2.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir.chdir(__dir__) { Dir['lib/**/*.rb'] + ['forms_api_client.gemspec'] }
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client'
end
