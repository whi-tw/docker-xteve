#!/usr/bin/env ruby

require "json"
require_relative "ci_lib"

xteve_version_file = File.read("xteve-downloads-repo/info.json")
xteve_version_hash = JSON.parse(xteve_version_file)

alpine_version = file_to_string("alpine-release-feed/title")[/[0-9]+\.[0-9]+\.[0-9]+/]
puts "#{xteve_version_hash["version"]}-alpine#{alpine_version}"
