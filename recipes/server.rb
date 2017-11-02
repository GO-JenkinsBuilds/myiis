powershell_script 'Install Web-Server' do
  guard_interpreter :powershell_script
  code 'Add-WindowsFeature Web-Server'
  #not_if 'test-path ~/data/nodes.bak'
end

template 'c:\inetpub\wwwroot\Default.htm' do
source 'Default.htm.erb'
end

service "w3svc" do
  action [:enable, :start]
end
