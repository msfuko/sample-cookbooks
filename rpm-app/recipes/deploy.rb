include_recipe 'deploy'

node[:deploy].each do |app_name, deploy_config|
  # determine root folder of new app deployment
  app_root = "#{deploy_config[:deploy_to]}/current"

 # install & start 
  bash 'deploy-rpm' do
        user deploy_config[:user]
        code <<-EOH
                rpm -ivh "#{app_root}/#{deploy[:application]}*"
        EOH
        notifies :start, "service[#{node['rpm']['serviceName']}]", :delayed
  end
end
