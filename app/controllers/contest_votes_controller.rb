class ContestVotesController < MainController

  layout false

  def create
    work = ContestWork.find(params[:contest_work_id])

    if work.blank? ||
      request.remote_ip.blank? ||
      request.user_agent.blank? ||
      request.user_agent.to_s.match(/\(.*https?:\/\/.*\)/) ||
      request.session_options[:id].blank?
      render :nothing => true and return
    end

    vote = ContestVote.new(:contest_work => work)
    vote.ip = [request.remote_ip, request.env["HTTP_X_FORWARDED_FOR"]].compact.join(', ')
    exist_votes = ContestVote.where(:ip => vote.ip, :contest_work_id => work.id)

    render :partial => 'contest_votes/votes', :locals => { :contest_work => work } and return if exist_votes.present?

    vote.user_agent = request.user_agent.to_s
    vote.session_id = request.session_options[:id].to_s
    vote.save

    render :partial => 'contest_votes/votes', :locals => { :contest_work => work } and return
  end

end
