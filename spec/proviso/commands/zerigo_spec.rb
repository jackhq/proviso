require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Proviso Zerigo DNS Command" do
  before(:each) do
    hash = {"zerigo" => {"user"=>"user", "password"=>"password", "ttl"=>"15000", "type"=>"A"}}
    YAML.stub!(:load_file).and_return(hash)  
    @zone = mock('::Zerigo::DNS::Zone', :id => 1)
    ::Zerigo::DNS::Zone.should_receive(:find_or_create).and_return(@zone)
    ::Zerigo::DNS::Host.should_receive(:update_or_create).and_return(true)    
  end
  
  it "should link a dns" do
    @zerigo = Proviso::Command::Zerigo.new(['staging.example.com','127.0.0.1'])
    @zerigo.link.should == true
  end
    
  it "should unlink a dns" do
    @zerigo = Proviso::Command::Zerigo.new(['staging.example.com'])
    @zerigo.unlink.should == true
  end
    
  
end
