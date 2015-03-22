Aws = require 'aws-sdk'
thunkify = require 'thunkify'

# Coaws go moo
module.exports = class Coaws extends Aws
  for own serviceName, service of Aws
    if service instanceof Function
      @[service] = class Service extends service
        for own methodName, method of service::
          if method instanceof Function
            Service::[methodName] = thunkify method.bind service
            Service::[methodName + '$'] = method
