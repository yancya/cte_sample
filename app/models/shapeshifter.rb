class Shapeshifter < ActiveRecord::Base
  def self.metamorphose(schema:, tuples:)
    with(table_name => sanitize_sql_array(<<-SQL.chomp, tuples.flatten))
SELECT * FROM #{to_values(tuples)} AS t(#{primary_key}, #{schema.join(', ')})
    SQL
  end

  def self.to_values(tuples)
    tuples.
      map.with_index(1) { |tuple, i| "(#{i}, #{tuple.map { '?' }.join(', ')})" }.
      join(", ").
      tap { |values| break "(VALUES #{values})" }
  end

  def self.sanitize_sql_array(sql, values)
    ActiveRecord::Base.send(:sanitize_sql_array, [sql, *values])
  end
end
