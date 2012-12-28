require 'spec_helper'

include WebMock::API

describe VCloud::VAppTemplate do
  
  before(:each) do
    @template = VCloud::VAppTemplate.from_xml(fixture_file('vapp_template.xml'))
    @template.session = @session
  end
  
  describe 'parses xml #from_xml' do 
    it 'should have correct values' do
      @template.name.should == "Ubuntu 10.04.4 LTS"
      @template.id.should == 'urn:vcloud:vapptemplate:aaa-bbb-ccc-ddd-eee-fff'
      @template.type.should == 'application/vnd.vmware.vcloud.vAppTemplate+xml'
      @template.href.should == "https://some.vcloud.com/api/vAppTemplate/vappTemplate-aaa-bbb-ccc-ddd-eee-fff"
    end
    
    it 'should parse links' do
      @template.links.should_not be_nil
      @template.links.should have(6).items
      
      @template.links.first.type.should == 'application/vnd.vmware.vcloud.catalogItem+xml'
      @template.links.first.rel.should == 'catalogItem'
      @template.links.first.href.should == 'https://some.vcloud.com/api/catalogItem/aaa-bbb-ccc-ddd-eee-fff'
    end
  end
end

describe "VCloud::VAppTemplate while uploading" do
  
  before(:each) do
    @template = VCloud::VAppTemplate.from_xml(fixture_file('vapp_template_while_uploading.xml'))
    @template.session = @session
  end
  
  describe 'parses xml #from_xml' do 
    it 'should have correct values' do
      @template.status.should == 0
      @template.files.should have(1).items
      file = @template.files.first
      file.links.should have(1).items
      file.links.first.rel.should == "upload:default"
      file.links.first.href.should == "https://some.vcloud.com/transfer/disk0.vmdk"
    end
  end
end