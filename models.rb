if cf = YAML.load_file("config.yml")

  c = cf.inject({}){|h,(k,v)| h.merge({ k.to_sym => v}) }
  url = "postgres://%{user}:%{pass}@%{host}/%{name}" % c

  # config DataMapper
  DataMapper::setup(:default, url)
  DataMapper::Logger.new(STDOUT, :debug)

  ## Require all files from models folder
  Dir.glob("./models/*.rb").each { |f| require "./#{f}" }

  DataMapper.finalize
else
  puts "«config.yml» file not found"
end