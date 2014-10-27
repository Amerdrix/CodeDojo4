module DojoRest
  class User

    attr_reader :name, :gender, :location, :email, :username, :password,
                :salt, :md5, :sha1, :sha256, :registered, :dob, :phone, :cell, :SSN, :picture

    def initialize(dto)
      self.name = dto.name
      self.gender = dto.gender
      self.location = dto.location
      self.email = dto.email
      self.username = dto.username
      self.password = dto.password

      self.salt = dto.salt
      self.md5 = dto.md5
      self.sha1 = dto.sha1
      self.sha256 = dto.sha256
      self.registered = dto.registered
      self.dob = dto.dob
      self.phone = dto.phone
      self.cell = dto.cell
      self.SSN = dto.SSN
      self.picture  = dto.picture
    end
  end
end
