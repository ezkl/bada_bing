module BadaBing
  module Service
    class Result
      attr_accessor :title, :url
      def initialize(options)
        @title  = options.fetch(:title)
        @url    = options.fetch(:url)
      end
    end
  end
end