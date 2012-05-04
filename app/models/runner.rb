class Runner
  def self.run_rescue_group
    requester = Requester.new(RescuegroupConnector.new)
    requester.make_request
  end
end