class Article < ApplicationRecord
    has_many :comments , dependent: :destroy
    validates :title,presence: true,length: {minimum: 5}
    validates :text, length: {minimum: 5}
    after_create :create_comment
    
    scope :active, -> {where(status: true)}
    #default_scope {where(status: false)}

    def sentence
        "#{self}"
    end


    private 

    def create_comment
        comment.create(commenter: 'Ruby',body: 'Ruby is on rails man!')
    end
end
