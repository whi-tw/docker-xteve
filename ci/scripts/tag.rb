#!/usr/bin/env ruby

require "json"
require_relative "ci_lib"

xteve_version = get_xteve_version()

alpine_version = get_alpine_version()
puts "#{xteve_version}-alpine#{alpine_version}"
