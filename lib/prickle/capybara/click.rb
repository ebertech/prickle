module Prickle
  module Actions
    module Click

      def click_by_name name
        find_by_name(name).click
      end

      def click
        find_element_by_identifier(@type, @identifier).click
      end

      private
      def method_missing method, *args
        if method =~ /^click_(.*)_by_name$/
          element = Prickle::TAGS[$1.to_sym] || $1
          find_by_name(element, args.first).click
        else
          super
        end
      end

    end
  end
end
