#!/usr/bin/env ruby

require "json"
require_relative "ci_lib"

def generate_build_arg_hash()
  atc_external_url = file_to_string("metadata/atc_external_url")
  build_team_name = file_to_string("metadata/build_team_name")
  build_pipeline_name = file_to_string("metadata/build_pipeline_name")
  build_job_name = file_to_string("metadata/build_job_name")
  build_name = file_to_string("metadata/build_name")

  now = Time.now.utc

  {
    "ALPINE_VERSION" => get_alpine_version(),
    "BUILD_TIME" => now.strftime("%Y-%m-%dT%H:%M:%SZ"),
    "BUILD_CI_URL" => "#{atc_external_url}/teams/#{build_team_name}/pipelines/#{build_pipeline_name}/jobs/#{build_job_name}/builds/#{build_name}",
    "DOCKER_XTEVE_COMMIT_REF" => file_to_string("docker-xteve-repo/.git/ref"),
    "XTEVE_COMMIT_REF" => file_to_string("xteve-repo/.git/HEAD"),
    "XTEVE_VERSION" => get_xteve_version(),
  }
end

puts JSON.pretty_generate(generate_build_arg_hash)
