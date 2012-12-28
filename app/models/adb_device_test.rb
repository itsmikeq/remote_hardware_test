require 'simplabs/highlight'

class AdbDeviceTest < ActiveRecord::Base
  attr_accessible :company_id, :device_id, :name, :script, :upload_id
  belongs_to :company
  belongs_to :device
  belongs_to :upload
  # before_filter :render_body, :only => :show

  def self.render_body(id)
    script = markdown(coderay(AdbDeviceTest.find(id).script))
  end

  def markdown(text)
    return RDiscount.new(text).to_html
  end

  def self.highlight(text)
    shell = File.basename(text.split.first.split(/\#\!/).last,'.*')
    return Simplabs::Highlight.highlight(shell, text)
  end

end
