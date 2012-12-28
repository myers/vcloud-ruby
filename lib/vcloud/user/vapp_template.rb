module VCloud
  # A vApp is a collection of VMs, network config, etc.
  class VAppTemplate < BaseVCloudEntity
    include ParsesXml
    #has_type VCloud::Constants::ContentType::VAPP_TEMPLATE
    has_links

  end
end