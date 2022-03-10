require 'rqrcode'
require 'open-uri'

class QrCodesController < ApplicationController
  before_action :set_post, only: :create

  def create
    # raise
    post = Post.find(params[:post_id])

    qr = RQRCode::QRCode.new(@post.url)
    @png_qr_code = qr.as_png

    file = StringIO.new(@png_qr_code.to_s)
    cloud_response = Cloudinary::Uploader.upload(file)
    cloud_file = URI.open(cloud_response['secure_url'])

    if !post.qr_code.attached?
      post.qr_code.attach(io: cloud_file, filename: 'qr_code.png', content_type: 'image/png')
      # SEND EMAIL
      QrCodeMailer.with(qr_code_url: cloud_response['secure_url'], user: current_user)
                  .new_qr_code_mail
                  .deliver_later
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!###################################33"
      redirect_to cloud_response['secure_url']
    else
      flash[:alert] = "QR Code was NOT created"
      render 'posts/show', post: post
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end

# Expects a string or array (for multi-segment encoding) to be parsed in, other args are optional

#   data - the string, QRSegment or array of Hashes (with data:, mode: keys) you wish to encode

#   size - the size (Integer) of the QR Code (defaults to smallest size needed to encode the data)

#   max_size - the max_size (Integer) of the QR Code (default RQRCodeCore::QRUtil.max_size)

#   level - the error correction level, can be:
#     * Level :l 7%  of code can be restored
#     * Level :m 15% of code can be restored
#     * Level :q 25% of code can be restored
#     * Level :h 30% of code can be restored (default :h)

#   mode - the mode of the QR Code (defaults to :alphanumeric or :byte_8bit, depending on the input data,
#          only used when data is a string):
#     * :number
#     * :alphanumeric
#     * :byte_8bit
#     * :kanji


# AS PNG
# Options:

# fill  - Background ChunkyPNG::Color, defaults to 'white'
# color - Foreground ChunkyPNG::Color, defaults to 'black'

# When option :file is supplied you can use the following ChunkyPNG constraints:

# color_mode  - The color mode to use. Use one of the ChunkyPNG::COLOR_* constants.
#               (defaults to 'ChunkyPNG::COLOR_GRAYSCALE')
# bit_depth   - The bit depth to use. This option is only used for indexed images.
#               (defaults to 1 bit)
# interlace   - Whether to use interlacing (true or false).
#               (defaults to ChunkyPNG default)
# compression - The compression level for Zlib. This can be a value between 0 and 9, or a
#               Zlib constant like Zlib::BEST_COMPRESSION
#               (defaults to ChunkyPNG default)

# There are two sizing algorithms.

# * Original that can result in blurry and hard to scan images
# * Google's Chart API inspired sizing that resizes the module size to fit within the given image size.

# The Google one will be used when no options are given or when the new size option is used.

# *Google Sizing*

# size            - Total size of PNG in pixels. The module size is calculated so it fits.
#                   (defaults to 120)
# border_modules  - Width of white border around the modules.
#                   (defaults to 4).

# -- DONT USE border_modules OPTION UNLESS YOU KNOW ABOUT THE QUIET ZONE NEEDS OF QR CODES --

# *Original Sizing*

# module_px_size  - Image size, in pixels.
# border          - Border thickness, in pixels

# It first creates an image where 1px = 1 module, then resizes.
# Defaults to 120x120 pixels, customizable by option.
