module Serializable
  extend ActiveSupport::Concern

  included do
    def self.dump(hash)
      hash
    end

    def self.load(hash)
      new(hash)
    end
  end
end
