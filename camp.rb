require 'camping'
require 'oai'

Camping.goes :DublinCore

module DublinCore
  module Models
    class MyModel < OAI::Provider::Model
      def earliest
        return '2023-02-13T16:17:44Z'
      end

      def latest
        return '2023-02-13T16:17:44Z'
      end

      # def sets
      #   nil
      # end

      def find(selector, options={})
        records = []
      end
    end

    class CampingProvider < OAI::Provider::Base
      source_model MyModel.new
    end
  end

  module Controllers
    class Index
      def get
        redirect '/oai'
      end
    end

    class Oai
      def get
        @headers['Content-Type'] = 'text/xml'
        provider = Models::CampingProvider.new
        puts @input.merge({ :url => URL(Oai).to_s })
        provider.process_request(
          @input
        ).gsub(
          '<?xml version="1.0" encoding="UTF-8"?>',
          "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<?xml-stylesheet type=\"text/xsl\" href=\"oai2.xsl\" ?>"
        )
      end
    end

    class Style < R '/oai2\.xsl'
      STYLE = File.read('assets/oai2.xsl')

      def get
        STYLE
      end
    end
  end

  module Helpers
  end

  module Views

    # def layout
    #   html do
    #     head do
    #       title 'DublinCore'
    #       link :rel => 'stylesheet', :type => 'text/css',
    #       :href => '/styles.css', :media => 'screen'
    #     end
    #     body do
    #       h1 'DublinCore'

    #       div.wrapper! do
    #         self << yield
    #       end
    #     end
    #   end
    # end

  end

end

