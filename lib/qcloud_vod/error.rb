module QcloudVod
  class Error < StandardError; end

  class RequestError < Error
    attr_reader :code
    attr_reader :message
    attr_reader :origin_response

    def initialize(response)
      p response
      if response.parsed_response.key?('Code')
        @code = response.parsed_response['Code']
        @message = response.parsed_response['Message']
      end
      @origin_response = response
      super("API ERROR Code=#{@code}, Message=#{@message}")
    end
  end
end