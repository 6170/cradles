class MessagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :current_user

  def index
    respond_to do |format|
      format.html 
      format.json { render json: {}}
    end
  end

  def show
    @message = Message.find(params[:id])
    redirect_to :controller => 'conversations', :action => 'show', :id => @message.conversation_id
  end

  def create
    @message = Message.new(params[:message])
    @message.was_read = false
    respond_to do |format|
      if @message.save
        NotificationMailer.notification(@message).deliver
        if teacher_signed_in?
          @message.conversation.update_attributes(:v_read => false)
          @message.conversation.save
        elsif volunteer_signed_in?
          @message.conversation.update_attributes(:t_read => false)
          @message.conversation.save
        end
        format.html  { redirect_to(@message,
                      :notice => 'Message was successfully sent.') }
        format.json  { render :json => @message,
                      :status => :created, :location => @message }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @message.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def new
    @conversation = Conversation.find_by_volunteer_id_and_teacher_id(params[:volunteer_id], params[:teacher_id])
    @volunteer = Volunteer.find(params[:volunteer_id])
    @teacher = Teacher.find(params[:teacher_id])
    @message = Message.new(:to => @volunteer.email, :from => @teacher.email)
    respond_to do |format|
      format.html  # new.html.erb
    end
  end

  def authenticate_user!
    if !teacher_signed_in? and !volunteer_signed_in?
      redirect_to :controller => 'home'
    end
  end

  def current_user
    @current_user = current_volunteer || current_teacher
  end
end

