class QrCodeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    args.first.attach_qr_code
  end
end
