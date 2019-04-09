module QcloudVod
  module Api
    module V1
      module TTask

        def describe_tasks
          r_method = "GET"
          r_host = "vod.tencentcloudapi.com/"

          options = { Action: 'DescribeTasks' }
          options.merge!({ Status: 'FINISH' })
          options.merge!({ SignatureMethod: 'HmacSHA1'})
          options.merge!({ Region: ''})
          sign = authorization.get_value(r_method,r_host,options,Time.now.to_i+86400)

          options.merge!({ Signature: sign})

          res = http.get("https://vod.tencentcloudapi.com/?#{options.to_query}")
          p res.methods
          p res.response
          p res.body
          ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(res.body))

        end
      end
    end
  end
end