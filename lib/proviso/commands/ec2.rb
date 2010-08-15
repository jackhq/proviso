require 'AWS'
require 'yaml'

module Proviso::Command
  class Ec2 < Base

    def initialize(args)
      @args = args
      load_config
      @ec2 = establish_connection
    end
    

    def list
      @ec2.describe_instances().reservationSet.item.map { |i| puts i.instancesSet.item.first["dnsName"] + ' ' + i.instancesSet.item.first["instanceId"] }
    end
    
    def create
      puts @ec2.run_instances(
        :image_id               =>                  @image_id, 
        :key_name               =>                  @key_name, 
        :max_count              =>                  @max_count,
        :availability_zone      =>                  @availability_zone,
        :security_group         =>                  @security_group
      ).inspect 
    end
    
    def remove
      @ec2.terminate_instances(:instance_id => @args[0])
    end
    
    def status
      puts @ec2.describe_instances(:instance_id => @args[0]).reservationSet.item.first.instancesSet.item.first.inspect  
    end
    
    def establish_connection
      AWS::EC2::Base.new(:access_key_id => ENV['AMAZON_ACCESS_KEY_ID'], :secret_access_key => ENV['AMAZON_SECRET_ACCESS_KEY'])      
    end
    
    def load_config
      ec2_config = YAML.load_file('proviso.yml')["ec2"]
      @image_id = ec2_config['image_id']
      @availability_zone = ec2_config['availability_zone']
      @key_name = ec2_config['key_name']
      @security_group = ec2_config['security_group']
      @max_count = ec2_config['max_count']
    end
    
  end
  
end

