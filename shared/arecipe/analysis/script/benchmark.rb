#!/usr/bin/env ruby
require 'erb'

autobench_params = {
  "--host1" => "localhost",
  "--port1" => "3000",
  "--num_conn"  =>  10,
  "--low_rate"  =>  20,
  "--rate_step" =>  20,
  "--high_rate" => 200,
  "--num_call"  =>   1,
  "--timeout"   =>  30
}

tests = {
  :home => {
    :path => "/"
  },
  # :user_light => {
  #   :path => "/users/51"
  # },
  # :user_heavy => {
  #   :path => "/users/43"
  # },
  # :recipe_light => {
  #   :path => "/recipes/2056"
  # },
  # :recipe_heavy => {
  #   :path => "/recipes/2097"
  # },
  :home_with_auth => {
    :path => "/",
    :with_authentication => true
  }#,
  # :user_light_with_auth => {
  #   :path => "/users/51",
  #   :with_authentication => true
  # },
  # :user_heavy_with_auth => {
  #   :path => "/users/43",
  #   :with_authentication => true
  # },
  # :recipe_light_with_auth => {
  #   :path => "/recipes/2056",
  #   :with_authentication => true
  # },
  # :recipe_heavy_with_auth => {
  #   :path => "/recipes/2097",
  #   :with_authentication => true
  # }
}

def results_path(test_name, i=0)
  "/shared/arecipe/analysis/raw_data/phase_04/#{"%02d" % i}_#{test_name}.csv"
end


i = 1
tests.each do |test_name, test|
  
  puts "---------> #{test_name}"
  puts "           Writing path.txt"
  template = ERB.new File.read("/shared/arecipe/analysis/script/templates/path.txt.erb")
  File.open('path.txt', 'w') do |f|
    @path = test[:path]
    @with_authentication = test[:with_authentication]
    f.write template.result(binding)
  end
  
  autobench_command = "autobench --single_host #{autobench_params.map{|k, v| "#{k} #{v}"}.join(' ')} --file #{results_path(test_name, i)}"
  puts "           Runnig autobench"
  `#{autobench_command} > /dev/null 2>&1`
  
  puts "\n\n"
  
  i+=1
end
