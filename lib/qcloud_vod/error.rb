module QcloudVod
  class Error < StandardError; end

  class RequestError < Error
    attr_reader :code
    attr_reader :message
    attr_reader :origin_response

    def initialize(response)
      if response.parsed_response.key?('code')
        @code = response.parsed_response['code']
        @message = response.parsed_response['message']
      end
      @origin_response = response
      super("API ERROR Code=#{@code}, Message=#{@message}")
    end
  end
end