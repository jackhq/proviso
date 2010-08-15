require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Proviso Command" do
  before(:each) do
    hash = {"ec2" => {"image_id"=>"ami-2d4aa444", "availability_zone"=>"us-east-1c", "key_name"=>"ec2-keypair", "security_group"=>"default", "max_count"=>1}}
    YAML.stub!(:load_file).and_return(hash)
  end
  
  it "should list ec2 servers" do
    Proviso::Command.run('ec2:list')
  end
  
  it "should return error on ec2:foobar" do 
    lambda { Proviso::Command.run('ec2:foobar') }.should raise_error
  end
  
  it "should return status of instance" do
    Proviso::Command.run('ec2:status',['i-3d8b0157'])
  end
  
  it "should link server " do
    Proviso::Command.run('zerigo:link',['staging.example.com','127.0.0.1'])
    
  end
  
end
