module ActiveRecord
  module TypeCaster
    class Map # :nodoc:
      def initialize(types)
        @types = types
      end

      def type_cast_for_database(attr_name, value)
        return value if value.is_a?(Arel::Nodes::BindParam)
        type = types.type_for_attribute(attr_name.to_s)
        type.serialize(value)
      end

      def type_cast_where_array?(attr_name)
        types.type_for_attribute(attr_name.to_s).type_cast_where_array?
      end

      protected

      attr_reader :types
    end
  end
end
