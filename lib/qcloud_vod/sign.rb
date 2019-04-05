require 'base64'
require 'openssl'
require 'digest'

module QcloudVod
  class Sign
    attr_reader :config

    # 用于对请求进行签名
    # @param config [Configration] specify configuration for sign
    #
    def initialize(config)
      @config = config
    end

    def get_value(expireTime=current_time+86400)
      sign_base(expireTime)
    end

    private
    def sign_base(expireTime)
      src_str = "secretId=#{secret_id}&currentTimeStamp=#{current_time}&expireTime=#{expireTime}&random=#{rdm}"

      Base64.encode64("#{OpenSSL::HMAC.digest('sha1', secret_key, src_str)}#{src_str}").delete("\n").strip
    end

    def secret_id
      config.secret_id
    end

    def secret_key
      config.secret_key
    end

    def current_time
      # Time.now.to_i
      1554463825
    end

    def rdm
      rand(10**9)
    end

  end
end