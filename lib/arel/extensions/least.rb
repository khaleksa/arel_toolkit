# rubocop:disable Naming/MethodName
# rubocop:disable Naming/UncommunicativeMethodParamName

module Arel
  module Nodes
    # https://www.postgresql.org/docs/10/functions-conditional.html
    class Least < Arel::Nodes::Unary; end
  end

  module Visitors
    class ToSql
      def visit_Arel_Nodes_Least(o, collector)
        collector << 'LEAST('
        collector = inject_join(o.expr, collector, ', ')
        collector << ')'
      end
    end
  end
end

# rubocop:enable Naming/MethodName
# rubocop:enable Naming/UncommunicativeMethodParamName
