module ActiveRecord
  module Attr
    module Stripper
      class AttrStripper
        class << self
          alias :strip! :new
        end

        def before_validation(record)
          strip_targets = record.class.class_variable_get :@@strip_targets

          return if strip_targets.blank?

          strip_targets.each do |target|
            target.attrs.each do |attr|
              attr_value = record.send(attr)

              if attr_value.kind_of?(String)
                stripped_value = strip(attr_value, target.opts)

                record.send("#{attr.to_s}=", stripped_value)
              end
            end
          end
        end

        private

        def strip(attr_value, opts)
          stripped_value =
            if opts[:zenkaku]
              attr_value.gsub(/\A(\s|　)+|(\s|　)+\z/, '')
            else
              attr_value.strip
            end

          if opts[:blank_to_nil]
            stripped_value.presence
          else
            stripped_value
          end
        end
      end
    end
  end
end
