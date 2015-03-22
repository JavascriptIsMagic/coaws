Aws = require 'aws-sdk'
thunkify = require 'thunkify'

# Coaws go moo
module.exports = class Coaws extends Aws
  for own key, service of Aws
    if service instanceof Function
      do (service) ->
        Coaws[key] = class Service extends service
          constructor: ->
            superApply arguments
            for key, method of @
              if method instanceof Function
                Service::[key] = thunkify method.bind service
