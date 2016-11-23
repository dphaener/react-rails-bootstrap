class FacebookProfilePictureData
  include Virtus.model

  attribute :is_silhouette, Boolean
  attribute :url, String
end
