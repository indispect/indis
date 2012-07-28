# Load the rails application
require File.expand_path('../application', __FILE__)

#session key and secret
#config.action_dispatch.session = {
#  :key    => '_app_session',
#  :secret => '0x6bxk234fm45iq2679amwdthwg...'
#}

# Initialize the rails application
Indispect::Application.initialize!
