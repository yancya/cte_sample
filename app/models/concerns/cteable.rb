module Cteable
  extend ActiveSupport::Concern

  included do
    include Readonlyable
    
    scope :with_tuples, -> (tuples) {
      raise "Tuple must have values." if tuples.empty? || tuples.nil?
      
      with(
        table_name => ActiveRecord::Base.send(:sanitize_sql_array, [<<-SQL.chomp, *tuples.flatten])
SELECT * FROM (VALUES #{to_values(tuples)}) AS #{table_name}(#{columns.map(&:name).join(", ")})
        SQL
      )
    }
   
    class << self
      def to_values(tuples)
        tuples.map { |values| "(#{values.map { '?' }.join(', ')})"}.join(', ')
      end
    end
  end
end
