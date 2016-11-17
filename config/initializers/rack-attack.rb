class Rack::Attack
  throttle('req/ip', :limit => 300, :period => 5.minutes) do |req|
    req.ip # unless req.path.starts_with?('/assets')
  end

  blocklist('block 52.28.221.x') do |req|
    req.ip.starts_with?('52.28.221')
  end
end