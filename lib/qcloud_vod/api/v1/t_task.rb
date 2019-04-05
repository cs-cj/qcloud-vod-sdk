module QcloudVod
  module Api
    module V1
      module TTask

        def describe_tasks
          sign = authorization.get_value
          options = { Action: 'DescribeTasks' }
          # options.merge!({ SecretId: config.secret_id })
          # options.merge!({ Signature: sign })
          # options.merge!({ Timestamp: Time.now.to_i })
          options.merge!({ Status: 'FINISH' })

          headers = {
              'Authorization' => sign,
              'Content-Type' => 'application/json'
          }
          p sign
          result = http.post("https://vod.tencentcloudapi.com",body: options.to_json, headers: headers)

        end
      end
    end
  end
end