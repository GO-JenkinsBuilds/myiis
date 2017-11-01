powershell_script 'Install Web-Server' do
  guard_interpreter :powershell_script
  code 'Add-WindowsFeature Web-Server'
  #not_if 'test-path ~/data/nodes.bak'
end

file 'c:\inetpub\wwwroot\Default.htm' do
  content '<h1>Hello, world!</h1>'
end

service "w3svc" do
  action [:enable, :start]
end
