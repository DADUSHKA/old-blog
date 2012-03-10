class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :confirmation_token, :auth_token
  has_secure_password

  validates :email, :email => true, :uniqueness => true, :allow_blank => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true

  state_machine :state, :initial => :new do
    state :new
    state :waiting_email_confirmation
    state :active

    event :email_confirmation_sended do
      transition :new => :waiting_email_confirmation
    end

    event :confirm do
      transition :waiting_email_confirmation => :active
    end

    event :activate do
      transition all => :active
    end
  end

  scope :active, with_states(:active)
  scope :non_blocked, with_states(:waiting_email_confirmation, :active)

  def generate_confirmation_token
    self.confirmation_token = SecureApp.generate_token
  end

  def generate_auth_token
    self.auth_token = SecureApp.generate_token
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_s
    full_name
  end
end
