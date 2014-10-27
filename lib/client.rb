require_relative 'errors/not_found'
require_relative 'hash_user_builder'
require 'net/http'
require 'json'

module DojoRest
  class Client

    def initialize(url)
      self.url = url
    end

    def get_user
      uri = URI(url)
      result = Net::HTTP.get_response(uri)

      raise NotFoundException.new if result.code == '404'

      builder = HashUserBuilder.new
      builder.create_user_from_hash(JSON.load(result.body)["results"][0])
    end

    def get_users(count)
      count.times.map { get_user }
    end

    private

    attr_accessor :url
  end
end
