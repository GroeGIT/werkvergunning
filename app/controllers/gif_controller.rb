class GifController < ApplicationController

  #before filter zorgt ervoor dat de functies binnen deze controller alleen getoond worden nadat er is ingelogd.
  before_filter :authorize

end
