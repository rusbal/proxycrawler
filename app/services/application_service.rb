class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end

  def debug(so, message)
    log(so, message)
    binding.pry if Rails.env.development?
  end

  def log(so, message)
    Rails.logger.debug ("-" * 50) + "DEBUG START: #{so.class.name}" + ("-" * 50)
    Rails.logger.debug message
    Rails.logger.debug ("-" * 50) + "DEBUG END: #{so.class.name}" + ("-" * 50)
  end
end
