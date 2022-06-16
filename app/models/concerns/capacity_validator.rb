class CapacityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.assignments.size < value.capacity
      record.errors.add attribute, (options[:message] || "team is full")
    end
  end
end
