require 'spec_helper'

include WebMock::API

describe VCloud::InstantiateVAppTemplateParams do
  
  before(:each) do
    
  end
  
  it "creates a new InstantiateVAppTemplateParams" do
    vapp_params = VCloud::InstantiateVAppTemplateParams.new
    vapp_params.name = 'SomeVAppTemplateParams'
    vapp_params.description = 'some descriptive string'
    vapp_params.source_ref = VCloud::Reference.new({})
    
    vapp_params.should_not == nil
    vapp_params.name.should == "SomeVAppTemplateParams"
    vapp_params.description.should == "some descriptive string"
    vapp_params.source_ref.should_not == nil
    vapp_params.instantiation_param_items.should have(0).items
    vapp_params.deploy.should == true
    vapp_params.power_on.should == false    
  end
  
  it "seralizes to XML" do
    vapp_params = VCloud::InstantiateVAppTemplateParams.new
    vapp_params.name = 'SomeVAppTemplateParams'
    vapp_params.description = 'some descriptive string'
    vapp_params.source_ref = VCloud::Reference.new({})
    
    xml = ""
    vapp_params.to_xml.split.each do |line|
      xml += line.strip
    end
    
    compare_xml = ""
    VCloud::Test::Data::INSTANTIATE_VAPP_TEMPLATE_PARAMS.split.each do |line|
      compare_xml += line.strip
    end
    
    xml.should == compare_xml
  end
end