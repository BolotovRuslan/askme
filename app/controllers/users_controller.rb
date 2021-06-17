class UsersController < ApplicationController
  def index
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
  end
end
