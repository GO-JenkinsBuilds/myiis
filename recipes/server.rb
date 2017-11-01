powershell_script 'Install Web-Server' do
  guard_interpreter :powershell_script
  code 'Add-WindowsFeature Web-Server'
  #not_if 'test-path ~/data/nodes.bak'
end

file 'c:\inetpub\wwwroot\Default.htm' do
  content "<h1>Hello, world!</h1>
  <h2>PLATFORM: #{node['platform']}</h2>
  <h2>HOSTNAME: #{node['hostname']}</h2>
  <h2>MEMORY: #{node['memory']['total']}</h2>
  <h2>CPU Mhz: #{node['cpu']['0']['mhz']}</h2>"
end

service "w3svc" do
  action [:enable, :start]
end
