config = {
  host: "localhost",
  port: "9200",
  transport_options: {
    request: { timeout: 5 }
  },
  log: true
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)