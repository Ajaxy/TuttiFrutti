# encoding: utf-8

class Response
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :position, :first_name, :last_name, :birth_date,
                :work_permit, :phone, :start_date, :info_source,
                :covering_letter

  validates_presence_of :first_name, :last_name, :birth_date, :phone, :work_permit,
                        :message => "Поле не может быть пустым"

  def initialize(params = {})
    values = (1..3).map { |i| params.delete("birth_date(#{i}i)").to_i }
    self.birth_date = Date.civil(*values) rescue nil

    params.each do |attr, value|
      self.public_send("#{attr}=", value)
    end if params
  end

  def persisted?
    false
  end
end
