#!/usr/bin/env ruby

require "json"
require_relative "ci_lib"

def generate_build_arg_hash()
  {
    "XTEVE_TAG" => file_to_string("tag/tag")
  }
end

puts JSON.pretty_generate(generate_build_arg_hash)
