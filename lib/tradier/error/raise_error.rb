require 'faraday'
require 'tradier/error/bad_gateway'
require 'tradier/error/bad_request'
require 'tradier/error/forbidden'
require 'tradier/error/gateway_timeout'
require 'tradier/error/internal_server_error'
require 'tradier/error/not_acceptable'
require 'tradier/error/not_found'
require 'tradier/error/service_unavailable'
require 'tradier/error/too_many_requests'
require 'tradier/error/unauthorized'
require 'tradier/error/unprocessable_entity'

module Tradier
  module Response
    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)
        status_code = env[:status].to_i
        error_class = @klass.errors[status_code]
        raise error_class.from_response(env) if error_class
      end

      def initialize(app, klass)
        @klass = klass
        super(app)
      end

    end
  end
end
