# download rpm from s3
bash 'download_rpm' do
        user 'root'
        cwd '/tmp'
        code <<-EOH
                aws s3 cp #{node["rpm"]["sourceUrl"]} .
        EOH
        notifies :run, 'bash[install_rpm]', :delayed
end

# install rpm
bash 'install_rpm' do
        user 'root'
        cwd '/tmp'
        code <<-EOH
                rpm -ivh "#{node["rpm"]["serviceName"]}*"
        EOH
        notifies :start, "service[#{node['rpm']['serviceName']}]", :delayed
    
end

# start the service
service '#{node["rpm"]["serviceName"]}' do
        action :nothing
end

