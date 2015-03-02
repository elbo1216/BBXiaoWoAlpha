class GDrive

  CLIENT_ID = ENV['GCLIENTID']
  CLIENT_SECRET = ENV['GSECRET']
  REDIRECT_URI = 'urn:ietf:wg:oauth:2.0:oob'
  P12_PATH = '/Users/elbo1216/Downloads/BBXiaoWo-61cf96a56e73.p12'
  WS_FILE_KEY='1w7mMfYDmJH2V8NJ_gyoqjoQ2iEryLL9YKTOa7iVI5ik'

  # HEADERS
  class Headers
    PRODUCTID = 0
    SKU = 1
    ASIN = 2
    NAME = 3
    MASTER_PRICE = 4
    SLUG = 5
    COST_PRICE = 6
    COST_CURRENCY = 7
    DESCRIPTION = 8
    AVAILABLE_ON = 9
    PROMOTABLE = 10
    WEIGHT = 11
    HEIGHT = 12
    WIDTH = 13
    DEPTH = 14
    SHIPPING_CATEGORIES = 15
    TAX_CATEGORIES = 16
    TAXONS = 17
    OPTION_TYPE = 18
    META_TITLE = 19
    META_KEYWORS = 20
    META_DESCRIPTIONS = 21
    CH_NAME = 24
    CH_DESCRIPTION = 27
    CH_ADDITIONAL_INFO = 37
    IMAGE_FILENAME = 38
  end
  

# Authorizes with OAuth and gets an access token.
  def get_access_token
    client = Google::APIClient.new(
      :application_name => "BBXiaoWo",
      :application_version => "1.0"
    )
    prediction = client.discovered_api('prediction', 'v1.5')
  
    key = Google::APIClient::KeyUtils.load_from_pkcs12(P12_PATH, 'notasecret')
  
    client.authorization = Signet::OAuth2::Client.new(
      :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
      :audience => 'https://accounts.google.com/o/oauth2/token',
      :scope => 'https://www.googleapis.com/auth/drive https://www.googleapis.com/auth/userinfo.profile',
      :issuer => '128823476752-40rmv6upgfe37q2u64eftmoe493uffin@developer.gserviceaccount.com',
      :signing_key => key,
    )
    client.authorization.fetch_access_token!
    client.authorization.access_token
  end

  def get_ws
    # Creates a session.
    session = GoogleDrive.login_with_oauth(get_access_token)
    session.spreadsheet_by_key(WS_FILE_KEY).worksheets[0]
  end
end
