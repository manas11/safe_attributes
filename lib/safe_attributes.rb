module SafeAttributes
    extend ActiveSupport::Concern

    module ClassMethods
        # 
        # Within your model call this method once with a list of 
        # methods matching either attribute() or attribute=() for 
        # attributes (column names) you do not want to create the
        # the normal method for.  You should not need to do this
        # but the option is there in case the default list is 
        # inadequate
        #
        def bad_attribute_names(*attrs)
            @bad_attribute_names ||= lambda {
                methods = Array.new(attrs.collect { |x| x.to_s })
                methods += ActiveRecord::Base.public_instance_methods
                methods += ActiveRecord::Base.protected_instance_methods
                methods += ActiveRecord::Base.private_instance_methods
                methods -= ['id']
                return methods
            }.call
        end

        # 
        # Override the default implementation to not create the
        # attribute() method if that method name is in the list of
        # bad names
        #
        def define_method_attribute(attr_name)
            return if (bad_attribute_names.include?(attr_name))
            super(attr_name)
        end

        #
        # Override the default implementation to not create the
        # attribute= method if that method name is in the list of
        # bad names
        #
        def define_method_attribute=(attr_name)
            method = attr_name + '='
            return if (bad_attribute_names.include?(method))
            super(attr_name)
        end
    end
end

require 'safe_attributes/railtie.rb' if defined?(Rails)
