#!/usr/bin/env ruby
#
# Used to graph results from autobench
#
# Usage: ruby autobench_grapher.rb result_from_autobench.tsv
#
# This will generate three svg & png graphs

# Quelle: https://github.com/brandonparsons/performance_tests

require "rubygems"
require "scruffy"
require 'nokogiri'
require 'csv'
require 'yaml'

class ResultGrapher

  def self.run
    new(ARGV.first).run
  end

  def initialize(result_file)
    @result_file = result_file
    @stats = {
      :attempted_request_rate => [], 
      :average_reply_rate => [], 
      :average_response_time => [], 
      :errors => []
    }
  end

  def run 
    parse_log
    generate_graph
  end

  def parse_log
    File.open(@result_file).each do |line|
      row = line.split("\t") 

      next if row[0] =~ /^\D+/

      @stats[:attempted_request_rate] << row[0].to_f
      @stats[:average_reply_rate] << row[4].to_f
      @stats[:average_response_time] << row[7].to_f
      if row[4].to_f == 0 
        @stats[:errors] << 100
      else
        @stats[:errors] << (row[9].to_f * row[4].to_f)/(row[9].to_f * row[4].to_f / 100 + row[4].to_f)
      end
    end
  end
  
  def file_root
    @result_file.gsub(/\..*/, "")
  end

  def generate_graph
    g = Scruffy::Graph.new
    g.title = "Average Reply Rate (Responses per Second)"
    g.renderer = Scruffy::Renderers::Standard.new

    g.add :area, "Attempted Request Rate", @stats[:attempted_request_rate]
    g.add :line, "Average Reply Rate", @stats[:average_reply_rate]

    g.point_markers = @stats[:attempted_request_rate]

    g.render :to => "#{file_root}_average_reply_rate.svg", :min_value => 0
    

    g2 = Scruffy::Graph.new
    g2.title = "Average Response Time (in ms)"
    g2.renderer = Scruffy::Renderers::Standard.new

    g2.add :line, "Average Response Time", @stats[:average_response_time]

    g2.point_markers = @stats[:attempted_request_rate]
    
    g2.render :to => "#{file_root}_average_response_time.svg", :min_value => 0
   

    g3 = Scruffy::Graph.new
    g3.title = "Errors"
    g3.renderer = Scruffy::Renderers::Standard.new

    g3.add :line, "Errors", @stats[:errors]
    
    g3.point_markers = @stats[:attempted_request_rate]

    g3.render :to => "#{file_root}_errors.svg", :min_value => 0
    
    ["#{file_root}_average_reply_rate.svg", "#{file_root}_average_response_time.svg", "#{file_root}_errors.svg"].each do |filename|
      doc = Nokogiri::XML(File.read(filename))
      doc.at('svg')['viewBox'] = '0 0 600 360'
      File.open(filename, 'w') do |f|
        f.write doc.to_s
      end
    end
  end
end

ResultGrapher.run
