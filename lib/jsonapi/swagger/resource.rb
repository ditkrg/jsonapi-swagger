require 'forwardable'
module Jsonapi
  module Swagger
    class Resource
      def self.with(model_class_name)
        @resource_class = model_class_name.safe_constantize
        unless @resource_class < JSONAPI::Serializable::Resource
          raise Jsonapi::Swagger::Error, "#{@resource_class.class} is not Subclass of JSONAPI::Serializable::Resource!"
        end
        require 'jsonapi/swagger/resources/serializable_resource'
        return Jsonapi::Swagger::SerializableResource.new(@resource_class)
      end
    end
  end
end
