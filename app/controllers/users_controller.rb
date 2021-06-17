class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Vadim',
        username: 'installero',
        avatar_url: 'https://secure.gravatar.com/avatar/' \
          '71269686e0f757ddb4f73614f43ae445?s=100'
      ),
      User.new(id: 2, name: 'Misha', username: 'aristofun')
    ]    
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Ruslan',
      username: 'lancer11',
      avatar_url: 'https://i.vimeocdn.com/portrait/19759422_640x640'
      )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('16.06.2021')),
      Question.new(text: 'Гулять идем?', created_at: Date.parse('16.06.2021')),
    ]

    @new_question = Question.new
  end
end
