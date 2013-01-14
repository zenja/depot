class Product < ActiveRecord::Base
  default_scope :order => 'title'

  validates :title, :description, :image_url, :price, :presence => true
  validates :price, :numericality => {:great_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => "must be a url for GIF, JPG, or PNG image"
  }

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_items

  private

  def ensure_not_referenced_by_any_line_items
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line item present')
      return false
    end
  end

end
