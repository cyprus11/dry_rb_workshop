require_relative '../../config/boot'

Container.logger.debug('starting request: in_memory.transport.cat_toy_testing_request')
Container['in_memory.transport.cat_toy_testing_request'].call
Container.logger.debug('finish request: in_memory.transport.cat_toy_testing_request')
Container.logger.debug('starting request: in_memory.transport.testers_accounting_request')
Container['in_memory.transport.testers_accounting_request'].call
Container.logger.debug('finish request: in_memory.testers_accounting_request')
