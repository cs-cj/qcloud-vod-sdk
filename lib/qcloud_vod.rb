require 'qcloud_vod/version'
require 'qcloud_vod/configuration'
require 'qcloud_vod/sign'
require 'qcloud_vod/api'
module QcloudVod
  class << self
    def configure
      @configuration ||= Configuration.new
      yield @configuration
      @configuration
    end

    def config
      @configuration
    end
  end
end