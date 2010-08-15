require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Proviso Ec2 Command" do
  before(:each) do
    hash = {"ec2" => {"image_id"=>"ami-2d4aa444", "availability_zone"=>"us-east-1c", "key_name"=>"ec2-keypair", "security_group"=>"default", "max_count"=>1}}
    YAML.stub!(:load_file).and_return(hash)  
  end
  
  it "should list ec2"
  it "should create ec2"
  it "should remove ec2"
    
  
end