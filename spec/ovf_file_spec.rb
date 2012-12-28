require 'spec_helper'

include WebMock::API

describe VCloud::OvfFile do
  before(:each) do
    @ovf = VCloud::OvfFile.from_xml(fixture_file('test.ovf'))    
  end
  
  describe 'when parsing xml #from_xml' do 
    it 'should have correct values' do

      @ovf.references.class.should == VCloud::OvfFile::References
      file = @ovf.references.files.first
      @ovf.references.files.size.should == 1
      file.size.should == 694616064
      file.href.should == "precise-server-cloudimg-amd64-disk1.vmdk"

      @ovf.virtual_hardware_section.class.should == VCloud::OvfFile::VirtualHardwareSection
      @ovf.virtual_hardware_section.system.class.should == VCloud::OvfFile::System
      @ovf.virtual_hardware_section.system.virtual_system_identifer.should == 'Ubuntu 12.04 (Precise Pangolin) Server'
    end
  end    
end
