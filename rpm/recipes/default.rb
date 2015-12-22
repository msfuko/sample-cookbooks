bash 'download_rpm' do
        user 'root'
        cwd '/tmp'
        code <<-EOH
                aws s3 cp #{node["rpm"]["sourceUrl"]} .
        EOH
        notifies :start, service["#{node["rpm"]["serviceName"]}"], :delayed
end

service "#{node["rpm"]["serviceName"]}" do
        action :nothing
end

