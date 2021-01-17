require 'uri'

class InputVallidation
  
  def self.check_url(url)
    raise "Not a valid URL" unless url =~ /\A#{URI::regexp}\z/ 
  end

end