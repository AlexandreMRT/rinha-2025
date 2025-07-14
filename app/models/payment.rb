# app/models/payment.rb
class Payment < ApplicationRecord
  # Validações
  validates :correlation_id, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :requested_at, presence: true

  # Enums (já fazem validação automática)
  enum :processor_type,  { default: 0, fallback: 1 }
  enum :status, { pending: 0, processing: 1, processed: 2, failed: 3 }

  # Scopes úteis para queries
  scope :by_processor, ->(processor) { where(processor_type: processor) }
  scope :by_date_range, ->(from, to) { where(requested_at: from..to) }
  scope :successfully_processed, -> { where(status: :processed) }
  scope :failed_payments, -> { where(status: :failed) }

  # Callback para definir requested_at automaticamente
  before_validation :set_requested_at, on: :create

  private

  def set_requested_at
    self.requested_at ||= Time.current
  end
end
