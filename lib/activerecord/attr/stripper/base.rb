require 'activerecord/attr/stripper/version'
require 'activerecord/attr/stripper/attr_stripper'

module ActiveRecord
  module Attr
    module Stripper
      extend ActiveSupport::Concern

      self.included do
        cattr_accessor :strip_targets

        before_validation ActiveRecord::Attr::Stripper::AttrStripper.strip!
      end

      module ClassMethods
        def strip_attrs(*attrs)
          return if attrs.blank?

          self.strip_targets ||= []
          self.strip_targets << Target.new(*attrs)
        end
      end
    end
  end
end
