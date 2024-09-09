class BaseSerializer
  include JSONAPI::Serializer

  def get_serializable_attrs
    if self.instance_values["resource"].is_a? ActiveRecord::Relation
      self.serializable_hash[:data].map { |datum| datum[:attributes] }
    else
      self.serializable_hash[:data][:attributes]
    end
  end
end
