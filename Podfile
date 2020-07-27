platform :ios, '13.4'

target 'TMDB' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TMDB
  pod 'Alamofire', '~> 5.1'
  pod 'R.swift', '~> 5.1.0'
  pod 'RxSwift', '~> 5.0'
  pod 'Kingfisher', '5.14.1'
  pod 'SwiftLint', '~> 0.39.2'

  target 'TMDBTests' do
    inherit! :search_paths
    pod 'Quick', '3.0.0'
    pod 'Nimble', '8.1.1'
  end

  target 'TMDBUITests' do
    inherit! :search_paths
    pod 'KIF', :configurations => ['Debug']
  end

end
