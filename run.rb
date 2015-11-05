require 'erb'

config = {
  app_root: "/vagrant/apps/test_target",
  unicorn_worker_count: "4",
  app_name: "test_target",
  unicorn_port: "3000",
  http_timeout: "30",
  ssl_cert_path: "/ssl",
  certificate_filename: "server.crt",
  certificate_key_filename: "server.key",
  http_port: "80",
  ssl_port: "443"
}

def stringify_symbol( sym ) 
   sym.to_s.gsub!( "_", " " ).split.map(&:capitalize).join(' ')
end


def write_config_file( template_path, output_path, binding ) 
  erb_template = File.read(File.expand_path(template_path, __FILE__))
  output = ERB.new(erb_template).result(binding)
  File.open( output_path, 'w' ){ |f| f.write(output) }
end 

config.each do |key,value|
  print "Enter #{stringify_symbol(key)}"
  if value
  	print " (default value \"#{value}\"): " 
  else
  	print ": "
  end

  input = gets
  if input != "\n"
  	config[key] = input.chomp
  end

end

puts

unicorn_config_path = "#{config[:app_root]}/config/unicorn.rb"
nginx_config_path = "#{config[:app_root]}/config/#{config[:app_name]}_nginx"
restart_script_path = "#{config[:app_root]}/restart.sh"

puts "- Generating unicorn config file at #{unicorn_config_path}\n"
write_config_file( "../templates/unicorn.rb.erb", unicorn_config_path, binding )

puts "- Generating NGINX  config file at #{nginx_config_path}.  The restart script will copy it into the nginx config path when you run it.\n"
write_config_file( "../templates/app_nginx_conf.erb", nginx_config_path, binding )

puts "- Writing restart script at #{app_root}/restart.sh\n"
write_config_file( "../templates/restart.sh.erb", restart_script_path, binding )
