class User < ActiveRecord::Base
  scope :on_name_and_ages, -> (tuples) {
    with(target_users: Shapeshifter.metamorphose(schema: %w{name age}, tuples: tuples)).
    joins("JOIN target_users ON users.name = target_users.name AND age = date_part('year', age(birthday))::integer")
  }
end
