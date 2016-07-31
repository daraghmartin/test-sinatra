docker_service 'default' do
  action [:create, :start]
end

docker_image 'daraghmartin/test-sinatra' do
  tag 'latest'
  action :pull
end

docker_container 'test-sinatra' do
  tag 'latest'
  repo 'daraghmartin/test-sinatra'
  port '4567:4567'
  log_driver = "json-file"
  log_opts "max-size=1g"
  detach true
  restart_policy 'always'
  action ["redeploy"]
  ENV [ "ENVIRONMENT=#{node.chef_environment}" ]
end
