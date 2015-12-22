bash 'download_rpm' do
        user 'root'
        cwd '/tmp'
        code <<-EOH
                aws s3 cp #{node["rpm"]["url"]} .
        EOH
        notifies :start, 'service[nginx]', :delayed
end

service "nginx" do
        action :nothing
end

