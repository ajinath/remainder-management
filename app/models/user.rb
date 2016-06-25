class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :groups, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :templates, dependent: :destroy

  scope :pending_users, ->{ where(status: 'pending') }
  scope :order_by_created_at, ->{ order(created_at: :desc) }

  STATUS = ['pending', 'approved', 'blocked']
  def approved?
  	status == "approved"
  end

  def blocked?
  	status == "blocked"
  end

  def active_for_authentication?
  	super && approved? 
  end

  def inactive_message
  	return :blocked if blocked?
  	unless approved?
  	  :not_approved
  	else
  	  super
  	end
  end
end
