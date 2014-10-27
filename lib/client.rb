require_relative 'errors/not_found'
require 'net/http'

module DojoRest
  class Client

    def initialize(url)
      self.url = url
    end

    def get_user
      uri = URI(url)
      result = Net::HTTP.get_response(uri)

      raise NotFoundException.new if result.code == '404'

      return User.new
    end

    private

    attr_accessor :url
  end
end
