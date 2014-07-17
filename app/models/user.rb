class User < ActiveRecord::Base
	#attr_accessible
	validates :name, presence: true, length: { maximum: 40 }  # it means that the name should be entered and the length of the name
	#should not be more than 40 charachters ,where presence has  a hasher it  which is what aft and length also takes a hash 
   EMAIL_CORRECT_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #starting from \A is te beginning of the string the contains the correct format of an email
	has_secure_password #it create sthe library has_secure_password w we add it in the gem file and creates password and password_confirmation


    before_save { |user| user.email = user.email.downcase}
     before_validation do |user| 
       user.name = "random" if user.name.blank? 
  	  end


	validates :email, presence: true, format: { with: EMAIL_CORRECT_FORMAT }, uniqueness: { case_sensitive: false } #uniqueness is false (Menna@hotmail.com is the same as menna@hotmail.com)

	validates :password, presence: true, length: { minimum: 8 }

	validates :password_confirmation, presence: true

	def self.name_longer_than_eight
		User.where("length(name) > 8")
	end

end
