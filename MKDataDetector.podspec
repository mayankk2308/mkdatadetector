Pod::Spec.new do |spec|
    spec.name = 'MKDataDetector'
    spec.version = '0.9.1'
    spec.ios.deployment_target = '8.0'
    spec.osx.deployment_target = '10.9'
    spec.license = { :type => 'MIT', :file => 'LICENSE.md' }
    spec.source = { :git => 'https://github.com/mayankk2308/mkdatadetector-swift.git', :tag => '0.9.1'}
    spec.authors = {'Mayank Kumar' => 'mayankk2308@gmail.com', 'Jeet Parte' => 'jeetparte@gmail.com', 'Pinak Jalan' => 'pinak.jalan@me.com'}
    spec.homepage = 'https://mayankk2308.github.io/mkdatadetector-swift/'
    spec.summary = 'An open-source convenience wrapper in Swift for NSDataDetector.'
    spec.source_files = 'MKDataDetector/*.swift'
end
