include_recipe 'deploy'

# stop the service
node[:deploy].each do |app_name, deploy_config|
  service '#{deploy_config[:app_name]}' do
          action :stop
  end
end  

