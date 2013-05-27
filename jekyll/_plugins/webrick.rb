require 'webrick'
include WEBrick
WEBrick::HTTPUtils::DefaultMimeTypes.store 'svg', 'image/svg+xml'
WEBrick::HTTPUtils::DefaultMimeTypes.store 'ico', 'image/x-icon'