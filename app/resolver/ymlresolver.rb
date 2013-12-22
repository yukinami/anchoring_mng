require 'yaml'

module AnchoringResolver
  class YmlResolver
  
    def initialize(path)
      File.open(path) do |yf|
        @@resolver = YAML::load(yf)
      end
    end
  
    def resolve(entry={})
      position = @@resolver[entry[:entity].to_sym][entry[:field].to_sym]
    end
  
  end
end

