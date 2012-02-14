module BadaBing
  module Service
    class Web
      BASE_URI = "http://api.bing.net/json.aspx"
      attr_accessor :query
      attr_reader   :max_offset, :results
      def initialize(query)
        @query          ||= URI.encode(query)
        @current_offset   = 0
        @max_offset       = 950
        @results          = []
        @hydra            = Typhoeus::Hydra.new
        request
      end
            
      def request
        request_max_offset
        if @max_offset > 0        
          while (@max_offset >= @current_offset)
            request = Typhoeus::Request.new(request_uri(@current_offset))
          
            request.on_complete do |response|
              process_response(response)
            end
          
            @hydra.queue(request)
          
            @current_offset += 50
          end
        
          @hydra.run          
        end
      end

      def request_max_offset
        request = Typhoeus::Request.new(request_uri(950))
        @hydra.queue(request)
        
        request.on_complete do |response|
          body    = parse_json(response.body)
          @max_offset = parse_offset(body)
        end
        
        @hydra.run
      end
      
      def process_response(response)
        if response.success?
          body    = parse_json(response.body)
                   
          parse_results(body).each do |result|
            options = {}
            options[:title] = result.fetch("Title")
            options[:url]   = result.fetch("Url")
            @results << BadaBing::Service::Result.new(options)
          end  
        else
          puts "Failure!"
        end
      end
      
      def parse_offset(body)
        body["SearchResponse"]["Web"]["Offset"]
      end
      
      def parse_results(body)
        body["SearchResponse"]["Web"]["Results"]
      end
      
      def parse_json(body)
        Yajl::Parser.parse(body)
      end
      
      def request_uri(offset)
        "#{BASE_URI}?AppId=#{BadaBing.application_id}&Sources=Web&Web.Count=50&Web.Offset=#{offset}&Query=#{@query}"
      end
      
    end
  end
end