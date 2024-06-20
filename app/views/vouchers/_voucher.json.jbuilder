json.extract! voucher, :id, :contact_name, :contact_email, :activity_id, :status, :payment_type, :total, :created_at, :updated_at
json.url voucher_url(voucher, format: :json)
