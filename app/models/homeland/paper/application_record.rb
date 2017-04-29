module Homeland
  module Paper
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
