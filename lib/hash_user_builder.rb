require 'recursive-open-struct'

module DojoRest
  class HashUserBuilder

    def create_user_from_hash(hash)
      dto = RecursiveOpenStruct.new(hash)
      User.new(dto)
    end
  end
end
