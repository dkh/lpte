module Lpte
  class DataLoader < Base
    def initialize(file_name)
      @file_name = file_name
    end

    def call
      YAML.safe_load(erb_template)
    end

    private

    attr_reader :file_name

    def erb_template
      ERB.new(file_content).result
    end

    def file_content
      File.read(file_name)
    end
  end
end
