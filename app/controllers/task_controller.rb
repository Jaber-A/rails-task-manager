class TaskController < ApplicationController
    def index
        @tasks = Tasks.all
    end
end
