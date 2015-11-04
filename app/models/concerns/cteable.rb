module Cteable
  extend ActiveSupport::Concern

  included do
    scope :with_tuples, -> (tuples) {
      raise "Tuple must have values." if tuples.empty? || tuples.nil?
      
      with(
        table_name => <<-SQL.chomp
SELECT * FROM (VALUES #{to_values(tuples)}) AS #{table_name}(#{columns.map(&:name).join(", ")})
        SQL
      )
    }
   
    class << self
      def to_values(tuples)
        tuples.
          map { |tuple| tuple.map { |v| v.is_a?(Numeric) ? v.to_s : "'#{v}'"}. join(", ") }.
          map { |values| "(#{values})"}.
          join(", ")
      end
    end
  end
end
