class ProxyCrawlRequestUrl < RequestUrl
  PROXYCRAWL_ROOT    = "https://api.proxycrawl.com"
  PROXYCRAWL_SERVICE = "product=crawling-api"

  ##############################################################################################
  #
  # IMPORTANT: PROXYCRAWL_TOKEN should go into secrets but added here for testing purposes only.
  #
  ##############################################################################################
  PROXYCRAWL_TOKEN = "DYAT0hMPreb209_PYqo-Pw"

  def proxy_url
    "#{PROXYCRAWL_ROOT}/?#{PROXYCRAWL_SERVICE}&token=#{PROXYCRAWL_TOKEN}&url=#{target_escaped_url}"
  end

  private

  def target_escaped_url
    ERB::Util.url_encode(url)
  end
end
