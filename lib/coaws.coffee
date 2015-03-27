Aws = require 'aws-sdk'
thunkify = require 'thunkify'
# Coaws go moo
module.exports = class Coaws extends Aws
  @aws = Aws
  for serviceName, service of Aws when service?.serviceIdentifier
    Coaws[serviceName] = do (service) ->
      class Service
        constructor: (options) ->
          @service = new service options
          for key, method of @service
            if method instanceof Function
              @[key] = thunkify method.bind @service
          @__proto__ = @service
