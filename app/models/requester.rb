class Requester
  attr_accessor :page, :limit

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

  def options
    {
      :limit => @limit || 100,
      :page => @page || 1
    }
  end

  def make_request
    data = self.class.get('/rest/', :timeout => 100, :query => @connector.url_params(options))
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
    Pet.create(attributes) if Pet.where(:provider => attributes[:provider], :remote_id => attributes[:remote_id]).empty?
  end
end