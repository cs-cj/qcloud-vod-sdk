require 'qcloud_vod/version'
require 'qcloud_vod/configuration'
require 'qcloud_vod/sign'
require 'qcloud_vod/http'
require 'qcloud_vod/api/v1/task'
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

    private

    def authorization
      Sign.new(config)
    end

    def http
      Http.new(config)
    end

  end
end