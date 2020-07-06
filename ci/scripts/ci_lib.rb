def file_to_string(file)
  File.read(file).to_s.strip
end

def get_alpine_version()
  file_to_string("alpine-release-feed/title")[/[0-9]+\.[0-9]+\.?[0-9]?/]
end

def get_xteve_version()
  file_to_string("xteve-repo/.git/ref")[/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/]
end
