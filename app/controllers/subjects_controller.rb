class SubjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_subject, only: [:show, :destroy]

  def index
    @subjects = Subject.all.order("created_at DESC")
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @subject.comments.includes(:user)
    ans1s = @subject.ans_1s
    ans2s = @subject.ans_2s
    ans3s = @subject.ans_3s
    @count1 = ans1s.count
    @count2 = ans2s.count
    @count3 = ans3s.count
    @counts = @count1 + @count2 + @count3
    @per1 = ((@count1/@counts.to_f) * 100).round(1)
    @per2 = ((@count2/@counts.to_f) * 100).round(1)
    @per3 = ((@count3/@counts.to_f) * 100).round(1)
  end

  def destroy
    @subject.destroy if @subject.user.id == current_user.id
    redirect_to root_path
  end

  def vote1
    subject_id = vote_params
    ans1 = Ans1.new(subject_id: subject_id, user_id: current_user.id)
    ans1.save
    redirect_to subject_path(subject_id)
  end

  def vote2
    subject_id = vote_params
    ans2 = Ans2.new(subject_id: subject_id, user_id: current_user.id)
    ans2.save
    redirect_to subject_path(subject_id)
  end

  def vote3
    subject_id = vote_params
    ans3 = Ans3.new(subject_id: subject_id, user_id: current_user.id)
    ans3.save
    redirect_to subject_path(subject_id)
  end
    
  private
  
  def subject_params
    params.require(:subject).permit(:title, :text).merge(user_id: current_user.id)
  end

  def vote_params
    params.require(:id)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

end
