require 'json'

def copy(obj)
  text = obj.to_json
  IO.popen('pbcopy', 'r+') { |clipboard| clipboard.puts text }
end

def paste
  text = IO.popen('pbpaste', 'r+') { |clipboard| clipboard.gets }
  JSON.parse(text)
end

