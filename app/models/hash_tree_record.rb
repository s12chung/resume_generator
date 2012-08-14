#abstract class to handle reading a yaml file abstractly and recursively
class HashTreeRecord < ActiveRecord::Base
  @abstract_class = true

  def self.create_from_hash_tree(hash_value)
    #attributes of table value
    attributes = {}
    if hash_value.class == Hash
      hash_value.each_pair do |key, value|
        if @formatted_hash_keys && @formatted_hash_keys.include?(key)
          #handle exceptions, see app/models/resume.rb for an example
          attributes[key] = format_hash_exceptions key, value
        elsif value.class == String
          attributes[key] = value
        elsif value.class == Hash
          #load the correct class and load that class' create_from_hash_tree method
          attributes[key] = key.camelize.constantize.create_from_hash_tree(value)
        elsif value.class == Array
          #create an array and create the database rows associated with this instance
          value_array = []
          value.each {|value_item| value_array << key.classify.constantize.create_from_hash_tree(value_item)}
          #store them as an attribute and rails will handle the associations
          attributes[key] = value_array
        end
      end
      #create the database row associated with this object type with the attributes
      return create attributes
    elsif hash_value.class == String
      #a string is passed, just create with the text attribute
      return create :text => hash_value
    end
  end
end