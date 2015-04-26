module Main
  class TraditionalController < Volt::ModelController
    model :store

    def index
      Volt.logger.debug ":: traditional/index"
      self.model = store._projects.find
    end

    def new
      Volt.logger.debug ":: traditional/new"
      Volt.logger.debug self.model

      self.model = store._projects.buffer
      # load up data for the departments select menu
      store._departments.fetch.then do |result|
        page._departments = result
      end
    end

    def create
      Volt.logger.debug ":: traditional/create"
      model.save!.then do
        Volt.logger.debug "   -> new project saved!"
        flash._successes << "Successfully created a new project"
        redirect_to "/traditional"
      end.fail do |error|
        error.keys.each do |key|
          flash._errors << "#{key} #{error[key]}"
        end
      end
    end

    def show
      Volt.logger.debug ":: traditional/show"
      store._projects.where({ _id: params._id }).limit(1).then do |result|
        Volt.logger.debug "Found #{params._id}"
        self.model = result[0]
      end
    end

    def edit
      Volt.logger.debug ":: traditional/edit"
      store._projects.where({ _id: params._id }).limit(1).then do |result|
        Volt.logger.debug "Found #{params._id}"
        self.model = result[0].buffer
      end

      # load up data for the departments select menu
      store._departments.fetch.then do |result|
        page._departments = result
      end
    end

    def update
      Volt.logger.debug ":: traditional/update"
      model.save!.then do
        Volt.logger.debug "   -> updated project #{model._id}"
        flash._successes << "Successfully updated the project"
        redirect_to "/traditional"
      end.fail do |error|
        error.keys.each do |key|
          flash._errors << "#{key} #{error[key]}"
        end
      end
    end

    def destroy(index)
      Volt.logger.debug ":: traditional/destroy"
      # model was assigned the `store._projects.find` in index
      # and it still references that collection

      deleted_project = model.delete_at(index)
      Volt.logger.debug "   -> project #{deleted_project._id} deleted!"
    end
  end
end
