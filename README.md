# Partitioned Arrays

**WIP.** - ***Last updated: 3/31/2022**

A partitioned array data structure which works with JSON for disk storage, and a pure JSON parser is in progress. With two constants, the algorithm creates a data structure and allocates empty associative array elements and understands the structure of the partitions.

The main purpose was I needed a way to divide an array into subelements, so that in gamedev I can flip on and off portions of the array in question to save on memory.

The data structure overall is an `Array-Of-Hashes`.

## Usage
### Assumed Constants
```ruby
# DB_SIZE > PARTITION_AMOUNT
PARTITION_AMOUNT = 5 # Number of subelements per partition. CAVEAT: the first partition quantity is always PARTITION_AMOUNT + 1
DB_SIZE = 3 # The DB_SIZE is the total # of partitions within the array; starts at 0
OFFSET = 1 # This came with the math
PURE_RUBY = false # WIP
DB_NAME = 'partitioned_array_slice'
DEFAULT_PATH = './CGMFS'
DEBUGGING = false
```

### Examples 

`main_refined.rb, visuals.rb`

Visualization of the partitions within `@data_arr`

`visuals.rb`
```ruby
# Visuals; Show the basic data structure, by filling with entries, where each id is a part of that respective array partition
def allocate_ranges_sequentially(partitioned_array)
  range_arr = partitioned_array.range_arr
  range_arr.each_with_index do |range, range_index|
    range.to_a.each_with_index do |range_element, range_element_index|
      partitioned_array.set_partition_subelement(range_element_index, range_index) do |partition_subelement|
        partition_subelement["id"] = range_index
      end
    end
  end
  partitioned_array.data_arr
end
```

`main_refined.rb`
```ruby
require_relative 'partitioned_array'
require_relative 'visuals'

# Create a new data structure and allocate the partition to memory
partitioned_array = PartitionedArray.new
partitioned_array.allocate

#Returns the partition elements within the first partition within @data_arr; returns a hash of relevant data if argument is true (optional)
# Examples
id = 0
p "First Partition in @data_arr: #{partitioned_array.get_partition(id, hash: false)}" # get a partition (a chunk) of a partition element withinn @data_arr
p "First Element in @data_arr: #{partitoned_array.get(id)}" # gets an entry from @data_arr directly
puts


# Set an element within @data_arr; ignores partitions and goes for raw ids

partitioned_array.set(id) do |hash|
   hash["first"] = "1st"   
end

partitioned_array.set(id + 1) do |hash|
    hash["second"] = "2nd"
end

# add a partition to the @range_arr; @data_arr, add partition_amount_and\offset to @rel_arr, @db_size increases by one
partitioned_array.add_partition 
partitioned_array.add_partition

allocate_ranges_sequentially(partitioned_array)

partitioned_array.add_partition

last_element = -1
partitioned_array.set(last_element) do |hash|
    hash["last"] = "Nth"
end


# All that has to be done to store the PartitionedArray instance data
=begin
PartitionedArray#load_from_json!()
PartitionedArray#dump_to_json!
PartitionedArray#save_partition_to_file!
PartitionedArray#load_partition_from_file!
=end


# Test to see if file loading and unloading creates equivalent data structures
puts "Before:"

p partitioned_array.data_arr
p partitioned_array.partition_amount_and_offset
p partitioned_array.range_arr
p partitioned_array.rel_arr

_data_arr = partitoned_array.data_arr
_partition_amount_and_offset = partitioned_array.partition_amount_and_offset
_range_arr = partitioned_array.range_arr
_rel_arr = y.rel_arr

partitioned_array.dump_to_json!
partitioned_array.load_from_json!

# assert tests
p "@data_arr remains the same: #{partitioned_array.data_arr == _data_arr}"
p "@partition_amount_and_offset: #{partitioned_array.partition_amount_and_offset == _partition_amount_and_offset}"
p "@range_arr: #{partitioned_array.range_arr == _range_arr}"
p "@rel_arr: #{partitioned_array.rel_arr == _rel_arr}"

p "Get a certain slice of @data_arr (0..4): #{partitiond_array.data_arr[0..4]}"
p "Load partition data into @data_arr (0th): #{partitioned_array.load_partition_from_file!(0)}"



partitioned_array.save_partition_to_file!(0)

# PartitionedArray#set_partition_subelement(id, partition_id, &block)
success = partitioned_array.set_partition_subelement(0, 0) do |hash|
    hash[:modified] = "0, 0"
end
p "successfully modified partition subelement: #{success}"
p "New @data_arr: #{@data_arr}"





```
Output
```ruby
"First Partition in @data_arr: [{}, {}, {}, {}, {}, {}, {}]"
"First Element in @data_arr: {}"

Before:
[{"first"=>"1st", "id"=>0}, {"second"=>"2nd", "id"=>0}, {"id"=>0}, {"id"=>0}, {"id"=>0}, {"id"=>0}, {"id"=>0}, {"id"=>1}, {"id"=>1}, {"id"=>1}, {"id"=>1}, {"id"=>1}, {"id"=>1}, {"id"=>2}, {"id"=>2}, {"id"=>2}, {"id"=>2}, {"id"=>2}, {"id"=>2}, {"id"=>3}, {"id"=>3}, {"id"=>3}, {"id"=>3}, {"id"=>3}, {"id"=>3}, {"id"=>4}, {"id"=>4}, {"id"=>4}, {"id"=>4}, {"id"=>4}, {"id"=>4}, {}, {}, {}, {}, {}, {"last"=>"Nth"}]
6
[0..6, 7..12, 13..18, 19..24, 25..30, 31..36]
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 18, 19, 20, 21, 22, 23, 24, 24, 25, 26, 27, 28, 29, 30, 30, 31, 32, 33, 34, 35, 36]
"@data_arr remains the same: true"
"@partition_amount_and_offset: true"
"@range_arr: true"
"@rel_arr: true"
"Get a certain slice of @data_arr (0..4): [{\"first\"=>\"1st\", \"id\"=>0}, {\"second\"=>\"2nd\", \"id\"=>0}, {\"id\"=>0}, {\"id\"=>0}, {\"id\"=>0}]"
"Load partition data into @data_arr (0th): [{\"first\"=>\"1st\", \"id\"=>0}, {\"second\"=>\"2nd\", \"id\"=>0}, {\"id\"=>0}, {\"id\"=>0}, {\"id\"=>0}, {\"id\"=>0}, {\"id\"=>0}]"
"successfully modified partition subelement: true"
"New @data_arr: [{\"first\"=>\"1st\", \"id\"=>0, :modified=>\"0, 0\"}, {\"second\"=>\"2nd\", \"id\"=>0}, {\"id\"=>0}, {\"id\"=>0}, {\"id\"=>0}, {\"id\"=>0}, {\"id\"=>0}, {\"id\"=>1}, {\"id\"=>1}, {\"id\"=>1}, {\"id\"=>1}, {\"id\"=>1}, {\"id\"=>1}, {\"id\"=>2}, {\"id\"=>2}, {\"id\"=>2}, {\"id\"=>2}, {\"id\"=>2}, {\"id\"=>2}, {\"id\"=>3}, {\"id\"=>3}, {\"id\"=>3}, {\"id\"=>3}, {\"id\"=>3}, {\"id\"=>3}, {\"id\"=>4}, {\"id\"=>4}, {\"id\"=>4}, {\"id\"=>4}, {\"id\"=>4}, {\"id\"=>4}, {}, {}, {}, {}, {}, {\"last\"=>\"Nth\"}]"
```