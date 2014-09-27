# coding: utf-8
module ActiveRecord
  module Attr
    module Stripper
      class Target
        attr_reader :attrs, :opts

        def initialize(*attrs)
          if attrs.last.kind_of?(Hash)
            @attrs = attrs[0...-1]
            @opts  = attrs.last
          else
            @attrs = attrs
            @opts  = {}
          end
        end
      end
    end
  end
end
