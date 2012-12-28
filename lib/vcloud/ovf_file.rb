module VCloud
  class OvfFile
    include ParsesXml

    OVF_NS = 'http://schemas.dmtf.org/ovf/envelope/1'
    VSSD_NS = 'http://schemas.dmtf.org/wbem/wscim/1/cim-schema/2/CIM_VirtualSystemSettingData'

    class FileElement
      include ParsesXml
      #namespace OVF_NS
      tag 'File'

      attribute :href, String
      attribute :id, String
      attribute :size, Integer
    end

    class References
      include ParsesXml
      #namespace OVF_NS
      tag 'References'
      has_many :files, VCloud::OvfFile::FileElement
    end


    class Disk
      include ParsesXml

      #namespace OVF_NS
      attribute :capacity, Integer
      attribute :disk_id, String, :tag => 'diskId'
      attribute :file_ref, String, :tag => 'fileRef'
      attribute :format, String
    end

    class DiskSection
      include ParsesXml

      element :info, String, :tag => 'Info'
      has_many :disks, Disk
    end

    class System
      include ParsesXml
      tag 'System'

      element :virtual_system_identifer, String, :tag => 'VirtualSystemIdentifier', :namespace => 'vssd'
    end

    class VirtualHardwareSection
      include ParsesXml

      tag 'VirtualHardwareSection'

      has_one :system, System
    end

    tag 'Envelope'
    has_one :disk_section, DiskSection
    has_one :references, References
    has_one :virtual_hardware_section, VirtualHardwareSection
  end
end
