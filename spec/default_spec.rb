require 'chefspec'

describe 'nginx_vhost::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'nginx_vhost::default' }
  it 'should do something' do
    pending 'Your recipe examples go here.'
  end
end
