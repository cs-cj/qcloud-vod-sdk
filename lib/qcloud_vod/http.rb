require 'httparty'
require 'httmultiparty'
module QcloudVod
  class Http
    include HTTParty
    include HTTMultiParty

    attr_reader :config

    def initialize(config)
      @config = config
    end

    def get(url, options = {})
      request('GET', url, options)
    end

    def post(url, options = {})
      request('POST', url, options)
    end

    private

    def request(verb, url, options = {})
      query = options.fetch(:query, {})
      headers = options.fetch(:headers, {})
      body = options.delete(:body)

      append_headers!(headers, verb, body, options)
      options = { headers: headers, query: query, body: body }
      append_options!(options, url)

      wrap(self.class.__send__(verb.downcase, url, options))
    end

  end
end