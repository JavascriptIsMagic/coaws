Aws = require 'aws-sdk'
thunkify = require 'thunkify'

# Coaws go moo
module.exports = class Coaws extends Aws
  for own key, service of Aws
    if service instanceof Function
      do (service) ->
        Coaws["#{key}$"] = service
        Coaws[key] = class Service extends service
          constructor: ->
            super()
            for key, method of @
              if method instanceof Function
                Service::["#{key}$"] = method
                Service::[key] = thunkify method.bind service
