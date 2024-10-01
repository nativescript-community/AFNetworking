Pod::Spec.new do |s|
  s.name     = 'AFNetworking'
  s.version  = '4.0.2'
  s.license  = 'MIT'
  s.summary  = 'A delightful networking framework for Apple platforms.'
  s.homepage = 'https://github.com/ctsfork/AFNetworking'
  s.social_media_url = 'https://twitter.com/AFNetworking'
  s.authors  = { 'Mattt Thompson' => 'm@mattt.me' }
  s.source   = { :git => 'https://github.com/ctsfork/AFNetworking.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.ios.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.alamofire.AFNetworking' }
  s.osx.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.alamofire.AFNetworking' }
  s.watchos.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.alamofire.AFNetworking-watchOS' }
  s.tvos.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.alamofire.AFNetworking' }

  s.source_files = 'AFNetworking/AFNetworking.h'


  ## 隐私清单
  # s.resource_bundles = {'AFNetworking' => ['Framework/PrivacyInfo.xcprivacy']}
  # s.resources = ['Framework/PrivacyInfo.xcprivacy']


  s.subspec 'Privacy' do |sub|
    sub.resource_bundles = {
        s.name => 'Framework/PrivacyInfo.xcprivacy'
    }
  end


  s.subspec 'Serialization' do |ss|
    ss.source_files = 'AFNetworking/AFURL{Request,Response}Serialization.{h,m}'

    ss.dependency 'AFNetworking/Privacy'

    ## 隐私清单
    # ss.resource_bundles = {'AFNetworking' => ['Framework/PrivacyInfo.xcprivacy']}
  end

  s.subspec 'Security' do |ss|
    ss.source_files = 'AFNetworking/AFSecurityPolicy.{h,m}'


    ss.dependency 'AFNetworking/Privacy'

    ## 隐私清单
    # ss.resource_bundles = {'AFNetworking' => ['Framework/PrivacyInfo.xcprivacy']}
  end

  s.subspec 'Reachability' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.osx.deployment_target = '10.10'
    ss.tvos.deployment_target = '9.0'

    ss.source_files = 'AFNetworking/AFNetworkReachabilityManager.{h,m}'


    ss.dependency 'AFNetworking/Privacy'

    ## 隐私清单
    # ss.resource_bundles = {'AFNetworking' => ['Framework/PrivacyInfo.xcprivacy']}
  end

  s.subspec 'NSURLSession' do |ss|
    ss.dependency 'AFNetworking/Serialization'
    ss.ios.dependency 'AFNetworking/Reachability'
    ss.osx.dependency 'AFNetworking/Reachability'
    ss.tvos.dependency 'AFNetworking/Reachability'
    ss.dependency 'AFNetworking/Security'

    ss.source_files = 'AFNetworking/AF{URL,HTTP}SessionManager.{h,m}', 'AFNetworking/AFCompatibilityMacros.h'

    ## 隐私清单
    # ss.resource_bundles = {'AFNetworking' => ['Framework/PrivacyInfo.xcprivacy']}
    # s.resources = ['Framework/PrivacyInfo.xcprivacy']

  end

  s.subspec 'UIKit' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.tvos.deployment_target = '9.0'
    ss.dependency 'AFNetworking/NSURLSession'

    ss.source_files = 'UIKit+AFNetworking'

    ## 隐私清单
    # ss.resource_bundles = {'AFNetworking' => ['Framework/PrivacyInfo.xcprivacy']}
  end
end
