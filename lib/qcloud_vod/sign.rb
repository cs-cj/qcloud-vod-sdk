require 'base64'
require 'openssl'
require 'digest'
require 'active_support/all'

module QcloudVod
  class Sign
    attr_reader :config

    # 用于对请求进行签名
    # @param config [Configration] specify configuration for sign
    #
    def initialize(config)
      @config = config
    end

    def get_value(r_method,r_host,params,expireTime=current_time+86400)
      sign_base(r_method,r_host,params,expireTime)
    end

    private
    def sign_base(r_method,r_host,params,expireTime)
      params.merge!({ SecretId: secret_id })
      params.merge!({ Timestamp: current_time })
      params.merge!({ Nonce: rdm })
      params.merge!({ Version: '2018-07-17' })
      src_str = "#{r_method}#{r_host}?#{params.to_query}"
      Base64.encode64("#{OpenSSL::HMAC.digest('sha1', secret_key, src_str)}").delete("\n").strip
    end

    def secret_id
      config.secret_id
    end

    def secret_key
      config.secret_key
    end

    def current_time
      Time.now.to_i
    end

    def rdm
      rand(10**9)
    end

  end
end