# Exercise 5

class Workflow

    def initialize(discussion)  
      @discussion = discussion
    end

    def run
      return unless valid?
      run_callbacks(:create) do
        ActiveRecord::Base.transaction do
          discussion.save!
          create_discussion_roles!
          @successful = true
        end
      end
    end

    def create_discussion_roles!()

    end

    def valid?()
        return discussion.valid?()
    end

  
end
class User
    def initialize(email,password)
        @email = email
        @password = password

    end

    def find()

    end

end

class Discussion 
    def initialize(title, host, participantEmails)
        @title = title
        @host = host
        @participants = generateParticipants(participantEmails)
    end

    def generateParticipants(participantEmails)
        users = []
        return if @participantEmails.blank?
        @participantEmails.split.uniq.map do |email_address|
        users.append(User.create(email: email_address.downcase, password: Devise.friendly_token))
        end
        return users
    end

    def save!()

    end

    def valid?()
        if @title !=nil && @host !=nil && @participants !=[]
            return true
        else return false
    end

end

  
  
 
  host = User.find(42)
  participants = "fake1@example.com\nfake2@example.com\nfake3@example.com"
  discussion = Discussion.new(title: "fake", host, participants)
  
  workflow = Workflow.new(discussion, host)
  workflow.run
  