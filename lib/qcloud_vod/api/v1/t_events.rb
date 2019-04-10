module QcloudVod
  module Api
    module V1
      module TEvents

        def pull_events
          r_method = "GET"
          r_host = "vod.tencentcloudapi.com/"

          options = { Action: 'PullEvents' }
          options.merge!({ SignatureMethod: 'HmacSHA1'})
          options.merge!({ Region: ''})
          sign = authorization.get_value(r_method,r_host,options,Time.now.to_i+86400)

          options.merge!({ Signature: sign})

          res = http.get("https://vod.tencentcloudapi.com/?#{options.to_query}")
          ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(res.body))

        end
      end
    end
  end
end