# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date
#  end_date   :date
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord

  validates :status, :cat_id, presence: true
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests

    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: cat_id)
      .where.not('start_date > :end_date OR end_date < :start_date',
                 start_date: start_date, end_date: end_date)


    # possible_overlaps = CatRentalRequest.where("start_date BETWEEN '#{self.start_date}' AND '#{self.end_date}'")
    #
    # possible_overlaps += CatRentalRequest.where("end_date BETWEEN '#{self.start_date}' AND '#{self.end_date}'")
    #
    # possible_overlaps += CatRentalRequest.where("start_date < '#{self.start_date}' AND end_date > '#{self.end_date}'")

    # possible_overlaps.distinct
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:range] << "overlaps with approved rental request"
    else
      true
    end
  end
end
