include_recipe 'deploy'

node[:deploy].each do |app_name, deploy_config|
  # determine root folder of new app deployment
  app_root = "#{deploy_config[:deploy_to]}/current"
  
  Chef::Log.info("deploy #{app_name}")

  # install
  bash 'deploy-rpm' do
        user deploy_config[:user]
        code <<-EOH
                rpm -ivh "#{app_root}/#{app_name}*"
        EOH
        notifies :start, "service[#{app_name}]", :delayed
  end
  
  # start
  service '#{app_name}' do
        action :nothing
  end
end

