Pod::Spec.new do |spec|
    spec.name = 'MKDataDetector'
    spec.version = '2.0.2'
    spec.ios.deployment_target = '8.0'
    spec.osx.deployment_target = '10.9'
    spec.license = { :type => 'MIT', :file => 'LICENSE.md' }
    spec.source = { :git => 'https://github.com/mayankk2308/mkdatadetector.git', :tag => spec.version.to_s}
    spec.authors = {'Mayank Kumar' => 'mayankk2308@gmail.com', 'Jeet Parte' => 'jeetparte@gmail.com'}
    spec.homepage = 'https://mayankk2308.github.io/mkdatadetector/'
    spec.summary = 'A Swift wrapper for NSDataDetector that simplifies detection and application of dates, links, addresses, etc. from natural language text.'
    spec.source_files = 'MKDataDetector/*.swift'
    spec.swift_version = '4.2'
end
