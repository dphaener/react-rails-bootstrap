module RelayGlobalID
  class Serializer
    def self.call(object, type, _ctx)
      JWT.encode({
        id: object.id,
        type: type.name
      }, ENV["JWT_KEY"], "HS256")
    end
  end

  class DeSerializer
    def self.call(id, _ctx)
      obj = JWT.decode(
        id,
        ENV["JWT_KEY"],
        true,
        algorithm: "HS256"
      ).first

      obj["type"].constantize.find(obj["id"])
    end
  end

  class Resolver
    def self.call(object, _ctx)
      if object.class.name.include?("Presenter")
        RelaySchema.types[object.record.class.name]
      else
        RelaySchema.types[object.class.name]
      end
    end
  end
end
