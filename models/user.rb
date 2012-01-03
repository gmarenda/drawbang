class User
  def initialize(user)
    @user = user
  end
  
  def save
    REDIS.set @user.delete(:key), @user.to_json
    @user # NOTE: SET can't fail (http://redis.io/commands/set)
  end
  
  def self.find(id)
    find_by_key(key(id))
  end
  
  def self.find_by_key(key)
    user = REDIS.get(key)
    JSON.parse(user) unless user.nil?
  end
  
  def self.update(key, hash)
    user = User.find_by_key(key)
    return nil unless user
    User.new(user.merge(:key => key).merge(hash)).save
  end
  
  def self.key(id)
    "user:#{id}"
  end
end