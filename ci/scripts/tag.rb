require 'json'
xteve_version_file = File.read('xteve-downloads-repo/info.json')
xteve_version_hash = JSON.parse(xteve_version_file)
puts xteve_version_hash['version']
