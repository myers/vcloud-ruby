module VCloud
  # Represents a list of organizations
  class QueryList < BaseVCloudEntity
    include ParsesXml
    has_type VCloud::Constants::ContentType::QUERY_LIST
    has_default_attributes
    has_links
    tag 'QueryList'
    #has_many :query_references, 'VCloud::Reference', :tag => 'Query'

    include Enumerable 
    def each
      links.select {|l| l.type == 'application/vnd.vmware.vcloud.query.records+xml'}.each {|l| yield l}
    end

  end

end