class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :current_user

  def index
    if teacher_signed_in?
      @conversations = Conversation.find_all_by_teacher_id(@current_user.id)
    elsif volunteer_signed_in?
      @conversations = Conversation.find_all_by_volunteer_id(@current_user.id)
    else
      @conversations = []
    end
    @conversations = @conversations.select { |conversation| !conversation.messages.empty? }
    respond_to do |format|
      format.html 
      format.json { render json: {}}
    end
  end

  def create
    @conversation = Conversation.new(params[:conversation])
   
    respond_to do |format|
      if @conversation.save
        format.html  { redirect_to(@conversation,
                      :notice => 'Conversation was successfully created.') }
        format.json  { render :json => @conversation,
                      :status => :created, :location => @conversation }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @conversation.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    if @conversation.messages.empty?
      redirect_to :controller => 'messages', :action => 'new', :volunteer_id => @conversation.volunteer_id, :teacher_id => @conversation.teacher_id
    else
      @from = @current_user.email
      if teacher_signed_in?
        @to = @conversation.volunteer.email
        @conversation.update_attributes(:t_read => true)
        @conversation.save
      elsif volunteer_signed_in?
        @to = @conversation.teacher.email
        @conversation.update_attributes(:v_read => true)
        @conversation.save
      end
      @messages = @conversation.messages
      for message in @messages
        if message.to == @from
          message.update_attributes(:was_read => true)
          message.save
        end
      end

      @message = Message.new(:to => @to, :from => @from)
      respond_to do |format|
        format.html  # show.html.erb
        format.json  { render :json => @messages }
      end
    end
  end

  def new
    @conversation = Conversation.new(:volunteer_id => params[:volunteer_id], :teacher_id => params[:teacher_id])
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

