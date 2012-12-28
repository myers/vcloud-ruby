module VCloud
  # Defines a hyper-link with a relationship, hyper-link reference, and an optional MIME type
  class ResourceEntity
    include HappyMapper
    
    tag 'ResourceEntity'
    attribute :type, 'String'
    attribute :name, 'String'
    attribute :href, 'String'

    # A new instance of ResourceEntity
    #
    # @param args [Hash{String => String}] Named arguments, 'rel', 'type', 'name' and 'href'
    def initialize(args = {})
      @type = args[:type]
      @name = args[:name]
      @href = args[:href]
    end

    # Parses XML to produce a VCloud::ResourceEntity
    #
    # @param [String] xml XML to parse
    # @return [VCloud::ResourceEntity] ResourceEntity object parsed from the XML
    def self.from_xml(xml)
      parse(xml)
    end
  end
end