class MovieProvider
  attr_reader :link,
              :logo,
              :provider_name
              

  def initialize(data)
    @link = data[:link]
    if data[:flatrate].nil? == false
      @logo = data[:flatrate].map do |provider|
        provider[:logo_path]
      end 
      @provider_name = data[:flatrate].map do |provider|
        provider[:provider_name]
      end 
    elsif data[:rent]
      @provider_name = data[:rent].map do |provider|
        provider[:provider_name]
      end
      @logo = data[:rent].map do |provider|
        provider[:logo_path]
      end 
    end
  end
end