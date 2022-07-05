# rubocop:disable Style/GuardClause
# rubocop:disable Style/ParenthesesAroundCondition
# rubocop:disable Style/ConditionalAssignment
# rubocop:disable Style/StringLiterals
# rubocop:disable Metrics/ClassLength
# rubocop:disable Style/UnlessElse
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Style/IfUnlessModifier
# rubocop:disable Layout/LineLength
# frozen_string_literal: true



# VERSION v1.0.0a
# All necessary instance methods have been implemented, ready for real world testing...

# Ranged binary search, for use in CGMFS
# array_id = relative_id - db_size * (PARTITION_AMOUNT + 1)

# When checking and adding, see if the index searched for in question

# when starting out with the database project itself, check to see if the requested id is a member of something like rel_arr

# 1) allocate range_arr and get the DB running
# 2) allocate rel_arr based on range_arr
# 3) allocate the actual array (@data_arr)
# VERSION: v1.0.2 - set_partition_subelement
# VERSION: v1.0.1a - all essential functions implemented
# 5/9/20 - 5:54PM
# TODO:
# def save_partition_element_to_file!(partition_id, element_id, db_folder: @db_folder)

# VERSION: v1.1.0 (2022/03/30 - 3:46PM)
# Implemented all the necessary features for the PA to work, except for an add_from_lefr or add_from_right, which will
# attempt to fill in the gaps in the database.
# TODO: implement pure json parsing

# * Notes: Have to manually convert all the string data to their proper data structure
#  * HURDLE: converting strings to their proper data structures is non-trivial; could check stackoverflow for a solution
# VERSION v2.0 (4/22/2022) - added PartitionedArray#add(&block) function, to make additions to the array fast (fundamental method)
# VERSION v0.6 (2022/03/30) - finished functions necessary for the partitioned array to be useful
# VERSION: v0.5 (2022/03/14)
# Implemented
# PartitionedArray#get_part(partition_id) # => returns the partition specified by partition_id or nil if it doesn't exist
# PartitionedArray#add_part(void) # => adds a partition to the array, bookkeeping is done in the process
# VERSION: v0.4 (11:55PM)
# Fixed bugs, fixed array_id; allocate and get are fully implemented and working correctly for sure
# VERSION: v0.3 (3:46PM)
# allocate and get(id) are seemingly fully implemented and working correctly
# * start work on "allocate_file!"
# VERSION: v0.2 (02.28/2022 3:10PM)
# Currently working on get(id).
# VERSION: v0.1 (12/9/2021 12:31AM)
# Implementing allocate
# SYNOPSIS: An array system that is partitioned at a lower level, but functions as an almost-normal array at the high level
# DESCRIPTION:
# This is a system that is designed to be used as a database, but also as a normal array.
# NOTES:
# When loading a JSON database file (*_db.json), the related @ arr variables need to be set to what is within the JSON file database.
# This means the need to parse a file, and @allocated is set to true in the end.

require 'fileutils'


class PartitionedArray # for pure JSON and pure json storage

end




# rubocop:enable Layout/LineLength
# rubocop:enable Style/IfUnlessModifier
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Style/UnlessElse
# rubocop:enable Metrics/ClassLength
# rubocop:enable Style/StringLiterals
# rubocop:enable Style/ConditionalAssignment
# rubocop:enable Style/ParenthesesAroundCondition
# rubocop:enable Style/GuardClause
