class FacebookProfile
  include Serializable
  include Virtus.model

  attribute :id, String
  attribute :email, String
  attribute :first_name, String
  attribute :last_name, String
  attribute :gender, String
  attribute :link, String
  attribute :locale, String
  attribute :timezone, Integer
  attribute :verified, Boolean
  attribute :picture, FacebookProfilePicture
end
