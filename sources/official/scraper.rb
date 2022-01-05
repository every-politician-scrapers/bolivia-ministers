#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      noko.css('.views-field-title .field-content').text.tidy
    end

    def position
      noko.css('.views-field-field-cargo .field-content').text.tidy
    end
  end

  class Members
    def member_container
      noko.css('table.views-view-grid td')
    end
  end
end

file = Pathname.new '../../html/official.html'
puts EveryPoliticianScraper::FileData.new(file).csv if file.exist? && !file.empty?
