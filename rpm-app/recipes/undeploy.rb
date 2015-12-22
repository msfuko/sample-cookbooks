include_recipe 'deploy'

# stop the service
service '#{deploy[:application]}' do
        action :stop
end

