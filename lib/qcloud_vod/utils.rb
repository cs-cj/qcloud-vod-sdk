module QcloudVod
  class Utils
    class << self
      # 对 path 进行 url_encode
      def url_encode(path)
        ERB::Util.url_encode(path).gsub('%2F', '/')
      end

      # 计算 content 的大小
      def content_size(content)
        if content.respond_to?(:size)
          content.size
        elsif content.is_a?(IO)
          content.stat.size
        end
      end

    end
  end
end