class User < ActiveRecord::Base
	attr_accessible :name, :email

	validates :name, presence: true, length: { maximum: 40 }  # it means that the name should be entered and the length of the name
	#should not be more than 40 charachters ,where presence has  a hasher it  which is what aft and length also takes a hash 
	EMAIL_CORRECT_FORMAT = /\A[\w+\-.]+@[\w+\-.]+\.[a-z]+\z/ #starting from \A is te beginning of the string the contains the correct format of an email
	


    before_save { |user| user.email = user.email.downcase}
	validates :email, presence: true, format: { with: EMAIL_CORRECT_FORMAT }, uniqueness: { case_sensitive: false } #uniqueness is true
	#but with no case sensitivity?????????????????????????????????????????

	validates :password, presence: true, length: { maximum: 8 }

	validates :password_confirmation, presence: true

end
