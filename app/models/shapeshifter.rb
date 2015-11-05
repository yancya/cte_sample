class Shapeshifter < ActiveRecord::Base
  scope :metamorphose, -> (schema:, tuples:) {
    with(table_name => sanitize_sql_array(<<-SQL.chomp, tuples.flatten))
SELECT * FROM (VALUES #{to_values(tuples)}) AS #{table_name}(id, #{schema.join(', ')})
    SQL
  }

  def self.to_values(tuples)
    tuples.
      map.
      with_index(1) { |tuple, i| "(#{i}, #{tuple.map { '?' }.join(', ')})" }.
      join(", ")
  end

  def self.sanitize_sql_array(sql, values)
    ActiveRecord::Base.send(:sanitize_sql_array, [sql, *values])
  end
end
