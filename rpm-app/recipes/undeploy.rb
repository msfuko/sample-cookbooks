include_recipe 'deploy'

# stop the service
node[:deploy].each do |app_name, deploy_config|
  service 'rpm' do
          service_name '#{app_name}'
          action :stop
  end
end  

