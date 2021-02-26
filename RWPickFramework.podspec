Pod::Spec.new do |spec|
  spec.name           = "RWPickFramework"
  spec.version        = "1.0.4"
  spec.summary        = "Elegant Login"
  spec.homepage       = "https://github.com/miguelDelgado333/RWPickList"
  spec.license        = "IMT"
  spec.author         = "Miguel Angel Delgado Álcantara"
  spec.platform       = :ios, "12.0"
  spec.swift_versions = "5.0"
  spec.source         = { :git => "https://github.com/miguelDelgado333/RWPickList.git", :tag => "v#{spec.version}" }
  spec.source_files   = "RWPickFramework/**/*.swift"
  spec.dependency       "Alamofire"
  spec.dependency       "IQKeyboardManagerSwift"
end
