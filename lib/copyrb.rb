require 'yaml'
require 'base64'

def copy(obj)
  text = Base64.encode64(YAML.dump(obj)).gsub("\n", '') # getting rid of nonmeaningful new lines
  IO.popen('pbcopy', 'r+') { |clipboard| clipboard.puts text }
end

def paste
  text = IO.popen('pbpaste', 'r+') { |clipboard| clipboard.gets }
  YAML.load(Base64.decode64(text))
end

