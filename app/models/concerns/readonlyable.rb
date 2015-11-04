module Readonlyable
  extend ActiveSupport::Concern

  def readonly?
    return true
  end

  module ClassMethods
    %i{create update}.each do |name|
      define_method name, -> (*args) do
        raise ActiveRecord::ReadOnlyRecord
      end
    end
  end
end
