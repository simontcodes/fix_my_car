class HistoryController < ApplicationController
  def index
    @completed_jobs = []
    @jobs = Job.all
    @jobs.each do |job|
      if job.completed?
        @completed_jobs << job
      end
    end
  end
end
