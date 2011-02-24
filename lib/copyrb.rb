require 'yaml'
require 'base64'
require 'clipboard'

Clipboard.implementation = Clipboard::File # remove this line to use the real clipboard

def copy(obj)
  text = Base64.encode64(YAML.dump(obj)).gsub("\n", '') # getting rid of meaningless new lines
  Clipboard.copy(text)
end

def paste
  text = Clipboard.paste
  YAML.load(Base64.decode64(text))
end

