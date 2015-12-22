include_recipe 'deploy'

node[:deploy].each do |app_name, deploy_config|
  # determine root folder of new app deployment
  app_root = "#{deploy_config[:deploy_to]}/current"

  # install
  bash 'deploy-rpm' do
        user deploy_config[:user]
        code <<-EOH
                rpm -ivh "#{app_root}/#{deploy_config[:app_name]}*"
        EOH
        notifies :start, "service[#{node['rpm']['serviceName']}]", :delayed
  end
  
  # start
  service '#{deploy_config[:app_name]}' do
        action :nothing
  end
end

