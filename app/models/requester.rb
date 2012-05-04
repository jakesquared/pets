class Requester
  require 'open-uri'

  include HTTParty
   parser(
    Proc.new do |body, _|
      Crack::XML.parse(body)
    end
  )
  debug_output $stderr

  def initialize(connector)
    @connector = connector
    self.class.base_uri(@connector.url)
  end

  def make_request
    data= self.class.get('/rest/', :timeout => 100, :query => @connector.url_params)
    parse_response(data)
  rescue Timeout
      make_request
  end

  def parse_response(data)
    data["pets"]["pet"].each do |pet|
      to_model(pet)
    end
  end

  def to_model(data)
    attributes = @connector.transform(data)
    upload_photo(attributes[:photo])
    Pet.create(attributes) if Pet.where(:remote_id => attributes[:remote_id]).empty?
  end

  def upload_photo(url)
    data = open(URI.parse(url)) {|f| f.read }
    data = StringIO.new(data)
    uploader = PicUpload.new
    uploader.store!(data)
  end


end