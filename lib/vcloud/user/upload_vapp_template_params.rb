module VCloud
  # Represents vApp template instantiation parameters
  class UploadVAppTemplateParams
    include ParsesXml

    register_namespace 'xmlns', VCloud::Constants::NameSpace::V1_5
    tag 'UploadVAppTemplateParams'
    attribute :name,        String
    element   :description, String,   :tag => 'Description'

    # A new instance of UploadVAppTemplateParams
    #
    # @param [String] name Name of the vApp Template
    # @param [String] description Description of the vApp Template
    def initialize(name, description)
      self.name = name
      self.description = description
    end
  end
end