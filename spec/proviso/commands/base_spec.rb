require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Proviso Base Command" do
  it "should display" do
    @base = Proviso::Command::Base.new([])
    @base.display("Hello World")
  
  end
  
  it "should error" do
    Proviso::Command.should_receive(:error).and_return("I see an error")
    Proviso::Command::Base.new([]).error("I see an error")
  end
  
  context "option parsing" do
    before(:each) do
      @base = Proviso::Command::Base.new([])
    end
    
    it "extracts options from args" do
      @base.stub!(:args).and_return(%w( a b --something value c d ))
      @base.extract_option('--something').should == 'value'
    end

    it "accepts options without value" do
      @base.stub!(:args).and_return(%w( a b --something))
      @base.extract_option('--something').should be_true
    end

    it "doesn't consider parameters as a value" do
      @base.stub!(:args).and_return(%w( a b --something --something-else c d))
      @base.extract_option('--something').should be_true
    end

    it "accepts a default value" do
      @base.stub!(:args).and_return(%w( a b --something))
      @base.extract_option('--something', 'default').should == 'default'
    end

    it "is not affected by multiple arguments with the same value" do
      @base.stub!(:args).and_return(%w( --arg1 val --arg2 val ))
      @base.extract_option('--arg1').should == 'val'
      @base.args.should == ['--arg2', 'val']
    end
  end
  
end