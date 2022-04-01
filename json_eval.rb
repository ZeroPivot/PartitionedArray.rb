# frozen_string_literal: true

# rubocop:disable Style/StringLiterals
# rubocop:disable Lint/RedundantCopDisableDirective
# rubocop:disable Layout/TrailingEmptyLines
# rubocop:disable Lint/RedundantCopDisableDirective
# rubocop:disable Layout/EmptyLines



# Converts some string to JSON format, mostly for usage in the DragonRuby toolkit
# Note: ruby hashes function similarly to json. With a few changes in parse_string(hash), a ruby hash is now a JSON string


# Parse a ruby hash.to_s and convert appropriate characters to fit with JSON
# parse_string({ "lol" => 2, "rofl" => "hehe", "hehe" => nil }) #=> in this format (hashrockets => and "double quotes")



# 1) eval string to ruby data structure
# 2) convert to json using parse_string
class JSONeval
  
  def self.range_arr2ruby(json_string)
    p eval(json_string)
    eval(json_string)
  end

  def self.data_arr2ruby(json_string)
    eval(json_string)
  
  end
  def self.partition_amount_and_offset2ruby(json_string);end
  def self.rel_arr2ruby(json_string);end


  def self.ruby2json(ruby_ds)
    u_string = ruby_ds.to_s
    u_string.gsub! "=>", ":" # replace ruby's hashrocket with JSON's :
    #u_string.gsub! '"', '\"' 
    # TODO: FIX The idea that the nil as a hash key could be replaced by not having quotations, which wouldn't work
    # caveat with self.ruby2json: if the "nil" is a hash key, it will be replaced by a nil object
    u_string.gsub! "nil", "\"null\"" # replace Ruby's nil with null
  end  

  def self.json2ruby(json_string)
    u_string = json_string
    u_string.gsub! ":", "=>" # replace ruby's hashrocket with JSON's :
    u_string.gsub! '\"', '"'
    u_string.gsub! "null", "nil" # replace json's null with nil\
    u_string = eval(u_string)
    #puts "eval'd string: #{u_string}"
    
=begin    puts "u_string: #{u_string}"
    u_string.each_with_index do |(key, value), index|
      puts "value"
      case value      
      when Array 
      value.each_with_index do |(key, value), index| # |(key, value), index| if each_with_index        
          u_string[key] = eval(u_string[key])      
      end       
      end
    end unless u_string.is_a?(Integer)
  end
=end
end
end



=begin
database = AOH.new
100.times do
  # For json_test to work with to_json, always use double quotes for keys and hashrockets for pointing to
  # data
  database.add({ "nil" => nil, "number" => 2.0, "number2" => "5" })
end

puts database.collection.to_s


json = parse_string(database.collection)
puts json.to_json
File.open("test.txt", "w") do |file_object|
  file_object.puts json
end
=end

# parse_string(database.collection_get)
# rubocop:enable Layout/EmptyLines
# rubocop:enable Lint/RedundantCopDisableDirective
# rubocop:enable Layout/TrailingEmptyLines
# rubocop:enable Lint/RedundantCopDisableDirective
# rubocop:enable Style/StringLiterals
