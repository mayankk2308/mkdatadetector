Pod::Spec.new do |spec|
    spec.name = 'MKDataDetector'
    spec.version = '2.0.1'
    spec.ios.deployment_target = '8.0'
    spec.osx.deployment_target = '10.9'
    spec.license = { :type => 'MIT', :file => 'LICENSE.md' }
    spec.source = { :git => 'https://github.com/mayankk2308/mkdatadetector-swift.git', :tag => spec.version.to_s}
    spec.authors = {'Mayank Kumar' => 'mayankk2308@gmail.com', 'Jeet Parte' => 'jeetparte@gmail.com', 'Pinak Jalan' => 'pinak.jalan@me.com'}
    spec.homepage = 'https://mayankk2308.github.io/mkdatadetector-swift/'
    spec.summary = 'A Swift wrapper for NSDataDetector that simplifies detection and application of dates, links, addresses, etc. from natural language text.'
    spec.source_files = 'MKDataDetector/*.swift'
end
